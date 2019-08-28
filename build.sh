#!/bin/bash

echo '...开始构建...'

#添加本地改动 提交 推送到远程仓库
#推送到pod
podname=`ls | grep .podspec | awk -F "." '{print $1}'`
echo 'podname:' $podname

tag=`grep 'spec.version   '  ${podname}.podspec | awk -F '"' '{print $(NF-1)}'`
echo 'tag:' $tag

newtag=`echo $tag | awk -F '.' -v OFS=. 'NF==1{print ++$NF}; NF>1{if(length($NF+1)>length($NF))$(NF-1)++; $NF=sprintf("%0*d", length($NF), ($NF+1)%(10^length($NF))); print}'`
echo 'newtag:'  $newtag

#-i是原地修改文件的危险命令，需在双引号内提供扩展名备份，如果双引号内为空则不备份
sed -i "" "s/${tag}/${newtag}/g"  ${podname}.podspec

git pull
echo '拉取代码完成...'

echo '本地代码状态...'
git status

git add .
echo '添加代码完成...'

echo '已添加代码状态'
git status

while [ 1 ];
do
	if [[ -z ${comment} ]]; then
		#statements
		read -p '请输入更新日志：' comment
	else
		break
		#statements
	fi
done

git commit -m "${comment}"
echo '提交代码完成...'

git push
echo '推送完成...'

#push tag
echo 'push tag:' $newtag
echo 'tag推送完成...'

git tag $newtag
git push --tags

if [ $? -ne 0 ]; then
	echo '推送tag失败，请检查配置'
	exit 1
	#statements
fi
echo ${podname}.podspec
pod trunk push ${podname}.podspec  --allow-warnings


echo '...构建结束...'

//
//  EmptyDisplayView.m
//  FYTICKET
//
//  Created by pengkang on 16/9/12.
//  Copyright © 2016年 ZXH. All rights reserved.
//



#import "Masonry.h"
#import "EmptyDisplayView.h"

@interface EmptyDisplayView()

@property(nonatomic,strong)UIImageView *emptyImageV;


@end


@implementation EmptyDisplayView

-(instancetype)init{
    self = [super init];
    if (self) {
        [self initSubview];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self initSubview];
    }
    return self;
}


-(void)initSubview{
    
    _detailTopOffset = 15;
    _titleCenterYOffset = 0;
    _imageBottomOffset = 20;
    _buttonTopOffset = 15;
    _buttonSize = CGSizeMake(68, 32);
    _superInsets = UIEdgeInsetsZero;
    _customViewCenterOffset = CGPointZero;
    
    self.backgroundColor = [UIColor clearColor];
    self.translatesAutoresizingMaskIntoConstraints = NO;
    self.userInteractionEnabled = NO;
    
    self.actionbtn.hidden = YES;
    [self reloadView];
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGesture)];
    [self addGestureRecognizer:tap];
}


-(void)reloadView{
    
    if (_customView) {
        return;
    }
    
    [self addSubview:self.emptyImageV];
    [self addSubview:self.titleLabel];
    [self addSubview:self.detailLabel];
    [self addSubview:self.actionbtn];
    
    [self.titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.centerY.equalTo(self.mas_centerY).offset(self.titleCenterYOffset);
        make.left.mas_greaterThanOrEqualTo(self).offset(15);
        make.right.mas_lessThanOrEqualTo(self).offset(-15);
    }];
    
    [self.emptyImageV mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.titleLabel.mas_top).offset(-self.imageBottomOffset);
        make.centerX.equalTo(self.mas_centerX);
    }];
    
    [self.detailLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(self.detailTopOffset);
        make.centerX.equalTo(self.mas_centerX);
        make.left.mas_greaterThanOrEqualTo(self).offset(15);
        make.right.mas_lessThanOrEqualTo(self).offset(-15);
    }];
    
    [self.actionbtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.detailLabel.mas_bottom).offset(-self.buttonTopOffset);
        make.size.mas_equalTo(self.buttonSize);
        make.centerX.equalTo(self.mas_centerX);
    }];
}

-(void)didMoveToSuperview{
    if (!self.superview) {
        return;
    }
    [self mas_updateConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.superview);
        make.width.equalTo(self.superview.mas_width).offset(-self.superInsets.left-self.superInsets.right);
        make.height.equalTo(self.superview.mas_height).offset(-self.superInsets.bottom-self.superInsets.top);
    }];
}

#pragma mark tap emptyview
-(void)tapGesture{
    if (self.reloadBlock) {
        self.reloadBlock();
    }
}

#pragma mark setter
-(void)setTitleCenterYOffset:(float)titleCenterYOffset{
    _titleCenterYOffset = titleCenterYOffset;
    if (!_titleLabel||![self.subviews containsObject:_titleLabel]) {
        return;
    }
    [self.titleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY).offset(titleCenterYOffset);
    }];
}

-(void)setImageBottomOffset:(float)imageBottomOffset{
    _imageBottomOffset = imageBottomOffset;
    if (!_emptyImageV||![self.subviews containsObject:_emptyImageV]) {
        return;
    }
    [self.emptyImageV mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.titleLabel.mas_top).offset(-imageBottomOffset);
    }];
}

-(void)setDetailTopOffset:(float)detailTopOffset{
    _detailTopOffset = detailTopOffset;
    if (!_detailLabel||![self.subviews containsObject:_detailLabel]) {
        return;
    }
    [self.detailLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(detailTopOffset);
    }];
}

-(void)setButtonTopOffset:(float)buttonTopOffset{
    _buttonTopOffset = buttonTopOffset;
    if (!_actionbtn||![self.subviews containsObject:_actionbtn]) {
        return;
    }
    [self.actionbtn mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.detailLabel.mas_bottom).offset(buttonTopOffset);
    }];
}


-(void)setImageName:(NSString *)imageName{
    _imageName = imageName;
    
    self.emptyImageV.image = [UIImage imageNamed:imageName];
    
}

-(void)setDetailText:(NSString *)detailText{
    _detailText = detailText;
    
    self.detailLabel.text = detailText;
}

-(void)setTitleText:(NSString *)titleText{
    _titleText = titleText;
    
    self.titleLabel.text = titleText;
}

-(void)setButtonText:(NSString *)buttonText{
    _buttonText = buttonText;
    
    self.actionbtn.hidden = NO;
    [self.actionbtn setTitle:self.buttonText forState:UIControlStateNormal];
}

-(void)setDetailTextColor:(UIColor *)detailTextColor{
    self.detailLabel.textColor = detailTextColor;
}

-(void)setState:(EmptyState)state{
    _state = state;
    
    switch (state) {
        case EmptyStateNoData:{
            self.titleText = @"暂无数据";
            self.detailText = @"";
            self.imageName = @"empty";
        }
            
            break;
        case EmptyStateNoNetWork:{
            self.titleText = @"网络开小差了" ;
            self.detailText = @"点击空白处刷新试试";
            self.imageName = @"empty_nonetwork";
        }
            break;
        default:{
            self.titleText = @"暂无数据";
            self.detailText = @"";
            self.imageName = @"empty";
        }
            
            break;
    }
    
}


#pragma mark getter
-(void)setCustomView:(UIView *)customView{
    _customView = customView;
    if (!customView) {
        return;
    }
    
    {
        [self.emptyImageV removeFromSuperview];
        [self.titleLabel removeFromSuperview];
        [self.detailLabel removeFromSuperview];
        [self.actionbtn removeFromSuperview];
    }
    
    [self addSubview:customView];
    [customView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self).offset(self.customViewCenterOffset.x);
        make.centerY.equalTo(self).offset(self.customViewCenterOffset.y);
        if (!CGSizeEqualToSize(CGSizeZero, customView.frame.size)) {
            make.size.mas_equalTo(customView.frame.size);
        }
    }];
    
}


-(UIImageView *)emptyImageV{
    
    if (!_emptyImageV) {
        _emptyImageV = [[UIImageView alloc]init];
        _emptyImageV.contentMode = UIViewContentModeScaleAspectFit;
        _emptyImageV.image = [UIImage imageNamed:self.imageName];
    }
    return _emptyImageV;
}
-(UILabel *)titleLabel{
    
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.numberOfLines = 0;
        _titleLabel.textColor =  [UIColor colorWithRed:187/255.0 green:187/255.0 blue:187/255.0 alpha:1.0];
        _titleLabel.textAlignment =  NSTextAlignmentCenter;
        _titleLabel.font = [UIFont systemFontOfSize:14];
        _titleLabel.text = self.titleText;
    }
    return _titleLabel;
}

-(UILabel *)detailLabel{
    
    if (!_detailLabel) {
        _detailLabel = [[UILabel alloc]init];
        _detailLabel.numberOfLines = 0;
        _detailLabel.textColor = [UIColor colorWithRed:187/255.0 green:187/255.0 blue:187/255.0 alpha:1.0];
        _detailLabel.textAlignment =  NSTextAlignmentCenter;
        _detailLabel.font = [UIFont systemFontOfSize:14];
        _detailLabel.text = self.detailText;
    }
    return _detailLabel;
}


-(UIButton *)actionbtn{
    
    if (!_actionbtn) {
        _actionbtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_actionbtn setTitleColor:[UIColor lightTextColor] forState:UIControlStateNormal];
        [_actionbtn setBackgroundColor:[UIColor lightGrayColor]];
        _actionbtn.layer.cornerRadius = 3;
        [_actionbtn setTitle:self.buttonText forState:UIControlStateNormal];
        
    }
    return _actionbtn;
}


@end

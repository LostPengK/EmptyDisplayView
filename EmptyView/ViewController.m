//
//   路漫漫其修远兮，吾将上下而求索
//
//   ViewController.m
//   EmptyView
//
//   Created  by pengkang on 2019/7/9
//   Copyright © 2019 qhht. All rights reserved.
//
    

#import "ViewController.h"
#import "EmptyDisplayView.h"
#import <Masonry.h>
#import <objc/runtime.h>
#import "UIView+EmptyView.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)EmptyDisplayView *emptyView;
@property(nonatomic,strong)UITableView *tableView;
@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.tableView];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    [self.tableView showEmptyView];
    self.tableView.emptyView.titleText = @"2019-07-10 16:34:02.958614+0800 EmptyView[96490:1191046] UITableView 2019-07-10 16:34:02.958614+0800 EmptyView[96490:1191046] UITableView";
    self.tableView.emptyView.detailText = @"454544646464646464564+6489\n4454544646464646464564\n454544646464646464564 ";
    self.tableView.emptyView.detailTopOffset = 50;
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    
    NSLog(@"viewDidLayoutSubviews==%@",NSStringFromCGRect(self.tableView.frame));
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
    
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}
    
    
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    
    return cell;
}
    
-(EmptyDisplayView *)emptyView{
    if (!_emptyView) {
        _emptyView = [[EmptyDisplayView alloc]init];
        _emptyView.backgroundColor = [UIColor whiteColor];
        _emptyView.state = EmptyStateNoData;
    }
    return _emptyView;
}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView  = [[UITableView alloc]init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

@end

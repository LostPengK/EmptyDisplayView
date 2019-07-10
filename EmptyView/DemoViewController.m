//
//   路漫漫其修远兮，吾将上下而求索
//
//   DemoViewController.m
//   EmptyView
//
//   Created  by pengkang on 2019/7/10
//   Copyright © 2019 qhht. All rights reserved.
//
    

#import "DemoViewController.h"
#import "UIView+EmptyView.h"
@interface DemoViewController ()
@property (weak, nonatomic) IBOutlet UIView *vo;
@property (weak, nonatomic) IBOutlet UIView *v1;
@property (weak, nonatomic) IBOutlet UIView *v2;

@end

@implementation DemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.vo.emptyView.state = EmptyStateNoData;
    self.v1.emptyView.state = EmptyStateNoNetWork;
    self.v2.emptyView.titleText = @"edit your message here";
    self.v2.emptyView.imageName = nil;
    
    [self.vo showEmptyView];
    [self.v1 showEmptyView];
    [self.v2 showEmptyView];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

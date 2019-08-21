//
//   路漫漫其修远兮，吾将上下而求索
//
//   UITableView+EmptyView.m
//   EmptyView
//
//   Created  by pengkang on 2019/7/10
//   Copyright © 2019 qhht. All rights reserved.
//
    

#import "UITableView+EmptyView.h"
#import <objc/runtime.h>
#import "UIView+EmptyView.h"

@implementation UITableView (EmptyView)

+(void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSLog(@"UITableView (EmptyView) load");
        Method m0 = class_getInstanceMethod(self, @selector(reloadData));
        Method m1 = class_getInstanceMethod(self, @selector(empty_reloadData));
        method_exchangeImplementations(m0, m1);
        
        Method mm0 = class_getInstanceMethod(self, @selector(reloadRowsAtIndexPaths:withRowAnimation:));
        Method mm1 = class_getInstanceMethod(self, @selector(empty_reloadRowsAtIndexPaths:withRowAnimation:));
        method_exchangeImplementations(mm0, mm1);
        
        Method mmm0 = class_getInstanceMethod(self, @selector(reloadSections:withRowAnimation:));
        Method mmm1 = class_getInstanceMethod(self, @selector(empty_reloadSections:withRowAnimation:));
        method_exchangeImplementations(mmm0, mmm1);
    });
  
}

-(NSInteger)itemCount{
    NSInteger rowTotal = 0;
    
    if([self.dataSource numberOfSectionsInTableView:self]){
        for (NSInteger i = 0 ; i < [self.dataSource numberOfSectionsInTableView:self]; i++) {
            rowTotal += [self.dataSource tableView:self numberOfRowsInSection:i];
        }
    }
    
    return rowTotal;
}

-(void)refreshEmptyStatus{
    if ([self itemCount] == 0) {
        [self showEmptyView];
    }else{
        [self hideEmptyView];
    }
}

-(void)empty_reloadData{
    [self refreshEmptyStatus];
    [self empty_reloadData];
}

-(void)empty_reloadRowsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation{
    [self refreshEmptyStatus];
    [self empty_reloadRowsAtIndexPaths:indexPaths withRowAnimation:animation];
}

- (void)empty_reloadSections:(NSIndexSet *)sections withRowAnimation:(UITableViewRowAnimation)animation{
    [self refreshEmptyStatus];
    [self empty_reloadSections:sections withRowAnimation:animation];
}

@end

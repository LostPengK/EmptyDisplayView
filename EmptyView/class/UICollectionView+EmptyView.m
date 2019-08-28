//
//   路漫漫其修远兮，吾将上下而求索
//
//   UICollectionView+EmptyView.m
//   EmptyView
//
//   Created  by pengkang on 2019/7/10
//   Copyright © 2019 qhht. All rights reserved.
//
    

#import "UICollectionView+EmptyView.h"
#import <objc/runtime.h>
#import "UIView+EmptyView.h"

@implementation UICollectionView (EmptyView)

+(void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSLog(@"UITableView (EmptyView) load");
        Method m0 = class_getInstanceMethod(self, @selector(reloadData));
        Method m1 = class_getInstanceMethod(self, @selector(empty_reloadData));
        method_exchangeImplementations(m0, m1);
        
        Method mm0 = class_getInstanceMethod(self, @selector(reloadSections:));
        Method mm1 = class_getInstanceMethod(self, @selector(empty_reloadSections:));
        method_exchangeImplementations(mm0, mm1);
        
        Method mmm0 = class_getInstanceMethod(self, @selector(reloadItemsAtIndexPaths:));
        Method mmm1 = class_getInstanceMethod(self, @selector(empty_reloadItemsAtIndexPaths:));
        method_exchangeImplementations(mmm0, mmm1);
    });
    
}

-(NSInteger)itemCount{
    
    NSInteger rowTotal = 0;
    
    NSInteger numberSection = 0;
    if (self.dataSource && [self.dataSource respondsToSelector:@selector(numberOfSectionsInCollectionView:)]) {
        numberSection = [self.dataSource numberOfSectionsInCollectionView:self];
    }
    
    if (self.dataSource && [self.dataSource respondsToSelector:@selector(collectionView:numberOfItemsInSection:)]) {
        for (NSInteger i = 0 ; i < numberSection; i++) {
            rowTotal += [self.dataSource collectionView:self numberOfItemsInSection:i];
        }
    }
    return rowTotal;
}


-(void)refreshEmptyStatus{
    if ([self itemCount] == 0 && [self displayEmptyView]) {
        [self showEmptyView];
    }else{
        [self hideEmptyView];
    }
}

-(void)empty_reloadData{
    [self refreshEmptyStatus];
    [self empty_reloadData];
}

-(void)empty_reloadSections:(NSIndexSet *)sections{
    [self refreshEmptyStatus];
    [self empty_reloadSections:sections];
}

-(void)empty_reloadItemsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths{
    [self refreshEmptyStatus];
    [self empty_reloadItemsAtIndexPaths:indexPaths];
}


@end

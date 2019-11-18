//
//   路漫漫其修远兮，吾将上下而求索
//
//   UIView+EmptyView.h
//   EmptyView
//
//   Created  by pengkang on 2019/7/9
//   Copyright © 2019 qhht. All rights reserved.
//
    

#import <UIKit/UIKit.h>
#import "PKEmptyDisplayView.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIView (EmptyView)

@property(nonatomic,nullable) PKEmptyDisplayView *emptyView;

/**
 default is no for uiview view and yes for scrollview and it's subclass
 */
@property(nonatomic) BOOL displayEmptyView;

-(void)showEmptyView;

-(void)hideEmptyView;

@end

NS_ASSUME_NONNULL_END

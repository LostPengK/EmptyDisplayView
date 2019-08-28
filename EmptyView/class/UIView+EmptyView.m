//
//   路漫漫其修远兮，吾将上下而求索
//
//   UIView+EmptyView.m
//   EmptyView
//
//   Created  by pengkang on 2019/7/9
//   Copyright © 2019 qhht. All rights reserved.
//
    

#import "UIView+EmptyView.h"
#import <objc/runtime.h>

static NSString *EmptyViewKey = @"EmptyViewKey";
static NSString *DisplayEmptyViewKey = @"DisplayEmptyViewKey";

@implementation UIView (EmptyView)

//+(void)load{
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        NSLog(@"UIView (EmptyView) load");
//        Method m0 = class_getInstanceMethod(self, @selector(layoutSubviews));
//        Method m1 = class_getInstanceMethod(self, @selector(empty_layoutSubviews));
//        method_exchangeImplementations(m0, m1);
//
//
//
//    });
//   unsigned int  count = 0;
//   Method *methods =  class_copyMethodList(self, &count);
//    for (int i = 0; i < count; i++) {
//        Method mm = methods[i];
//        const char *name = sel_getName(method_getName(mm)) ;
//
//        NSLog(@"method_getName===%@",[NSString stringWithUTF8String:name]);
//    }
//
//}


-(void)empty_layoutSubviews{
    if (self.emptyView) {
        self.emptyView.frame = self.bounds;
    }
    [self empty_layoutSubviews];
}

-(void)setEmptyView:(EmptyDisplayView *)emptyView{
    objc_setAssociatedObject(self, &EmptyViewKey, emptyView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(EmptyDisplayView *)emptyView{
    EmptyDisplayView *v = objc_getAssociatedObject(self, &EmptyViewKey);
    
    if (v) {
        return v;
    }
    
    v = [[EmptyDisplayView alloc]init];
    v.state = EmptyStateNoData;
    self.emptyView = v;
    return v;
}

-(void)setDisplayEmptyView:(BOOL)displayEmptyView{
    objc_setAssociatedObject(self, &DisplayEmptyViewKey, @(displayEmptyView), OBJC_ASSOCIATION_COPY_NONATOMIC);

}

-(BOOL)displayEmptyView{
     return [objc_getAssociatedObject(self, &DisplayEmptyViewKey) boolValue];
}

-(void)showEmptyView{
    if (!self.displayEmptyView) {
        return;
    }
    [self addSubview:self.emptyView];
    [self bringSubviewToFront:self.emptyView];
    
}

-(void)hideEmptyView{
    if (self.emptyView) {
        [self.emptyView removeFromSuperview];
//        self.emptyView = nil;
    }
}

@end

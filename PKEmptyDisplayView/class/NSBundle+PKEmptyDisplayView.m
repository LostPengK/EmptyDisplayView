//
//  NSBundle+PKEmptyDisplayView.m
//  EmptyView
//
//  Created by mac on 2019/11/18.
//  Copyright © 2019 qhht. All rights reserved.
//

#import "NSBundle+PKEmptyDisplayView.h"
#import "PKEmptyDisplayView.h"

@implementation NSBundle (PKEmptyDisplayView)

+ (instancetype)pk_emptyDisplayViewBundle
{
    static NSBundle *emptyDisplayViewBundle = nil;
    if (emptyDisplayViewBundle == nil) {
        emptyDisplayViewBundle = [NSBundle bundleWithPath:[[NSBundle bundleForClass:[PKEmptyDisplayView class]] pathForResource:@"PKEmptyDisplayView" ofType:@"bundle"]];
    }
    return emptyDisplayViewBundle;
}

+ (UIImage *)pk_bundleImageForName:(NSString *)imageName
{
    static UIImage *image = nil;
    if (image == nil) {
        image = [[UIImage imageWithContentsOfFile:[[self pk_emptyDisplayViewBundle] pathForResource:imageName ofType:@"png"]] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    }
    return image;
}


@end

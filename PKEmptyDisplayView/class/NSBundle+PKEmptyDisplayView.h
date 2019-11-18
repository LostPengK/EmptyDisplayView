//
//  NSBundle+PKEmptyDisplayView.h
//  EmptyView
//
//  Created by mac on 2019/11/18.
//  Copyright © 2019 qhht. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSBundle (PKEmptyDisplayView)

+ (UIImage *)pk_bundleImageForName:(NSString *)imageName;

@end

NS_ASSUME_NONNULL_END

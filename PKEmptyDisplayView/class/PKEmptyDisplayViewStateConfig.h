//
//  PKEmptyDisplayViewStateConfig.h
//  EmptyView
//
//  Created by mac on 2019/11/18.
//  Copyright © 2019 qhht. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "NSBundle+PKEmptyDisplayView.h"
NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, EmptyState) {
    EmptyStateDefault,
    EmptyStateNoData,
    EmptyStateNoNetWork,
};

static NSString *titleTextKey = @"titleTextKey";
static NSString *detailTextKey = @"detailTextKey";
static NSString *imageNameKey = @"imageNameKey";
static NSString *bundleiImageNameKey =  @"bundleiImageNameKey";

@interface PKEmptyDisplayViewStateConfig : NSObject

+(instancetype)shareInstance;

+(NSDictionary *)configForState:(EmptyState)state;

/// add config
/// @param state state
/// @param config config {}
-(void)addState:(EmptyState)state config:(NSDictionary *)config;

-(void)removeState:(EmptyState)state;

@end

NS_ASSUME_NONNULL_END

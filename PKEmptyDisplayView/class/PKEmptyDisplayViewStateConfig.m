//
//  PKEmptyDisplayViewStateConfig.m
//  EmptyView
//
//  Created by mac on 2019/11/18.
//  Copyright © 2019 qhht. All rights reserved.
//

#import "PKEmptyDisplayViewStateConfig.h"

@interface PKEmptyDisplayViewStateConfig()

@property(nonatomic,strong) NSMutableDictionary *stateConfig;

@end

@implementation PKEmptyDisplayViewStateConfig

+(instancetype)shareInstance{
    static PKEmptyDisplayViewStateConfig *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[[self class] alloc]init];
    });
    return instance;
}

+(NSDictionary *)configForState:(EmptyState)state{
    return [PKEmptyDisplayViewStateConfig shareInstance].stateConfig[@(state).stringValue];
}

-(void)addState:(EmptyState)state config:(NSDictionary *)config{
    if (!config){return;};
    [[PKEmptyDisplayViewStateConfig shareInstance].stateConfig setValue:config forKey: @(state).stringValue];
}

-(void)removeState:(EmptyState)state{
    [[PKEmptyDisplayViewStateConfig shareInstance].stateConfig removeObjectForKey:@(state).stringValue];
}

-(NSMutableDictionary *)stateConfig{
    if (!_stateConfig) {
        _stateConfig = [[NSMutableDictionary alloc]init];
    }
    return _stateConfig;
}

@end

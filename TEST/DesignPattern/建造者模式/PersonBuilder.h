//
//  PersonBuilder.h
//  Design Pattern
//
//  Created by zhangjikuan on 16/9/19.
//  Copyright © 2016年 zhang_jk. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PersonBuilder <NSObject>

/**
 创建头部
 */
- (void)buildHead;

/**
 创建身体
 */
- (void)buildBody;

/**
 创建左手
 */
- (void)buildArmLeft;

/**
 创建右手
 */
- (void)buildArmRight;

/**
 创建左腿
 */
- (void)buildLegLeft;

/**
 创建右手
 */
- (void)buildLegRight;

@end

//
//  Subject.h
//  Design Pattern
//
//  Created by zhangjikuan on 16/9/22.
//  Copyright © 2016年 zhang_jk. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 通过block 由客户端根据自己的情况作出处理
 */
typedef void(^UpdateBlock)();

/**
 抽象类
 */
@interface Subject : NSObject
@property (nonatomic, copy) NSString *action;
@property (nonatomic, copy)UpdateBlock update;

/**
 通知
 */
- (void) notify;

@end

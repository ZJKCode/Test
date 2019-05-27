//
//  OperationFactory.h
//  Design Pattern
//
//  Created by zhangjikuan on 16/8/31.
//  Copyright © 2016年 zhang_jk. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Operation;
@interface OperationFactory : NSObject
+ (Operation *)createOperate:(NSString *)operate;

@end

//
//  IFactory.h
//  Design Pattern
//
//  Created by zhangjikuan on 16/9/2.
//  Copyright © 2016年 zhang_jk. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LeiFeng;

/*!
 *  协议定义接口
 */
@protocol IFactory <NSObject>

+ (LeiFeng *)createLeiFeng;

@end

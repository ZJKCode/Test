//
//  Proxy.h
//  Design Pattern
//
//  Created by zhangjikuan on 16/9/1.
//  Copyright © 2016年 zhang_jk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GiveGift.h"
#import "SchoolGirl.h"

/*!
 *  代理类 为其他对象 提供一种代理以控制对对这个对象的访问
 */
@interface Proxy : NSObject<GiveGift>
- (instancetype)initWithProxy:(SchoolGirl *)mm;


@end

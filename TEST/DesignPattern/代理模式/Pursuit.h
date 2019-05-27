//
//  Pursuit.h
//  Design Pattern
//
//  Created by zhangjikuan on 16/9/1.
//  Copyright © 2016年 zhang_jk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GiveGift.h"
#import "SchoolGirl.h"

/*!
 *  追求者 去实现送礼物的接口
 */
@interface Pursuit : NSObject<GiveGift>
- (instancetype)initWithPursuit:(SchoolGirl *)mm;


@end

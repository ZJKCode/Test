//
//  GiveGift.h
//  Design Pattern
//
//  Created by zhangjikuan on 16/9/1.
//  Copyright © 2016年 zhang_jk. All rights reserved.
//

#import <Foundation/Foundation.h>

/*!
 *  接口定义
 */
@protocol GiveGift <NSObject>
/*!
 *  送玩具
 */
- (void)giveDolls;
/*!
 *  送花
 */
- (void)giveFlowers;
/*!
 *  送巧克力
 */
- (void)giveChocolate;

@end

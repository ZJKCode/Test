//
//  CashNomal.h
//  Design Pattern
//
//  Created by zhangjikuan on 16/8/31.
//  Copyright © 2016年 zhang_jk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CashSuper.h"
/*!
 * 正常收费
 */
@interface CashNomal : NSObject<CashSuper>
-(double)acceptCash:(double)money;
@end

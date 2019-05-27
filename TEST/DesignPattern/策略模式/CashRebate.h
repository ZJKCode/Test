//
//  CashRebate.h
//  Design Pattern
//
//  Created by zhangjikuan on 16/8/31.
//  Copyright © 2016年 zhang_jk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CashSuper.h"
/*!
 *  打折收费
 */
@interface CashRebate : NSObject<CashSuper>
- (void)cashRebate:(NSString *)moneyRebate;
-(double)acceptCash:(double)money;

@end

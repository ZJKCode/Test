//
//  CashRebate.m
//  Design Pattern
//
//  Created by zhangjikuan on 16/8/31.
//  Copyright © 2016年 zhang_jk. All rights reserved.
//

#import "CashRebate.h"

@interface CashRebate ()
@property (nonatomic, assign) double moneyRebate;
@end

@implementation CashRebate
-(void)cashRebate:(NSString *)moneyRebate
{
    _moneyRebate = [moneyRebate doubleValue];
}
-(double)acceptCash:(double)money
{
    return money*_moneyRebate;

}
@end

//
//  CashReturn.m
//  Design Pattern
//
//  Created by zhangjikuan on 16/8/31.
//  Copyright © 2016年 zhang_jk. All rights reserved.
//

#import "CashReturn.h"

@interface CashReturn ()
@property (nonatomic, assign) double moneyCondation;
@property (nonatomic, assign) double moneyReturn;


@end

@implementation CashReturn

- (void)cashReturnCondation:(NSString *)moneyCondation return:(NSString *)moneyReturn;
{
    _moneyCondation = [moneyCondation doubleValue];
    _moneyReturn = [moneyReturn doubleValue];
    
}

- (double)acceptCash:(double)money
{
    double result = money;
    if (money>=_moneyCondation) {
        result = money- fabs(money/_moneyCondation)*_moneyReturn;
    }
    return result;
}

@end

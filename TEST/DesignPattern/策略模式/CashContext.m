//
//  CashContext.m
//  Design Pattern
//
//  Created by zhangjikuan on 16/8/31.
//  Copyright © 2016年 zhang_jk. All rights reserved.
//

#import "CashContext.h"
#import "CashNomal.h"
#import "CashRebate.h"
#import "CashReturn.h"

@interface CashContext ()
@property (nonatomic, assign) id<CashSuper> cashSuper;
@end

@implementation CashContext
- (void) cashContext:(id<CashSuper>)cashSuper
{
    _cashSuper = cashSuper;
}
- (double)getResult:(double)money
{
    return [_cashSuper acceptCash:money];
}

- (void) cashContext1:(NSString *)type
{
    NSInteger _type = [type integerValue];
    switch (_type) {
        case 1:
        {
            CashNomal *normal = [[CashNomal alloc] init];
            [self cashContext:normal];
        }
            _cashSuper = (id<CashSuper>)[[CashNomal alloc] init];
            break;
        case 2:{
            CashRebate *rebate = [[CashRebate alloc] init];
            [rebate cashRebate:@"0.8"];
            [self cashContext:rebate];

        }
            break;
        case 3:{
            CashReturn *moneyReturn = [[CashReturn alloc] init];
            [moneyReturn cashReturnCondation:@"300" return:@"100"];
            [self cashContext:moneyReturn];

        }
            break;

        default:
            break;
    }
}
@end

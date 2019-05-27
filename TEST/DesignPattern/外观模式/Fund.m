//
//  Fund.m
//  Design Pattern
//
//  Created by zhangjikuan on 16/9/5.
//  Copyright © 2016年 zhang_jk. All rights reserved.
//

#import "Fund.h"
#import "Stock1.h"
#import "Stock2.h"
#import "Stock3.h"
#import "NationalDebt1.h"
#import "Realty1.h"

@interface Fund ()
@property (nonatomic, strong) Stock1 *stock1;
@property (nonatomic, strong) Stock2 *stock2;
@property (nonatomic, strong) Stock3 *stock3;
@property (nonatomic, strong) NationalDebt1 *nationalDebt1;
@property (nonatomic, strong) Realty1 *realty1;
@end

@implementation Fund

- (instancetype)init
{
    self = [super init];
    if (self) {
        _stock1 = [[Stock1 alloc] init];
        _stock2 = [[Stock2 alloc] init];
        _stock3 = [[Stock3 alloc] init];
        _nationalDebt1 = [[NationalDebt1 alloc] init];
        _realty1 = [[Realty1 alloc] init];
        
    }
    return self;
}

- (void)buyFund
{
    [_stock1 buy];
    [_stock2 buy];
    [_stock3 buy];
    [_nationalDebt1 buy];
    [_realty1 buy];
}

- (void)sellFund
{
    [_stock1 sell];
    [_stock2 sell];
    [_stock3 sell];
    [_nationalDebt1 sell];
    [_realty1 sell];
}

@end

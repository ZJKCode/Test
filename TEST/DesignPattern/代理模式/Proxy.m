//
//  Proxy.m
//  Design Pattern
//
//  Created by zhangjikuan on 16/9/1.
//  Copyright © 2016年 zhang_jk. All rights reserved.
//

#import "Proxy.h"
#import "Pursuit.h"

@interface Proxy ()
@property (nonatomic, strong) Pursuit *gg;

@end
@implementation Proxy

- (instancetype)initWithProxy:(SchoolGirl *)mm
{
    self = [super init];
    if (self) {
        _gg = [[Pursuit alloc] initWithPursuit:mm];
    }
    return self;
}

- (void)giveDolls
{
    [_gg giveDolls];

}

- (void)giveFlowers
{
    [_gg giveFlowers];

}
-(void)giveChocolate
{
    [_gg giveChocolate];

}
@end

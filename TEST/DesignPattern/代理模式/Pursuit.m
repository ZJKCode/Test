//
//  Pursuit.m
//  Design Pattern
//
//  Created by zhangjikuan on 16/9/1.
//  Copyright © 2016年 zhang_jk. All rights reserved.
//

#import "Pursuit.h"

@interface Pursuit ()
@property (nonatomic, strong) SchoolGirl *mm;
@end
@implementation Pursuit

- (instancetype)initWithPursuit:(SchoolGirl *)mm
{
    self = [super init];
    if (self) {
        _mm= mm;
    }
    return self;
}

-(void)giveDolls
{
    NSLog(@"%@送你洋娃娃",_mm.name);
}

- (void)giveFlowers
{
    NSLog(@"%@送你鲜花",_mm.name);
}

- (void)giveChocolate
{
    NSLog(@"%@送你巧克力",_mm.name);
}
@end

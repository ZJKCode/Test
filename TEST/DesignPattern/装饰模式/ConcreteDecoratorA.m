//
//  ConcreteDecoratorA.m
//  Design Pattern
//
//  Created by zhangjikuan on 16/9/1.
//  Copyright © 2016年 zhang_jk. All rights reserved.
//

#import "ConcreteDecoratorA.h"

@interface ConcreteDecoratorA ()
@property (nonatomic, copy) NSString *addedState;

@end
@implementation ConcreteDecoratorA

- (void)operation
{
    [super operation];
    _addedState = @"New State";

}

@end

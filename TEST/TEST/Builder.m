//
//  Builder.m
//  TEST
//
//  Created by zhangjikuan on 2019/1/29.
//  Copyright © 2019 winchannel. All rights reserved.
//

#import "Builder.h"
#import "AbstractFactory.h"
#import "ConstractFactoryA.h"
#import "ConstractFactoryB.h"

@implementation Builder
- (Product *)createProduct {

    Class fac = NSClassFromString(@"ConstractFactoryA");
    Product *p =[fac performSelector:@selector(createProduct)];
//    Product *p = [fac createProduct];

    return p;

//    Product *pr = [[Product alloc] init];
//
//    return pr;
}


@end

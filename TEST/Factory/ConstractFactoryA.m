//
//  ConstractFactoryA.m
//  TEST
//
//  Created by zhangjikuan on 2019/1/29.
//  Copyright © 2019 winchannel. All rights reserved.
//

#import "ConstractFactoryA.h"
#import "Product.h"
#import "ProductA.h"

@implementation ConstractFactoryA
- (id)createProduct {
    ProductA *p = [[ProductA alloc] init];
    return p;
}



@end

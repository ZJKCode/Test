//
//  ConstractFactoryB.m
//  TEST
//
//  Created by zhangjikuan on 2019/1/29.
//  Copyright © 2019 winchannel. All rights reserved.
//

#import "ConstractFactoryB.h"
#import "ProductB.h"

@implementation ConstractFactoryB
- (id)createProduct {
    ProductB *b = [[ProductB alloc] init];

    return b;
}
@end

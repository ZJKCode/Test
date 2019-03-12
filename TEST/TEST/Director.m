//
//  Director.m
//  TEST
//
//  Created by zhangjikuan on 2019/1/29.
//  Copyright © 2019 winchannel. All rights reserved.
//

#import "Director.h"
#import "Product.h"
#import "Builder.h"
@implementation Director
- (instancetype)init
{
    self = [super init];
    if (self) {
        Product *pr = [[[Builder alloc] init] createProduct];
        NSLog(@"productName %@",pr.prodctName);
    }
    return self;
}
@end

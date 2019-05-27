//
//  UndergraduateFactory.m
//  Design Pattern
//
//  Created by zhangjikuan on 16/9/2.
//  Copyright © 2016年 zhang_jk. All rights reserved.
//

#import "UndergraduateFactory.h"
#import "Undergradute.h"
@implementation UndergraduateFactory

+(LeiFeng *)createLeiFeng
{
    return [[Undergradute alloc] init];
    
}
@end

//
//  PersonDirect.m
//  Design Pattern
//
//  Created by zhangjikuan on 16/9/19.
//  Copyright © 2016年 zhang_jk. All rights reserved.
//

#import "PersonDirect.h"
#import "PersonBuilder.h"


@implementation PersonDirect

- (instancetype)initWithPerson:(id<PersonBuilder>)pb
{
    self = [super init];
    if (self) {
        
        _pb = pb;
    }
    return self;
}


- (void)createPerson
{
    [_pb buildHead];
    [_pb buildBody];
    [_pb buildArmLeft];
    [_pb buildArmRight];
    [_pb buildLegLeft];
    [_pb buildLegRight];
    
}
@end

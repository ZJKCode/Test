//
//  WCAbstractTask.m
//  TEST
//
//  Created by zhangjikuan on 2019/4/22.
//  Copyright © 2019 winchannel. All rights reserved.
//

#import "WCAbstractTask.h"

@implementation WCAbstractTask

- (id)initWithParam:(NSMutableDictionary *)paramdict {
    self = [super init];
    if (self) {
        _taskparam = paramdict;

    }
    return nil;
}

@end

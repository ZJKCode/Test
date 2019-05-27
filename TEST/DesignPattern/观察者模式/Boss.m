//
//  Boss.m
//  Design Pattern
//
//  Created by zhangjikuan on 16/9/22.
//  Copyright © 2016年 zhang_jk. All rights reserved.
//

#import "Boss.h"

@implementation Boss
- (instancetype)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

- (void)notify
{
    if (self.update) {
        self.update();
    }
}
@end

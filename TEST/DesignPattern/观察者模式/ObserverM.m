//
//  ObserverM.m
//  Design Pattern
//
//  Created by zhangjikuan on 16/9/22.
//  Copyright © 2016年 zhang_jk. All rights reserved.
//

#import "ObserverM.h"

@implementation ObserverM
- (instancetype)initWithObserver:(NSString *)name withSubject:(Subject *)subject
{
    self = [super init];
    if (self) {
        self.name = name;
        self.sub = subject;
    }
    return self;
}
@end

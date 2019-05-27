//
//  SleepingState.m
//  Design Pattern
//
//  Created by zhangjikuan on 2016/9/26.
//  Copyright © 2016年 zhang_jk. All rights reserved.
//

#import "SleepingState.h"
#import "Work.h"

@implementation SleepingState

- (void)writeProgram:(Work *)w
{
    NSLog(@"当前时间：{%f}点不行了，睡着了。",w.hour);
}
@end

//
//  EveningState.m
//  Design Pattern
//
//  Created by zhangjikuan on 2016/9/26.
//  Copyright © 2016年 zhang_jk. All rights reserved.
//

#import "EveningState.h"
#import "State.h"
#import "Work.h"
#import "SleepingState.h"
@implementation EveningState

- (void)writeProgram:(Work *)w
{
    if (w.hour<21) {
        NSLog(@"当前时间：{%f}点 加班哦，疲累之极",w.hour);
    }else{
        w.current = [[SleepingState alloc] init];
        [w.current writeProgram:w];
    }
}
@end

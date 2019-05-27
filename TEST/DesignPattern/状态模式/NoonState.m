//
//  NoonState.m
//  Design Pattern
//
//  Created by zhangjikuan on 2016/9/26.
//  Copyright © 2016年 zhang_jk. All rights reserved.
//

#import "NoonState.h"
#import "Work.h"
#import "AfternoonState.h"

@implementation NoonState
-(void)writeProgram:(Work *)w
{
    if (w.hour<13) {
        NSLog(@"当前时间：{%f}点 饿了，午饭：犯困，午休",w.hour);
    }else
    {
        w.current = [[AfternoonState alloc] init];
        [w.current writeProgram:w];
    }

}
@end

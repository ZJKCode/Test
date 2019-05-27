//
//  ForenoonState.m
//  Design Pattern
//
//  Created by zhangjikuan on 2016/9/26.
//  Copyright © 2016年 zhang_jk. All rights reserved.
//

#import "ForenoonState.h"
#import "NoonState.h"

@implementation ForenoonState
- (void)writeProgram:(Work *)w
{
    if (w.hour <12) {
        NSLog(@"当前时间：{%f}点 上午工作，精神百倍",w.hour);
    }else{
        w.current = [[NoonState alloc] init];
        [w.current writeProgram:w];
    }
}

@end

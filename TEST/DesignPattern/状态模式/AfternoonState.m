//
//  AfternoonState.m
//  Design Pattern
//
//  Created by zhangjikuan on 2016/9/26.
//  Copyright © 2016年 zhang_jk. All rights reserved.
//

#import "AfternoonState.h"
#import "Work.h"
#import "EveningState.h"

@implementation AfternoonState

- (void)writeProgram:(Work *)w
{
    if (w.hour<17) {
        NSLog(@"当前时间：{%f}点 下午状态不错，继续努力",w.hour);
    }else{
        w.current = [[EveningState alloc] init];
        [w.current writeProgram:w];
    }

}
@end

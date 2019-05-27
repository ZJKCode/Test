//
//  RestState.m
//  Design Pattern
//
//  Created by zhangjikuan on 2016/9/26.
//  Copyright © 2016年 zhang_jk. All rights reserved.
//

#import "RestState.h"
#import "Work.h"

@implementation RestState
- (void)writeProgram:(Work *)w
{
    NSLog(@"当前时间：（%f）点下班回家了",w.hour);
}
@end

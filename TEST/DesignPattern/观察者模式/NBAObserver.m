//
//  NBAObserver.m
//  Design Pattern
//
//  Created by zhangjikuan on 16/9/22.
//  Copyright © 2016年 zhang_jk. All rights reserved.
//

#import "NBAObserver.h"

@implementation NBAObserver

- (void)closeNBADirectSeeding
{
    NSLog(@"%@ %@ 关闭NBA直播，继续工作！",self.sub.action,self.name);

}
@end

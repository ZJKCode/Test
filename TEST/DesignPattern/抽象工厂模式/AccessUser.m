//
//  AccessUser.m
//  Design Pattern
//
//  Created by zhangjikuan on 16/9/22.
//  Copyright © 2016年 zhang_jk. All rights reserved.
//

#import "AccessUser.h"

@implementation AccessUser
- (void)insert:(User *)user
{
    NSLog(@"在Access 中给User表增加一条记录");
}

- (User *)getUserWithUserId:(int)Id
{
    NSLog(@"在Access 中根据ID 得到User表的一条记录");
    return nil;
}

@end

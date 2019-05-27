//
//  SqlserverDepartment.m
//  Design Pattern
//
//  Created by zhangjikuan on 16/9/22.
//  Copyright © 2016年 zhang_jk. All rights reserved.
//

#import "SqlserverDepartment.h"

@implementation SqlserverDepartment
-(void)insertDepartment:(Department *)department
{
    NSLog(@"在SQL Department 表中增加一条记录");
}

- (Department *)getDepartment:(int)Id
{
    NSLog(@"在SQL 中根据ID得到 department中的一条记录");
    return nil;
}

@end

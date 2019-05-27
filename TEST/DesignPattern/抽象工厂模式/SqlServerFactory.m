//
//  SqlServerFactory.m
//  Design Pattern
//
//  Created by zhangjikuan on 16/9/22.
//  Copyright © 2016年 zhang_jk. All rights reserved.
//

#import "SqlServerFactory.h"
#import "SqlserverUser.h"
#import "SqlserverDepartment.h"

@implementation SqlServerFactory
- (id<IUser>)createUser
{
    return [[SqlserverUser alloc] init];
}
- (id<IDepartment>)createDepartment
{
    return [[SqlserverDepartment alloc] init];
}

@end

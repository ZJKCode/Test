//
//  AccessFactory.m
//  Design Pattern
//
//  Created by zhangjikuan on 16/9/22.
//  Copyright © 2016年 zhang_jk. All rights reserved.
//

#import "AccessFactory.h"
#import "AccessUser.h"
#import "AccessDepartment.h"

@implementation AccessFactory

- (id<IUser>)createUser
{
    return [[AccessUser alloc] init];
}

- (id<IDepartment>)createDepartment
{
    return [[AccessDepartment alloc] init];
}

@end

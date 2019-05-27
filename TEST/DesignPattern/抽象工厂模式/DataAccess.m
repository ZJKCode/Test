//
//  DataAccess.m
//  Design Pattern
//
//  Created by zhangjikuan on 16/9/22.
//  Copyright © 2016年 zhang_jk. All rights reserved.
//

#import "DataAccess.h"

@interface DataAccess ()
@property (nonatomic,copy)NSString *db;
@end

@implementation DataAccess
- (instancetype)init
{
    self = [super init];
    if (self) {
        _db = @"Sqlserver";
    }
    return self;
}
- (id<IUser>)createUser
{
    NSString *cls = [NSString stringWithFormat:@"%@%@",_db,@"User"];
    Class class = NSClassFromString(cls);
    id<IUser> user = [[class alloc] init];
    return user;
}
- (id<IDepartment>)createDepartment
{

    NSString *cls = [NSString stringWithFormat:@"%@%@",_db,@"Department"];
    Class class = NSClassFromString(cls);
    id<IDepartment> departMent = [[class alloc] init];
    return departMent;
}

@end

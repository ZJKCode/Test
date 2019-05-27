//
//  DataAccess.h
//  Design Pattern
//
//  Created by zhangjikuan on 16/9/22.
//  Copyright © 2016年 zhang_jk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IUser.h"
#import "IDepartment.h"

@interface DataAccess : NSObject

- (id<IUser>)createUser;
- (id<IDepartment>)createDepartment;

@end

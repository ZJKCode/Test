//
//  IUser.h
//  Design Pattern
//
//  Created by zhangjikuan on 16/9/22.
//  Copyright © 2016年 zhang_jk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
@protocol IUser <NSObject>

- (void) insert:(User *)user;
- (User *)getUserWithUserId:(int)Id;
@end

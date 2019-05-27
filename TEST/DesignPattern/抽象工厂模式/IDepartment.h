//
//  Department.h
//  Design Pattern
//
//  Created by zhangjikuan on 16/9/22.
//  Copyright © 2016年 zhang_jk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Department.h"

@protocol IDepartment <NSObject>
- (void)insertDepartment:(Department *)department;
- (Department *)getDepartment:(int) Id;

@end

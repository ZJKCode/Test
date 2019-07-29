//
//  CompanyManager.m
//  TEST
//
//  Created by zhangjikuan on 2019/7/24.
//  Copyright © 2019 winchannel. All rights reserved.
//

#import "CompanyManager.h"

#import "Employee.h"

@implementation CompanyManager
- (NSArray <Employee *> *)getAllEmployee {
    NSMutableArray *list = [NSMutableArray array];
    for (int i = 0; i<100; i++) {
        Employee *employee = [[Employee alloc] init];
        employee.empoyeeId = [NSString stringWithFormat:@"总公司 %d", i];
        [list addObject:employee];
    }

    return (NSArray *)list;
}
@end

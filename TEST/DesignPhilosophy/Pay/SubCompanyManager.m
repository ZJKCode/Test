//
//  SubCompanyManager.m
//  TEST
//
//  Created by zhangjikuan on 2019/7/24.
//  Copyright © 2019 winchannel. All rights reserved.
//

#import "SubCompanyManager.h"
#import "SubEmployee.h"


@implementation SubCompanyManager

- (NSArray <SubEmployee *>*)getAllEmployee {

    NSMutableArray *list = [NSMutableArray array];
    for (int i = 0; i<100; i++) {
        SubEmployee *employee = [[SubEmployee alloc] init];
        employee.empoyeeId = [NSString stringWithFormat:@"分公司 %d", i];
        [list addObject:employee];    }


    return (NSArray *)list;

}

@end

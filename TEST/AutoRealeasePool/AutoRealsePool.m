//
//  AutoRealsePool.m
//  TEST
//
//  Created by zhangjikuan on 2019/6/14.
//  Copyright © 2019 winchannel. All rights reserved.
//

#import "AutoRealsePool.h"
#import <UIKit/UIKit.h>
#import <sys/sysctl.h>

#import <mach/mach.h>
static const NSInteger capacity = 1000000;

@interface AutoRealsePool()
@property (nonatomic, copy) NSString *testStr;
@property (nonatomic, strong) NSMutableArray *memoryUsageList1;

@end

@implementation AutoRealsePool

- (instancetype)init {

    self = [super init];
    if (self) {
        _memoryUsageList1 = [NSMutableArray arrayWithCapacity:capacity];
    }
    return self;
}
- (double)usedMemory

{

    task_basic_info_data_t taskInfo;

    mach_msg_type_number_t infoCount =TASK_BASIC_INFO_COUNT;

    kern_return_t kernReturn =task_info(mach_task_self(),

                                        TASK_BASIC_INFO,

                                        (task_info_t)&taskInfo,

                                        &infoCount);



    if (kernReturn != KERN_SUCCESS

        ) {

        return NSNotFound;

    }



    return taskInfo.resident_size / 1024.0 / 1024.0;

}
- (void)functionWithNOAutoReleasePool {
    for (int i = 0; i < capacity; i ++) {
        NSNumber *num = [NSNumber numberWithInt:i];  // 1
        NSString *str = [NSString stringWithFormat:@"%d ", i];
        _testStr = [NSString stringWithFormat:@"%@%@", num, str];
        if (i % 100 == 0) {
            [_memoryUsageList1 addObject:_testStr];  // getM方法是获取内存的函数
            NSLog(@"Memory: %f",[self usedMemory]);

        }
    }
}

- (void)functionWithAutoReleasePool {
    for (int i = 0; i < capacity; i ++) {
        @autoreleasepool {
            NSNumber *num = [NSNumber numberWithInt:i];  // 1
            NSString *str = [NSString stringWithFormat:@"%d ", i];
            _testStr = [NSString stringWithFormat:@"%@%@", num, str];
            if (i % 100 == 0) {
                NSLog(@"Memory: %f",[self usedMemory]);
            }
        }
    }
}

@end

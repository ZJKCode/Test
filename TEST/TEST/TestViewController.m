//
//  TestViewController.m
//  TEST
//
//  Created by zhangjikuan on 2019/2/18.
//  Copyright © 2019 winchannel. All rights reserved.
//

#import "TestViewController.h"
#import "GCDAction.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // 线程 (CPU 调度)
    // 任务：sync 和 async
    // 队列：串行队列 和 并发队列
//
//
//    [[GCDAction shareInstance] testDispatchGroup];
//    [[GCDAction shareInstance] testDispatchBarrier];
//    [[GCDAction shareInstance] testDispatchOnceToken];
//    [[GCDAction shareInstance] testDispatchOnceToken];

    NSLog(@"%@", [self getMonthList]);

    [self pupSort:@[]];
}

- (NSArray *)pupSort:(NSArray *)list {
    // 冒泡排序时候 逻辑思想是 相邻的两个元素相互比较,较大的放在后面 较大的放在后面

    NSArray *test = @[@12,@23,@43,@2,@3,@5,@8];
    NSMutableArray *mArray = [NSMutableArray arrayWithArray:test];

    for (int i = 0; i < mArray.count - 1; i++) {
        NSInteger a = [mArray[i] integerValue];
        NSInteger b = [mArray[i+1] integerValue];
        if (a>b) {
            // 互换
            mArray[i] = [NSNumber numberWithInteger:b];
            mArray[i+1] = [NSNumber numberWithInteger:a];
        }
    }
    NSLog(@"%@", mArray);

    for (int i = 0; i<mArray.count; i++) {
        for (int j = 0; j<mArray.count-i; j++) {

        }
    }
    return @[];
}

- (NSMutableArray *)getMonthList{

    NSCalendar *calendar0 = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSInteger unitFlags =  NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute;
    comps = [calendar0 components:unitFlags fromDate:[NSDate date]];
    NSInteger currentY=[comps year];
    NSInteger currentM = [comps month];

    NSMutableArray *monthList = [NSMutableArray arrayWithCapacity:24];

    for (int i = 0; i < 24; i++) {
        if (currentM<10) {
            [monthList addObject:[NSString stringWithFormat:@"0%ld/%ld",(long)currentM,currentY]];
        } else {
            [monthList addObject:[NSString stringWithFormat:@"%ld/%ld", (long)currentM, currentY]];
        }
        currentM -= 1; // 获取上一个月份
        if (currentM == 0) {
            currentY -= 1;
            currentM = 12;
        }
    }

    return monthList;
}
@end

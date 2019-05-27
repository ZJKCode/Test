//
//  ZJKDeviceMananger.m
//  TEST
//
//  Created by zhangjikuan on 2019/5/27.
//  Copyright © 2019 winchannel. All rights reserved.
//

#import "ZJKDeviceMananger.h"
#import <UIKit/UIKit.h>

@implementation ZJKDeviceMananger
+ (BOOL)isiPhoneX {
    if (@available(iOS 11.0,*)) {

        UIWindow*keyWindow = [[[UIApplication sharedApplication] delegate]window];
        CGFloat bottomSafeInset = keyWindow.safeAreaInsets.bottom;
        if(bottomSafeInset == 34.0f|| bottomSafeInset == 21.0f){
            return YES;
        }
    }
    return NO;
}

+ (NSMutableArray *)getMonthList:(NSInteger)mothonNumber {
    NSCalendar *calendar0 = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSInteger unitFlags =  NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute;
    comps = [calendar0 components:unitFlags fromDate:[NSDate date]];
    NSInteger currentY=[comps year];
    NSInteger currentM = [comps month];

    NSMutableArray *monthList = [NSMutableArray arrayWithCapacity:24];

    for (int i = 0; i < mothonNumber; i++) {
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

//
//  DiceTerm.m
//  TEST
//
//  Created by zhangjikuan on 2019/7/12.
//  Copyright © 2019 winchannel. All rights reserved.
//

#import "DiceTerm.h"
static DiceTerm *diceTerm = nil;

@implementation DiceTerm
+ (instancetype)shareInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        diceTerm = [[DiceTerm alloc] init];
    });

    return diceTerm;
}

- (NSString *)currentTerm {
    NSDate *date=[NSDate date];
    NSDateFormatter *format1=[[NSDateFormatter alloc] init];
    [format1 setDateFormat:@"yyyyMMdd"];
    NSString *dateStr;
    dateStr=[format1 stringFromDate:date];
    if (![[DiceTerm shareInstance].lastDate isEqualToString:dateStr]) {
        // 新的一天，期数充值
        [DiceTerm shareInstance].lastDate = dateStr;
        [DiceTerm shareInstance].count = 0;
    }

    NSInteger dateInteger = [dateStr integerValue];

    [DiceTerm shareInstance].count = [DiceTerm shareInstance].count + 1;

    NSInteger result = dateInteger*10000 + [DiceTerm shareInstance].count;

    return [NSString stringWithFormat:@"%ld", result];
}

@end

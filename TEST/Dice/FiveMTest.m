//
//  FiveMTest.m
//  TEST
//
//  Created by zhangjikuan on 2019/7/22.
//  Copyright © 2019 winchannel. All rights reserved.
//

#import "FiveMTest.h"

static FiveMTest *test = nil;

@implementation FiveMTest
+ (instancetype) shareInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{

        test = [[FiveMTest alloc] init];
    });

    return test;
}

- (NSInteger)randomMin {

    NSInteger aNum = arc4random() % 4;

    return aNum;
}

- (NSInteger)randomMax {
    return arc4random() % 5 + 5;
}


- (NSString *)calculateNextWillShow:(NSInteger)thisResult {

    // thisResult 最后一位的号码
    // 判断改号码是大于等于5 还是小于5

    NSInteger number = thisResult;
    // 如果大于5 则从[0,1,2,3,4] 五个数中任取3个 ，从 [5,6,7,8,9] 剔除掉 该号码， 从剩余的4个随机取俩

    NSMutableArray *arrylist = [NSMutableArray arrayWithCapacity:5];


    NSMutableArray *arrayMin = [NSMutableArray array];


    NSMutableArray *arrayMax = [NSMutableArray array];

    if (number >= 5) {
        while (arrayMin.count < 3) {
            NSInteger min = [self randomMin];
            NSString *minStr = [NSString stringWithFormat:@"%ld", min];
            if (![arrayMin containsObject:minStr]) {
                [arrayMin addObject:minStr];
            }
        }
        while (arrayMax.count < 2) {

            NSInteger max = [self randomMax];

            if (max == number) {
                continue;
            }
            NSString *maxStr = [NSString stringWithFormat:@"%ld", max];

            if (![arrayMax containsObject:maxStr]) {
                [arrayMax addObject:maxStr];
            }

        }

        [arrylist addObjectsFromArray:arrayMin];

        [arrylist addObjectsFromArray:arrayMax];

        [arrylist sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {


            if ([obj1 intValue] < [obj2 intValue])
            {
                return NSOrderedAscending;
            }
            else
            {
                return NSOrderedDescending;
            }
        }];

        NSMutableString *mustr = [NSMutableString string];

        [mustr appendString:arrylist[0]];

        [mustr appendString:arrylist[1]];

        [mustr appendString:arrylist[2]];

        [mustr appendString:arrylist[3]];

        [mustr appendString:arrylist[4]];

        return (NSString *)mustr;

    }
    // 同理如果小于 5 ，则从[0,1,2,3,4] 五个数中剔除掉 该号码，任取2个，，从 [5,6,7,8,9] 五个数中任取3个



    if (number < 5) {
        while (arrayMin.count < 3) {

            NSInteger min = [self randomMax];

            NSString *minStr = [NSString stringWithFormat:@"%ld", min];

            if (![arrayMin containsObject:minStr]) {

                [arrayMin addObject:minStr];

            }

        }

        while (arrayMax.count < 2) {
            NSInteger max = [self randomMin];

            if (max == number) {
                continue;
            }

            NSString *maxStr = [NSString stringWithFormat:@"%ld", max];

            if (![arrayMax containsObject:maxStr]) {
                [arrayMax addObject:maxStr];
            }
        }
        [arrylist addObjectsFromArray:arrayMin];

        [arrylist addObjectsFromArray:arrayMax];

        [arrylist sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {

            if ([obj1 intValue] < [obj2 intValue])
            {
                return NSOrderedAscending;
            }
            else
            {
                return NSOrderedDescending;
            }
        }];
        NSMutableString *mustr = [NSMutableString string];

        [mustr appendString:arrylist[0]];

        [mustr appendString:arrylist[1]];

        [mustr appendString:arrylist[2]];

        [mustr appendString:arrylist[3]];

        [mustr appendString:arrylist[4]];

        return (NSString *)mustr;

    }
    // 最后将号码按照从小到大拼接


    // 三期不中，则从外部开始重新获取



    return nil;



}

@end

//
//  DirectInsertSort.m
//  TEST
//
//  Created by zhangjikuan on 2019/4/15.
//  Copyright © 2019 winchannel. All rights reserved.
//

#import "DirectInsertSort.h"

@implementation DirectInsertSort

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self methodA];
    }
    return self;
}

- (void)methodA {
    NSLog(@"methodA");
    
}

- (void)directInsertSort {
    // 直接插入排序
    // 直接插入排序 从后向前找到合适位置后插入
    NSArray *list0 = @[@49, @38, @65, @97, @76, @13, @27, @49, @78, @34, @12, @64, @1];
    NSMutableArray *list = [NSMutableArray arrayWithArray:list0];
    NSLog(@"排序之前");
    for (int i = 0; i < list.count; i ++) {
        NSLog(@"index %d %@ \n",i, list[i]);
    }

    // 直接插入排序
    for (int i = 1; i < list.count; i ++) {
        // 待插入排序
        int temp = [list[i] intValue];
        int j ;
        for (j = i - 1; j >= 0; j --) {
            // 将大于temp的往后移动一位
            if ([list[j]  intValue] > temp) {
                list[j+1] = list[j];
            } else {
                break;
            }
        }
        list[j + 1] = [NSString stringWithFormat:@"%d", temp];
    }

    NSLog(@"排序之后： %@", list);


}
/// 二分插入排序
/// 基本思想：二分法插入排序的思想和直接插入一样，只是找合适的插入位置的方式不同，这里是按二分法找到合适的位置，可以减少比较的次数。
- (void)binaryInsertSort {
    NSArray *list0 = @[@49, @38, @65, @97, @176, @213, @227, @49, @78, @34, @12, @164, @11, @18, @1];

    NSMutableArray *list = [NSMutableArray arrayWithArray:list0];

    NSLog(@"排序之前： %@", list0);
    for (int i = 0; i < list.count; i ++) {
        int temp = [list[i] intValue];
        int left = 0;
        int right = i - 1;
        int mid = 0;
        while (left <= right) {
            mid = (left + right) / 2;
            if (temp < [list[mid] intValue]) {
                right = mid - 1;
            } else {
                left = mid + 1;
            }

        }
        for (int j = i - 1; j >= left; j--)
        {
            list[j + 1] = list[j];
        }
        if (left != i)
        {
            list[left] = [NSString stringWithFormat:@"%d", temp];
        }
    }

    NSLog(@"排序之后：%@", list);
}

/// 快速排序
- (void)quickSortArray:(NSMutableArray *)array withLeftIndex:(NSInteger)leftIndex andRightIndex:(NSInteger)rightIndex {
    if (leftIndex >= rightIndex) {//如果数组长度为0或1时返回
        return ;
    }

    NSInteger i = leftIndex;
    NSInteger j = rightIndex;
    //记录比较基准数
    NSInteger key = [array[i] integerValue];

    while (i < j) {
        /**** 首先从右边j开始查找比基准数小的值 ***/
        while (i < j && [array[j] integerValue] >= key) {//如果比基准数大，继续查找
            j--;
        }
        //如果比基准数小，则将查找到的小值调换到i的位置
        array[i] = array[j];

        /**** 当在右边查找到一个比基准数小的值时，就从i开始往后找比基准数大的值 ***/
        while (i < j && [array[i] integerValue] <= key) {//如果比基准数小，继续查找
            i++;
        }
        //如果比基准数大，则将查找到的大值调换到j的位置
        array[j] = array[i];

    }

    //将基准数放到正确位置
    array[i] = @(key);

    /**** 递归排序 ***/
    //排序基准数左边的
    [self quickSortArray:array withLeftIndex:leftIndex andRightIndex:i - 1];
    //排序基准数右边的
    [self quickSortArray:array withLeftIndex:i + 1 andRightIndex:rightIndex];
}


- (NSArray *)pupSort:(NSArray *)list {
    // 冒泡排序时候 逻辑思想是 相邻的两个元素相互比较,较大的放在后面 较大的放在后面

    NSArray *test = @[@12,@23,@43,@2,@3,@5,@8];
    NSMutableArray *mArray = [NSMutableArray arrayWithArray:test];

    for (int i = 0; i < mArray.count; i++) {

        for (int j = i + 1; j < mArray.count - i; j ++) {
            NSInteger a = [mArray[i] integerValue];
            NSInteger b = [mArray[j] integerValue];
            if (a>b) {
                // 互换
                //            mArray[i] = [NSNumber numberWithInteger:b];
                //            mArray[i+1] = [NSNumber numberWithInteger:a];
                [mArray exchangeObjectAtIndex:i withObjectAtIndex:i+1];
            }
        }

        NSLog(@"打印 %@", mArray);

    }

    for (int i = 0; i<mArray.count; i++) {
        for (int j = 0; j<mArray.count-i; j++) {

        }
    }
    return @[];
}

@end

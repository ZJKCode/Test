//
//  SortOperation.h
//  TEST
//
//  Created by zhangjikuan on 2019/5/27.
//  Copyright © 2019 winchannel. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Sort : NSObject

/**
 直接排序
 */
- (void)directInsertSort;

/**
 二分查找排序
 */
- (void)binaryInsertSort;

/**
 快速排序

 @param array 排序数组
 @param leftIndex 左边索引
 @param rightIndex 右边索引
 */
- (void)quickSortArray:(NSMutableArray *)array
         withLeftIndex:(NSInteger)leftIndex
         andRightIndex:(NSInteger)rightIndex;

/**
 冒泡排序

 @param list 数组
 @return 排好序的数组
 */
- (NSArray *)pupSort:(NSArray *)list;
@end

NS_ASSUME_NONNULL_END

//
//  DiceModel.h
//  TEST
//
//  Created by zhangjikuan on 2019/7/11.
//  Copyright © 2019 winchannel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DiceSingle.h"

typedef enum : NSUInteger {
    DiceSumBig,
    DiceSumSmall,
} DiceSumSize;

NS_ASSUME_NONNULL_BEGIN

@interface DiceModel : NSObject

/**
 大小
 */
@property (nonatomic, copy) NSString *size;

/**
 和点数
 */
@property (nonatomic, copy) NSString *countSum;

/**
 骰子各个点数
 */
@property (nonatomic, strong) NSArray<DiceSingle *> *dices;

/**
 点数和是否为大
 */
@property (nonatomic, assign) DiceSumSize sumSize;

/**
 当前期数
 */
@property (nonatomic, copy) NSString *diceTerm;
@end


NS_ASSUME_NONNULL_END

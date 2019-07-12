//
//  DiceM.h
//  TEST
//
//  Created by zhangjikuan on 2019/7/11.
//  Copyright © 2019 winchannel. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DiceSingle;

@class DiceModel;

NS_ASSUME_NONNULL_BEGIN

@interface DiceM : NSObject
+ (instancetype)shareInstance;


- (NSArray *)dices;

- (void)runRandom;

/**
 获取随机点数

 @return 随机点数
 */
- (DiceModel *)getRandomDice;


/**
 获取点数和为大的点数

 @return 和 为大的点数
 */
- (DiceModel *)getSumBigDice;

/**
 获取点数和为小的点数

 @return 点数和为小的点数
 */
- (DiceModel *)getSumSmallDice;

@end

NS_ASSUME_NONNULL_END

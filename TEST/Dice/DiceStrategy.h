//
//  DiceStrategy.h
//  TEST
//
//  Created by zhangjikuan on 2019/7/29.
//  Copyright © 2019 winchannel. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// 策略
@interface DiceStrategy : NSObject

/// 策略 1  一大一小
- (NSString *)randomSize;

/// 策略 2  顺龙
- (NSString *)downstream;

/// 策略 3 斩龙
- (NSString *)clockwise;

@end

NS_ASSUME_NONNULL_END

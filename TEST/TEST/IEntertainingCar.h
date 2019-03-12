//
//  IEntertainingCar.h
//  TEST
//
//  Created by zhangjikuan on 2019/1/28.
//  Copyright © 2019 winchannel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Gasoline.h"

NS_ASSUME_NONNULL_BEGIN
/// 具有娱乐功能的车
@protocol IEntertainingCar <NSObject>
- (void)run;
- (void)showSpeed;
- (void)playMusic;
- (void)refuel:(id<Gasoline>)gasoline;

@end

NS_ASSUME_NONNULL_END

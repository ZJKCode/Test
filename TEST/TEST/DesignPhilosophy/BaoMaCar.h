//
//  BaoMaCar.h
//  TEST
//
//  Created by zhangjikuan on 2019/1/28.
//  Copyright © 2019 winchannel. All rights reserved.
//

#import "Car.h"
#import "IEntertainingCar.h"
NS_ASSUME_NONNULL_BEGIN

@interface BaoMaCar : Car <IEntertainingCar>
- (void)showSpeed;

@end

NS_ASSUME_NONNULL_END

//
//  ICarProfessionalCar.h
//  TEST
//
//  Created by zhangjikuan on 2019/1/28.
//  Copyright © 2019 winchannel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Gasoline.h"

// 接口隔离
NS_ASSUME_NONNULL_BEGIN
// 具有一般功能的车
@protocol ICarProfessionalCar <NSObject>
- (void)run;
- (void)showSpeed;
- (void)refuel:(id<Gasoline>)gasoline;

@end

NS_ASSUME_NONNULL_END

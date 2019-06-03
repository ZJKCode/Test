//
//  CarDirect.h
//  TEST
//
//  Created by zhangjikuan on 2019/6/3.
//  Copyright © 2019 winchannel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CarBuild.h"

NS_ASSUME_NONNULL_BEGIN

@interface CarDirect : NSObject
- (instancetype)initWithCarBuilder:(id <CarBuild>) builder;

/**
 生产汽车
 */
- (void)createCar;


@end

NS_ASSUME_NONNULL_END

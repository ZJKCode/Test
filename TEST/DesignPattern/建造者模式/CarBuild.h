//
//  CarBuild.h
//  TEST
//
//  Created by zhangjikuan on 2019/6/3.
//  Copyright © 2019 winchannel. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 汽车一般由发动机、底盘、车身、电气设备等四个基本部分组成。
 */
@protocol CarBuild <NSObject>


/**
 建造引擎发动机
 */
- (void)buildEngine;

/**
 建造底盘
 */
- (void)buildChassis;

/**
 建造电器设备
 */
- (void)buildElectricalEquipment;

/**
 生产车轮
 */
- (void)buildWheel;

@end

NS_ASSUME_NONNULL_END

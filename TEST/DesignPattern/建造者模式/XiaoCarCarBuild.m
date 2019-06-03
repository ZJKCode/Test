//
//  XiaoCarCarBuild.m
//  TEST
//
//  Created by zhangjikuan on 2019/6/3.
//  Copyright © 2019 winchannel. All rights reserved.
//

#import "XiaoCarCarBuild.h"

@implementation XiaoCarCarBuild

/**
 建造引擎发动机
 */
- (void)buildEngine {
    NSLog(@"创建小轿车发动机");
}

/**
 建造底盘
 */
- (void)buildChassis{
    NSLog(@"创建小轿车底盘");
}

/**
 建造电器设备
 */
- (void)buildElectricalEquipment {
    NSLog(@"创建小轿车电气设备");
}

/**
 生产车轮
 */
- (void)buildWheel {
    NSLog(@"创建小轿车车轮");
}
@end

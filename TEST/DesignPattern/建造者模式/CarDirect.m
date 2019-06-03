//
//  CarDirect.m
//  TEST
//
//  Created by zhangjikuan on 2019/6/3.
//  Copyright © 2019 winchannel. All rights reserved.
//

#import "CarDirect.h"

@interface CarDirect ()
@property (nonatomic, copy) id<CarBuild> builder;
@end

@implementation CarDirect
- (instancetype)initWithCarBuilder:(id <CarBuild> ) builder;
{
    self = [super init];
    if (self) {
        _builder = builder;
    }
    return self;
}

- (void)createCar {
    [_builder buildEngine];
    [_builder buildChassis];
    [_builder buildElectricalEquipment];
    [_builder buildWheel];
}

@end

//
//  WorkerInPetrolStation.m
//  TEST
//
//  Created by zhangjikuan on 2019/1/28.
//  Copyright © 2019 winchannel. All rights reserved.
//

#import "WorkerInPetrolStation.h"

@implementation WorkerInPetrolStation
- (void)refuel:(id<ICarProfessionalCar>)car gasoline:(id<Gasoline>)gasoline {
    if (gasoline.isQuality) {
        [car refuel:gasoline];
    }
}


@end

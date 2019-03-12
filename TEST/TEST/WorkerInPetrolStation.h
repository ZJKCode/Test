//
//  WorkerInPetrolStation.h
//  TEST
//
//  Created by zhangjikuan on 2019/1/28.
//  Copyright © 2019 winchannel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ICarProfessionalCar.h"

NS_ASSUME_NONNULL_BEGIN

@interface WorkerInPetrolStation : NSObject

- (void)refuel:(id<ICarProfessionalCar>)car gasoline:(id<Gasoline>)gasoline;

@end

NS_ASSUME_NONNULL_END

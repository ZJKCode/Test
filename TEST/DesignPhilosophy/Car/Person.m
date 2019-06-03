//
//  Person.m
//  TEST
//
//  Created by zhangjikuan on 2019/1/28.
//  Copyright © 2019 winchannel. All rights reserved.
//

#import "Person.h"
#import "BaoMaCar.h"
#import "SangTaNaCar.h"
@implementation Person

- (void)refuel:(WorkerInPetrolStation *)worker gasoline:(id<Gasoline>)gasoline {
    SangTaNaCar *car = [[SangTaNaCar alloc] init];
    [worker refuel:car gasoline:gasoline];
    
}
@end

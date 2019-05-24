//
//  BaoMaCar.m
//  TEST
//
//  Created by zhangjikuan on 2019/1/28.
//  Copyright © 2019 winchannel. All rights reserved.
//

#import "BaoMaCar.h"

@implementation BaoMaCar
- (void)showSpeed {
    NSLog(@"汽车速度是80km/h");
}
- (void)playMusic {
    NSLog(@"播放音乐");
}

- (void)refuel:(id<Gasoline>)gasoline {
    NSLog(@"name: %@", gasoline.name);
}

@end

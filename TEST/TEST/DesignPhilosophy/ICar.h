//
//  ICar.h
//  TEST
//
//  Created by zhangjikuan on 2019/1/28.
//  Copyright © 2019 winchannel. All rights reserved.
//

#import <Foundation/Foundation.h>
/// 理解：一个类实现的接口中，包含了它不需要的方法。
/// 将接口拆分成更小和更具体的接口，有助于解耦，从而更容易重构、更改。
/// 接口隔离原则的要求我们，建立单一接口，不要建立庞大臃肿的接口，尽量细化接口，接口中的方法尽量少。
/// 这通过分散定义多个接口，可以预防外来变更的扩散，提高系统的灵活性和可维护性。
NS_ASSUME_NONNULL_BEGIN

@protocol ICar <NSObject>

- (void)run;
- (void)showSpeed;
- (void)playMusic;


@end

NS_ASSUME_NONNULL_END

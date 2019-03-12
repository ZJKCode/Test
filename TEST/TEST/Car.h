//
//  Car.h
//  TEST
//
//  Created by zhangjikuan on 2019/1/28.
//  Copyright © 2019 winchannel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ICar.h"

NS_ASSUME_NONNULL_BEGIN
/// 里式替换原则 ：
/// 一个对象在其出现任何地方，都可以用其子类来做替换.并不会导致程序的错误。
/// 换句话说，当子类可以在任意地方替换基类且软件功能不受影响时，这种继承关系的建模才是合理的。
/// 子类可以扩展父类的方法，但是不应该复写父类的方法

@interface Car : NSObject <ICar>
- (void)run;

@end

NS_ASSUME_NONNULL_END

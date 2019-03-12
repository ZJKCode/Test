//
//  Car2.h
//  TEST
//
//  Created by zhangjikuan on 2019/1/28.
//  Copyright © 2019 winchannel. All rights reserved.
//

#import <Foundation/Foundation.h>
/// 理解：高层模块不应该依赖低层模块，二者都应该依赖其抽象；抽象不应该依赖细节；细节应该依赖抽象。

/// 总结：面向接口编程，提取出事务的本质和共性。

/// 高层和底层的区分， A中有引用B类的代码，A为高层，B为底层 ，引用但是不应该依赖

#import "Gasoline.h"

NS_ASSUME_NONNULL_BEGIN

@interface Car2 : NSObject

- (void)refuel:(id<Gasoline>)gasoline;

@end

NS_ASSUME_NONNULL_END

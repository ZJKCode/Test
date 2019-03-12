//
//  AbstractFactory.h
//  TEST
//
//  Created by zhangjikuan on 2019/1/29.
//  Copyright © 2019 winchannel. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
// 具体的实现交给子类

@interface AbstractFactory : NSObject
- (id)createProduct;

- (instancetype)createInstance;

@end

NS_ASSUME_NONNULL_END

//
//  PayProcessor.h
//  TEST
//
//  Created by zhangjikuan on 2019/1/28.
//  Copyright © 2019 winchannel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PaySendModel.h"

NS_ASSUME_NONNULL_BEGIN
// 开闭原则，一个类，模块、函数可以去扩展，但是不要去修改
// 开闭原则，添加扩展，减少多种if-else 这种类型的判断
// 本例中中如果增加了一种支付方式，则可以创建一个继承协议的类
// 以此类推，减少对代码的修改

// 此处定义一系列的方法列表

@protocol PayProcessor <NSObject>
- (void)handle:(PaySendModel *)sendModel;

- (void)pay;

- (void)cancelPay;

- (void)confirmPay;

- (void)payOutApp;

- (void)payOnline;

- (NSString *)cancelReason;



@end

NS_ASSUME_NONNULL_END

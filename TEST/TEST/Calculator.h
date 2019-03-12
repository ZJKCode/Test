//
//  Calculator.h
//  TEST
//
//  Created by zhangjikuan on 2019/1/28.
//  Copyright © 2019 winchannel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

// 链式编程

@interface Calculator : NSObject

@property (nonatomic, assign)CGFloat result;

- (Calculator * (^)(CGFloat num))add; // 加上num
- (Calculator * (^)(CGFloat num))sub; // 减去num
- (Calculator * (^)(CGFloat num))mutil; // 相乘num
- (Calculator * (^)(CGFloat num))divided; // 除以num

@end

NS_ASSUME_NONNULL_END

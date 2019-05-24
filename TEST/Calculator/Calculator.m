//
//  Calculator.m
//  TEST
//
//  Created by zhangjikuan on 2019/1/28.
//  Copyright © 2019 winchannel. All rights reserved.
//

#import "Calculator.h"

@implementation Calculator

- (Calculator * (^)(CGFloat num))add {
    return ^id(CGFloat num) {
        self.result += num;
        return self;
    };
}

- (Calculator * (^)(CGFloat num))sub {
    return ^id(CGFloat num) {
        self.result -= num;
        return self;
    };
}

- (Calculator * (^)(CGFloat num))mutil {
    return ^id(CGFloat num) {
        self.result *= num;
        return self;
    };
}

- (Calculator * (^)(CGFloat num))divided {
    return ^id(CGFloat num) {
        self.result /= num;
        return self;
    };
}

@end

//
//  AbstractOperation.m
//  TEST
//
//  Created by zhangjikuan on 2019/5/27.
//  Copyright © 2019 winchannel. All rights reserved.
//

#import "AbstractOperation.h"

@implementation AbstractOperation

- (NSString *)operationTitle {
    return NSStringFromClass([self class]);
}

- (NSArray<NSString *> *)operations {
    return @[@"subclass need overwrite"];
}

- (void)operationTarget:(id)target WithIndex:(NSInteger)index {
    NSLog(@"subclass need overwrite");
}

- (void)deal_opertationWithIndex:(NSInteger)index {
    NSLog(@"subclass need overwrite");
}

@end

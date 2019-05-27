//
//  GCDOperation.m
//  TEST
//
//  Created by zhangjikuan on 2019/5/23.
//  Copyright © 2019 winchannel. All rights reserved.
//

#import "GCDOperation.h"
#import "GCDAction.h"

@interface GCDOperation ()
@property (nonatomic, strong)GCDAction *gcdAction;

@end

@implementation GCDOperation
- (NSString *)operationTitle {
    return @"GCD多线程演示";
}
- (NSArray<NSString *> *)operations {
  return @[@"syncConcurrent",
           @"asyncConcurrent",
           @"syncSerial",
           @"asyncSerial",
           @"syncMain",
           @"asyncMain",
           @"semaphoreSync",
           @"testDispatchGroup",
           @"testDispatchBarrier",
           @"testDispatchOnceToken"];
}
- (void)operationTarget:(id)target WithIndex:(NSInteger)index {
    [self deal_opertationWithIndex:index];
}
- (void)deal_opertationWithIndex:(NSInteger)index {
    NSString *selString = self.operations[index];
    SEL sel = NSSelectorFromString(selString);
    if ([self.gcdAction respondsToSelector:sel]) {
        [self.gcdAction performSelector:sel];
    }
}

- (GCDAction *)gcdAction {
    if (!_gcdAction) {
        _gcdAction = [[GCDAction alloc] init];
    }
    return _gcdAction;
}


@end

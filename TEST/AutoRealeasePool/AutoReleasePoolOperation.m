//
//  AutoReleasePoolOperation.m
//  TEST
//
//  Created by zhangjikuan on 2019/6/17.
//  Copyright © 2019 winchannel. All rights reserved.
//

#import "AutoReleasePoolOperation.h"
#import "AutoRealsePool.h"

@implementation AutoReleasePoolOperation
- (NSString *)operationTitle {
    return @"AutoReleasePool Test";
}

- (NSArray<NSString *> *)operations {
    return @[@"With Out AutoReleasePool ",@"With AutoReleasePool"];
}

- (void)operationTarget:(id)target WithIndex:(NSInteger)index {
    switch (index) {
        case 0:
            [[[AutoRealsePool alloc] init] functionWithNOAutoReleasePool];
            break;
        case 1:
            [[[AutoRealsePool alloc] init] functionWithAutoReleasePool];
            break;
        default:
            break;
    }
}
@end

//
//  SortOperationAction.m
//  TEST
//
//  Created by zhangjikuan on 2019/5/27.
//  Copyright © 2019 winchannel. All rights reserved.
//

#import "SortOperationAction.h"
#import "Sort.h"

@interface SortOperationAction ()

@end

@implementation SortOperationAction
- (NSString *)operationTitle {
    return  @"sort Method";
}

- (NSArray<NSString *> *)operations {
    return @[@"直接排序",@"快速排序",@"冒泡排序"];
}
- (void)operationTarget:(id)target WithIndex:(NSInteger)index {
    Sort *sort = [[Sort alloc] init];

    switch (index) {
            case 2:
            [sort pupSort:@[]];
            break;

        default:
            break;
    }
}

@end

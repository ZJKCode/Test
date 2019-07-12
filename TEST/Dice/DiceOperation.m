//
//  DiceOperation.m
//  TEST
//
//  Created by zhangjikuan on 2019/7/11.
//  Copyright © 2019 winchannel. All rights reserved.
//

#import "DiceOperation.h"
#import "DiceViewController.h"
@implementation DiceOperation
- (NSString *)operationTitle {
    return  @"投骰子演示";
}
- (NSArray<NSString *> *)operations {
    return  @[@"Dice"];
}

- (void)operationTarget:(id)target WithIndex:(NSInteger)index {

    UIViewController *targetCtr = (UIViewController *)target;
    DiceViewController *controller = [[DiceViewController alloc] init];
    [targetCtr.navigationController pushViewController:controller animated:YES];
}
@end

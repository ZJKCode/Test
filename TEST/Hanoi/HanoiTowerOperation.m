//
//  HanoiTowerOperation.m
//  TEST
//
//  Created by zhangjikuan on 2019/5/27.
//  Copyright © 2019 winchannel. All rights reserved.
//

#import "HanoiTowerOperation.h"
#import "RootViewController.h"
@implementation HanoiTowerOperation
- (NSString *)operationTitle {
   return  @"汉诺塔算法演示";
}
- (NSArray<NSString *> *)operations {
    return  @[@"Hanoi"];
}

- (void)operationTarget:(id)target WithIndex:(NSInteger)index {

    UIViewController *targetCtr = (UIViewController *)target;
    RootViewController *controller = [[RootViewController alloc] init];
    [targetCtr.navigationController pushViewController:controller animated:YES];
}
@end

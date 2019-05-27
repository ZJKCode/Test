//
//  BezierOperation.m
//  TEST
//
//  Created by zhangjikuan on 2019/5/27.
//  Copyright © 2019 winchannel. All rights reserved.
//

#import "BezierOperation.h"
#import "ZJKBezierViewController.h"

@implementation BezierOperation
- (NSString *)operationTitle {
    return  @"Bezier";
}

- (NSArray<NSString *> *)operations {
    return @[@"Bezier With touch delegate",@"Bezier Animation"];
}

- (void)operationTarget:(id)target WithIndex:(NSInteger)index {

    UIViewController *targetCtr = (UIViewController *)target;
    ZJKBezierViewController *viewController = [[ZJKBezierViewController alloc] init];
    [targetCtr.navigationController pushViewController:viewController animated:YES];

}
@end

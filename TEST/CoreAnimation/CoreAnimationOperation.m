//
//  CoreAnimationOperation.m
//  TEST
//
//  Created by zhangjikuan on 2019/5/23.
//  Copyright © 2019 winchannel. All rights reserved.
//

#import "CoreAnimationOperation.h"
#import <UIKit/UIKit.h>
#import "CoreAnimationViewController.h"

@implementation CoreAnimationOperation
- (NSArray<NSString *> *)operations {
    return @[@"贝塞尔曲线动画"];
}

- (void)operationTarget:(id)target WithIndex:(NSInteger)index {
    UIViewController *controller = (UIViewController *)target;

    CoreAnimationViewController *ctr = [[CoreAnimationViewController alloc] init];
    ctr.selectIndex = index;
    [controller.navigationController pushViewController:ctr animated:YES];
}

@end

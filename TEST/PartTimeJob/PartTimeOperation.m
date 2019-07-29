//
//  PartTimeOperation.m
//  TEST
//
//  Created by zhangjikuan on 2019/7/22.
//  Copyright © 2019 winchannel. All rights reserved.
//

#import "PartTimeOperation.h"

#import "PartTimeViewController.h"

@implementation PartTimeOperation
- (NSString *)operationTitle {
    return  @"Show PartTime";
}
- (NSArray<NSString *> *)operations {
    return  @[@"ShowPart",@"PartTimeJob"];
}

- (void)operationTarget:(id)target WithIndex:(NSInteger)index {
    UIViewController *targetCtr = (UIViewController *)target;
    PartTimeViewController *controller = [[PartTimeViewController alloc] init];
    [targetCtr.navigationController pushViewController:controller animated:YES];
}

@end

//
//  DiceOperation.m
//  TEST
//
//  Created by zhangjikuan on 2019/7/11.
//  Copyright © 2019 winchannel. All rights reserved.
//

#import "DiceOperation.h"
#import "DiceViewController.h"
#import "DiceWebViewController.h"

@implementation DiceOperation
- (NSString *)operationTitle {
    return  @"投骰子演示";
}
- (NSArray<NSString *> *)operations {
    return  @[@"Dice",@"DiceWeb"];
}

- (void)operationTarget:(id)target WithIndex:(NSInteger)index {

    switch (index) {
        case 0:{
            UIViewController *targetCtr = (UIViewController *)target;
            DiceViewController *controller = [[DiceViewController alloc] init];
            [targetCtr.navigationController pushViewController:controller animated:YES];
        }
            break;
        case 1:{
            UIViewController *targetCtr = (UIViewController *)target;
            DiceWebViewController *controller = [[DiceWebViewController alloc] init];
            [targetCtr.navigationController pushViewController:controller animated:YES];
        }
            break;
        default:
            break;
    }

}
@end

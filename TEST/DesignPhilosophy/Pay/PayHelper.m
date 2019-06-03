//
//  PayHelper.m
//  TEST
//
//  Created by zhangjikuan on 2019/1/28.
//  Copyright © 2019 winchannel. All rights reserved.
//

#import "PayHelper.h"
#import "PayProcessor.h"
#import "PaySendModel.h"

@implementation PayHelper
- (instancetype)init
{
    self = [super init];
    if (self) {
        id <PayProcessor> processor;
        // 对软件实体的改动，最好采用扩展而非修改的方式

        PaySendModel *model = [[PaySendModel alloc] init];
        model.info = @"test alloc ";
        [processor handle:model];
    }
    return self;
}

- (void)paywith:(id<PayProcessor>)processor andInfo:(PaySendModel *)model {
    [processor handle:model];
}

@end

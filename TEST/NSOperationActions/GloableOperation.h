//
//  GloableOperation.h
//  TEST
//
//  Created by zhangjikuan on 2019/5/23.
//  Copyright © 2019 winchannel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OperationProtocol.h"
NS_ASSUME_NONNULL_BEGIN

@interface GloableOperation : NSObject <OperationProtocol>


/**
 测试OperationAction
 */
- (void)deal_OperationClass;
- (NSArray <NSString *>*)operations;
- (void)deal_opertationWithIndex:(NSInteger)index;

@end

NS_ASSUME_NONNULL_END

//
//  OperationProtocol.h
//  TEST
//
//  Created by zhangjikuan on 2019/5/23.
//  Copyright © 2019 winchannel. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol OperationProtocol <NSObject>
@optional
- (NSArray <NSString *>*)operations;
- (void)deal_opertationWithIndex:(NSInteger)index;
- (void)operationTarget:(id)target WithIndex:(NSInteger)index;
@end

NS_ASSUME_NONNULL_END

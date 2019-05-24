//
//  OperationAction.h
//  TEST
//
//  Created by zhangjikuan on 2019/3/8.
//  Copyright © 2019 winchannel. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface OperationAction : NSObject
- (void)testAation;

/**
 NSInvercationOperation
 */
- (void)useInvocationOperation;

/**
 NSBlockOperation
 */
- (void)useBlockOperation;

- (void)useBlockOperationAddExecutionBlock;

- (void)useCutomOperation;

- (void)addOperationToQueue;

- (void)addOperationWithBlockToQueue;

/*
  NSOperationQueue 控制串行执行、并发执行
 */

- (void)setMaxConcurrentOperationCount:(NSInteger)count;

/*
 NSOperation 操作依赖
 */
- (void)addDependency;

/*
  NSOperation 优先级
 */

/*
 线程间的通信
 */
- (void)communication;

//  NSOperation、NSOperationQueue 线程同步和线程安全

/*
 NSOperation、NSOperationQueue 非线程安全

 */

- (void)initTicketStatusNotSave;

// NSOperation、NSOperationQueue 线程安全
- (void)initTicketStatusSave;
@end

NS_ASSUME_NONNULL_END

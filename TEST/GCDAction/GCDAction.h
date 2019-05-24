//
//  GCDAction.h
//  TEST
//
//  Created by zhangjikuan on 2019/2/25.
//  Copyright © 2019 winchannel. All rights reserved.
//  GCD 多线程以及GCD相关的测试例子


#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GCDAction : NSObject

+ (instancetype)shareInstance;

/**
 同步 + 并发
 */
- (void)syncConcurrent;

/**
   异步 + 并发 任务
 */
- (void)asyncConcurrent;

/**
 同步 + 串行
 sync + serial
 */
- (void)syncSerial;

/**
 * 异步执行 + 串行队列
 * 特点：会开启新线程，但是因为任务是串行的，执行完一个任务，再执行下一个任务。
 */
- (void)asyncSerial;

/**
 同步 + 主线程
 */
- (void)syncMain;

/**
 异步 + 主线程
 */
- (void)asyncMain;

/**
 * semaphore 线程同步
 */
- (void)semaphoreSync;

/**
 group
 */
- (void)testDispatchGroup;

/**
  Barrier
 */
- (void)testDispatchBarrier;

/**
 once_token
 */
- (void)testDispatchOnceToken;
@end

NS_ASSUME_NONNULL_END

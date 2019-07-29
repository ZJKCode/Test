//
//  GCDAction.m
//  TEST
//
//  Created by zhangjikuan on 2019/2/25.
//  Copyright © 2019 winchannel. All rights reserved.
//

#import "GCDAction.h"

@implementation GCDAction
+ (instancetype)shareInstance {
   static GCDAction *gcd = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        gcd = [[GCDAction alloc] init];
    });
    return gcd;
}
// 队列：串行队列 和 并发队列
- (void)create_DISPATCH_QUEUE_SERIAL {
    // 创建串行队列
    // 一种特殊的串行队列：主队列（Main Dispatch Queue）
    dispatch_queue_t queue = dispatch_queue_create("com.zjk.test1", DISPATCH_QUEUE_SERIAL);

    dispatch_sync(queue, ^{
        // 同步 串行 任务

    });

    dispatch_async(queue, ^{
        // 异步 串行 任务

    });

}

- (void)create_DISPATCH_QUEUE_CONCURRENT {

    // 创建并发队列
    dispatch_queue_t queue = dispatch_queue_create("com.zjk.test2", DISPATCH_QUEUE_CONCURRENT);
    dispatch_sync(queue, ^{
        // 同步 并发 任务

    });

    dispatch_async(queue, ^{
        // 异步 并发 任务

    });
}

// 同步 + 并发 任务
- (void)syncConcurrent {

    NSLog(@"currentThread---%@",[NSThread currentThread]);  // 打印当前线程
    NSLog(@"syncConcurrent---begin");

    dispatch_queue_t queue = dispatch_queue_create("com.zjk.test3", DISPATCH_QUEUE_CONCURRENT);

    dispatch_sync(queue, ^{
        // 追加任务1
        for (int i = 0; i < 2; ++i) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"1---%@",[NSThread currentThread]);      // 打印当前线程
        }
    });

    dispatch_sync(queue, ^{
        // 追加任务2
        for (int i = 0; i < 2; ++i) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"2---%@",[NSThread currentThread]);      // 打印当前线程
        }
    });

    dispatch_sync(queue, ^{
        // 追加任务3
        for (int i = 0; i < 2; ++i) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"3---%@",[NSThread currentThread]);      // 打印当前线程
        }
    });

    NSLog(@"syncConcurrent---end");
    /**
     从同步执行 + 并发队列中可看到：

     1、所有任务都是在当前线程（主线程）中执行的，没有开启新的线程（同步执行不具备开启新线程的能力）。
     2、所有任务都在打印的syncConcurrent---begin和syncConcurrent---end之间执行的（同步任务需要等待队列的任务执行结束）。
     3、任务按顺序执行的。按顺序执行的原因：
     虽然并发队列可以开启多个线程，并且同时执行多个任务。但是因为本身不能创建新线程，只有当前线程这一个线程（同步任务不具备开启新线程的能力），所以也就不存在并发。而且当前线程只有等待当前队列中正在执行的任务执行完毕之后，才能继续接着执行下面的操作（同步任务需要等待队列的任务执行结束）。所以任务只能一个接一个按顺序执行，不能同时被执行。

     */
}

// 异步 + 并发 任务
- (void)asyncConcurrent {

    NSLog(@"currentThread---%@",[NSThread currentThread]);  // 打印当前线程
    NSLog(@"syncConcurrent---begin");

    dispatch_queue_t queue = dispatch_queue_create("com.zjk.test3", DISPATCH_QUEUE_CONCURRENT);

    dispatch_async(queue, ^{
        // 追加任务1
        for (int i = 0; i < 2; ++i) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"1---%@",[NSThread currentThread]);      // 打印当前线程
        }
    });

    dispatch_async(queue, ^{
        // 追加任务2
        for (int i = 0; i < 2; ++i) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"2---%@",[NSThread currentThread]);      // 打印当前线程
        }
    });

    dispatch_async(queue, ^{
        // 追加任务3
        for (int i = 0; i < 2; ++i) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"3---%@",[NSThread currentThread]);      // 打印当前线程
        }
    });

    NSLog(@"syncConcurrent---end");

    /**
     除了当前线程（主线程），系统又开启了3个线程，并且任务是交替/同时执行的。
     （异步执行具备开启新线程的能力。且并发队列可开启多个线程，同时执行多个任务）。
     所有任务是在打印的syncConcurrent---begin和syncConcurrent---end之后才执行的。
     说明当前线程没有等待，而是直接开启了新线程，在新线程中执行任务（异步执行不做等待，可以继续执行任务）。
     */
}

// 同步 + 串行
// sync + serial
- (void)syncSerial {
    NSLog(@"currentThread---%@",[NSThread currentThread]);  // 打印当前线程
    NSLog(@"syncConcurrent---begin");

    dispatch_queue_t queue = dispatch_queue_create("com.zjk.syncSerialTest", DISPATCH_QUEUE_SERIAL);

    dispatch_sync(queue, ^{
        // 追加任务1
        for (int i = 0; i < 2; ++i) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"1---%@",[NSThread currentThread]);      // 打印当前线程
        }
    });

    dispatch_sync(queue, ^{
        // 追加任务2
        for (int i = 0; i < 2; ++i) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"2---%@",[NSThread currentThread]);      // 打印当前线程
        }
    });

    dispatch_sync(queue, ^{
        // 追加任务3
        for (int i = 0; i < 2; ++i) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"3---%@",[NSThread currentThread]);      // 打印当前线程
        }
    });

    NSLog(@"syncConcurrent---end");

}
/**
 * 异步执行 + 串行队列
 * 特点：会开启新线程，但是因为任务是串行的，执行完一个任务，再执行下一个任务。
 */
- (void)asyncSerial {
    NSLog(@"currentThread---%@",[NSThread currentThread]);  // 打印当前线程
    NSLog(@"syncConcurrent---begin");

    dispatch_queue_t queue = dispatch_queue_create("com.zjk.syncSerialTest", DISPATCH_QUEUE_SERIAL);

    dispatch_async(queue, ^{
        // 追加任务1
        for (int i = 0; i < 2; ++i) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"1---%@",[NSThread currentThread]);      // 打印当前线程
        }
    });

    dispatch_async(queue, ^{
        // 追加任务2
        for (int i = 0; i < 2; ++i) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"2---%@",[NSThread currentThread]);      // 打印当前线程
        }
    });

    dispatch_async(queue, ^{
        // 追加任务3
        for (int i = 0; i < 2; ++i) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"3---%@",[NSThread currentThread]);      // 打印当前线程
        }
    });

    [NSThread sleepForTimeInterval:2];              // 模拟耗时操作

    NSLog(@"syncConcurrent---end");

}
- (void)syncMain {
    // 主线程（串行同步）中执行同步
    dispatch_queue_t queue = dispatch_get_main_queue();
    NSLog(@"syncConcurrent---begin");

    dispatch_sync(queue, ^{
        for (int i = 0; i < 2; ++i) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"1---%@",[NSThread currentThread]);      // 打印当前线程
        }
    });
    dispatch_sync(queue, ^{
        for (int i = 0; i < 2; ++i) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"2---%@",[NSThread currentThread]);      // 打印当前线程
        }
    });
    dispatch_sync(queue, ^{
        for (int i = 0; i < 2; ++i) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"3---%@",[NSThread currentThread]);      // 打印当前线程
        }
    });
    dispatch_sync(queue, ^{
        for (int i = 0; i < 2; ++i) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"4---%@",[NSThread currentThread]);      // 打印当前线程
        }
    });
    NSLog(@"syncConcurrent---end");

}
- (void)asyncMain {
    // 主线程（串行同步）中执行同步
    dispatch_queue_t queue = dispatch_get_main_queue();
    NSLog(@"syncConcurrent---begin");

    dispatch_async(queue, ^{
        for (int i = 0; i < 2; ++i) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"1---%@",[NSThread currentThread]);      // 打印当前线程
        }
    });
    dispatch_async(queue, ^{
        for (int i = 0; i < 2; ++i) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"2---%@",[NSThread currentThread]);      // 打印当前线程
        }
    });
    dispatch_async(queue, ^{
        for (int i = 0; i < 2; ++i) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"3---%@",[NSThread currentThread]);      // 打印当前线程
        }
    });
    dispatch_async(queue, ^{
        for (int i = 0; i < 2; ++i) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"4---%@",[NSThread currentThread]);      // 打印当前线程
        }
    });
    NSLog(@"syncConcurrent---end");

}

/**
 * semaphore 线程同步
 */
- (void)semaphoreSync {

    NSLog(@"currentThread---%@",[NSThread currentThread]);  // 打印当前线程
    NSLog(@"semaphore---begin");

    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

    __block int number = 0;
    dispatch_async(queue, ^{
        // 追加任务1
        [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
        NSLog(@"1---%@",[NSThread currentThread]);      // 打印当前线程

        number = 100;

        dispatch_semaphore_signal(semaphore);
    });

    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    NSLog(@"semaphore---end,number = %d",number);
}


/**
 group
 */
- (void)testDispatchGroup {

    // dispath group
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t queue = dispatch_queue_create("com.dispatch.group.text", DISPATCH_QUEUE_CONCURRENT);
    dispatch_group_enter(group);
    dispatch_group_async(group, queue, ^{
        for (int i = 0; i<30; i++) {
            NSLog(@"group-1 %d", i);
        }

        dispatch_queue_t cqueue = dispatch_queue_create("com.dispatch.group.text2", DISPATCH_QUEUE_CONCURRENT);
        dispatch_async(cqueue, ^{
            [NSThread sleepForTimeInterval:2];// 模拟耗时操作
            NSLog(@"group is dealwith async");
            dispatch_group_leave(group);
        });
        NSLog(@"group-1");

    });

    dispatch_group_async(group, queue, ^{
        for (int i = 0; i<20; i++) {
            NSLog(@"group-2 %d", i);
        }
        NSLog(@"group-2");

    });

    dispatch_group_async(group, queue, ^{
        for (int i = 0; i<10; i++) {
            NSLog(@"group-3 %d", i);
        }
        NSLog(@"group-3");

    });
    
    dispatch_group_notify(group, queue, ^{
        NSLog(@"group-finish");
    });
}

/**
 Barrier
 */
- (void)testDispatchBarrier {


    // 1.创建queue
    dispatch_queue_t queue = dispatch_queue_create("com.zjk.testBarrier", DISPATCH_QUEUE_CONCURRENT);

    // 2.开启异步任务

    // 2.1
    dispatch_async(queue, ^{
        for (int i = 0; i<5; i++ ) {
            NSLog(@"2.1 == %d", i);
        }
    });

    // 2.2
    dispatch_async(queue, ^{
        for (int i = 0; i<5; i++ ) {
            NSLog(@"2.2 == %d", i);
        }
    });

    // 2.3
    dispatch_async(queue, ^{
        for (int i = 0; i<5; i++ ) {
            NSLog(@"2.3 == %d", i);
        }
    });

    // 2.4
    dispatch_async(queue, ^{
        for (int i = 0; i<5; i++ ) {
            NSLog(@"2.4 == %d", i);
        }
    });

    // 3. 使用barrier 先执行前面的逻辑

    dispatch_barrier_async(queue, ^{
        NSLog(@"dispatch_barrier_async 栅栏执行 ");
    });

    // 4 继续执行异步并发任务
    dispatch_async(queue, ^{
        for (int i = 0; i<5; i++ ) {
            NSLog(@"4.1 == %d", i);
        }
    });

    dispatch_async(queue, ^{
        for (int i = 0; i<5; i++ ) {
            NSLog(@"4.2 == %d", i);
        }
    });
}

/**
 once_token
 */
- (void)testDispatchOnceToken {

    // 参考单例的实现
    // 多次调用此方法会发现 系统只会仅仅执行一次block里面的算法
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSLog(@"执行一次");
    });
}
@end

//
//  OperationAction.m
//  TEST
//
//  Created by zhangjikuan on 2019/3/8.
//  Copyright © 2019 winchannel. All rights reserved.
//

#import "OperationAction.h"
#import "CustomOperation.h"

@interface OperationAction ()
@property (nonatomic, assign) NSInteger ticketSurplusCount;
@property (nonatomic, strong) NSLock *lock;
@end

@implementation OperationAction

- (void)testAation {
    // 苹果提供的一套多线程解决方案
    // 实质是基于GCD更高一层的封装，完全面向对象
    // 为何要使用NSOperation、NSOperationQueue

    // 概念性： 任务 队列
    // NSOperation 是个抽象类，不能用来封装操作。
    // 需要使用它的子类来封装操作
    //   1. NSBlockOperation;
    //   2. NSInvocationOperation;
    //   3. 自定义子类，通过实现内部相应的方法来封装操作

    // 开启新线程
    [NSThread detachNewThreadSelector:@selector(useInvocationOperation) toTarget:self withObject:nil];

    
}
/////////////////////////////////////使用三种创建方式///////////////////////////////////////////

/////////////////////////////////////NSInvocationOperation///////////////////////////////////////////

/**
 使用NSInvocationOperation 来进行操作
 */
- (void)useInvocationOperation {
    // 1. create operation
    NSInvocationOperation *operation = [[NSInvocationOperation alloc] initWithTarget:self
                                                                            selector:@selector(task1)
                                                                              object:nil];
    // 2. task start
    [operation start];

}
- (void)task1 {
    for (int i = 0; i < 2; i++) {
        // 模拟耗时操作
        [NSThread sleepForTimeInterval:2];
        NSLog(@"task1 ---------- %@", [NSThread currentThread]);
    }

}
/////////////////////////////////////NSBlockOperation///////////////////////////////////////////
- (void)useBlockOperation {
    // create block operation
    NSBlockOperation *op = [NSBlockOperation blockOperationWithBlock:^{
        for (int i = 0; i < 2; i++) {
            // 模拟耗时操作
            [NSThread sleepForTimeInterval:2];
            NSLog(@"task2 ---------- %@", [NSThread currentThread]);
        }
    }];
    [op start];
}

- (void)useBlockOperationAddExecutionBlock {
    // create block operation
    NSBlockOperation *op = [NSBlockOperation blockOperationWithBlock:^{
        for (int i = 0; i < 2; i++) {
            // 模拟耗时操作
            [NSThread sleepForTimeInterval:2];
            NSLog(@"task2.1 ---------- %@", [NSThread currentThread]);
        }
    }];

    // 添加额外操作
    [op addExecutionBlock:^{
        for (int i = 0; i < 2; i++) {
            // 模拟耗时操作
            [NSThread sleepForTimeInterval:2];
            NSLog(@"task2.2 ---------- %@", [NSThread currentThread]);
        }
    }];
    for (int i = 0; i < 2; i++) {
        // 模拟耗时操作
        [NSThread sleepForTimeInterval:2];
        NSLog(@"task2.3 ---------- %@", [NSThread currentThread]);
    }
    for (int i = 0; i < 2; i++) {
        // 模拟耗时操作
        [NSThread sleepForTimeInterval:2];
        NSLog(@"task2.4 ---------- %@", [NSThread currentThread]);
    }
    for (int i = 0; i < 2; i++) {
        // 模拟耗时操作
        [NSThread sleepForTimeInterval:2];
        NSLog(@"task2.5 ---------- %@", [NSThread currentThread]);
    }
    for (int i = 0; i < 2; i++) {
        // 模拟耗时操作
        [NSThread sleepForTimeInterval:2];
        NSLog(@"task2.6 ---------- %@", [NSThread currentThread]);
    }
    for (int i = 0; i < 2; i++) {
        // 模拟耗时操作
        [NSThread sleepForTimeInterval:2];
        NSLog(@"task2.7 ---------- %@", [NSThread currentThread]);
    }
    /**
     但是，NSBlockOperation 还提供了一个方法 addExecutionBlock:，
     通过 addExecutionBlock: 就可以为 NSBlockOperation 添加额外的操作。
     这些操作（包括 blockOperationWithBlock 中的操作）可以在不同的线程中同时（并发）执行。
     只有当所有相关的操作已经完成执行时，才视为完成。
     */
    /*
     2019-05-23 14:43:53.952633+0800 TEST[75247:2943288] task1 ---------- <NSThread: 0x60000098c840>{number = 1, name = main}
     2019-05-23 14:43:55.952939+0800 TEST[75247:2943288] task1 ---------- <NSThread: 0x60000098c840>{number = 1, name = main}
     2019-05-23 14:43:57.953557+0800 TEST[75247:2943288] task2.3 ---------- <NSThread: 0x60000098c840>{number = 1, name = main}
     2019-05-23 14:43:57.954222+0800 TEST[75247:2943572] task1 ---------- <NSThread: 0x6000009e7100>{number = 3, name = (null)}
     2019-05-23 14:43:59.954815+0800 TEST[75247:2943288] task2.3 ---------- <NSThread: 0x60000098c840>{number = 1, name = main}
     2019-05-23 14:43:59.954815+0800 TEST[75247:2943572] task1 ---------- <NSThread: 0x6000009e7100>{number = 3, name = (null)}
     2019-05-23 14:44:01.955041+0800 TEST[75247:2943288] task2.4 ---------- <NSThread: 0x60000098c840>{number = 1, name = main}
     2019-05-23 14:44:03.956202+0800 TEST[75247:2943288] task2.4 ---------- <NSThread: 0x60000098c840>{number = 1, name = main}
     2019-05-23 14:44:05.957390+0800 TEST[75247:2943288] task2.5 ---------- <NSThread: 0x60000098c840>{number = 1, name = main}
     2019-05-23 14:44:07.957550+0800 TEST[75247:2943288] task2.5 ---------- <NSThread: 0x60000098c840>{number = 1, name = main}
     2019-05-23 14:44:09.957689+0800 TEST[75247:2943288] task2.6 ---------- <NSThread: 0x60000098c840>{number = 1, name = main}
     2019-05-23 14:44:11.958881+0800 TEST[75247:2943288] task2.6 ---------- <NSThread: 0x60000098c840>{number = 1, name = main}
     2019-05-23 14:44:13.960127+0800 TEST[75247:2943288] task2.7 ---------- <NSThread: 0x60000098c840>{number = 1, name = main}
     2019-05-23 14:44:15.961370+0800 TEST[75247:2943288] task2.7 ---------- <NSThread: 0x60000098c840>{number = 1, name = main}
     2019-05-23 14:44:17.962652+0800 TEST[75247:2943363] task2.2 ---------- <NSThread: 0x6000009e3300>{number = 4, name = (null)}
     2019-05-23 14:44:17.962642+0800 TEST[75247:2943288] task2.1 ---------- <NSThread: 0x60000098c840>{number = 1, name = main}
     2019-05-23 14:44:19.963939+0800 TEST[75247:2943288] task2.1 ---------- <NSThread: 0x60000098c840>{number = 1, name = main}
     2019-05-23 14:44:19.963939+0800 TEST[75247:2943363] task2.2 ---------- <NSThread: 0x6000009e3300>{number = 4, name = (null)}
     */
    // task start
    /*
     可以看出：使用子类 NSBlockOperation，并调用方法 AddExecutionBlock: 的情况下，
     blockOperationWithBlock:方法中的操作 和 addExecutionBlock: 中的操作是在不同的线程中异步执行的。
     而且，这次执行结果中 blockOperationWithBlock:方法中的操作也不是在当前线程（主线程）中执行的。
     从而印证了blockOperationWithBlock: 中的操作也可能会在其他线程（非当前线程）中执行。
     */
    [op start];
}
- (void)useCutomOperation {
    CustomOperation *operation = [[CustomOperation alloc] init];
    [operation start];
    
}
- (void)addOperationToQueue {
    //1. create queue
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];

    // 2.create invocationOperation
    NSInvocationOperation *op1 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(task1) object:nil];

    NSInvocationOperation *op2 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(task2) object:nil];

    NSBlockOperation *op3 = [NSBlockOperation blockOperationWithBlock:^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
            NSLog(@"3---%@", [NSThread currentThread]); // 打印当前线程
        }
    }];

    [op3 addExecutionBlock:^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
            NSLog(@"4---%@", [NSThread currentThread]); // 打印当前线程
        }
    }];

    // addOperation to queue
    [queue addOperation:op1];
    [queue addOperation:op2];
    [queue addOperation:op3];

}
- (void)task2 {
    for (int i = 0; i < 2; i++) {
        [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
        NSLog(@"2---%@", [NSThread currentThread]); // 打印当前线程
    }
}

- (void)addOperationWithBlockToQueue {
    // 1.创建队列
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];

    // 2.使用 addOperationWithBlock: 添加操作到队列中
    [queue addOperationWithBlock:^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
            NSLog(@"1---%@", [NSThread currentThread]); // 打印当前线程
        }
    }];
    [queue addOperationWithBlock:^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
            NSLog(@"2---%@", [NSThread currentThread]); // 打印当前线程
        }
    }];
    [queue addOperationWithBlock:^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
            NSLog(@"3---%@", [NSThread currentThread]); // 打印当前线程
        }
    }];
}
- (void)setMaxConcurrentOperationCount:(NSInteger)count {
    //1.创建队列
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    queue.maxConcurrentOperationCount = count; // 串行队列
    // queue.maxConcurrentOperationCount = 1; // 串行
    // queue.maxConcurrentOperationCount = 2; // 并发队列
    // queue.maxConcurrentOperationCount = 8; // 并发队列
    [queue addOperationWithBlock:^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
            NSLog(@"1---%@", [NSThread currentThread]); // 打印当前线程
        }
    }];
    [queue addOperationWithBlock:^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
            NSLog(@"2---%@", [NSThread currentThread]); // 打印当前线程
        }
    }];
    [queue addOperationWithBlock:^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
            NSLog(@"3---%@", [NSThread currentThread]); // 打印当前线程
        }
    }];
    [queue addOperationWithBlock:^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
            NSLog(@"4---%@", [NSThread currentThread]); // 打印当前线程
        }
    }];
}
- (void)addDependency {
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];

    NSBlockOperation *op1 = [NSBlockOperation blockOperationWithBlock:^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
            NSLog(@"1---%@", [NSThread currentThread]); // 打印当前线程
        }
    }];

    NSBlockOperation *op2 = [NSBlockOperation blockOperationWithBlock:^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
            NSLog(@"2---%@", [NSThread currentThread]); // 打印当前线程
        }
    }];

    // 添加依赖
    [op2 addDependency:op1];

    // 添加到队列中
    [queue addOperation:op1];
    [queue addOperation:op2];
    /*通过添加操作依赖，无论运行几次，其结果都是 op1 先执行，op2 后执行。*/ 
}
- (void)communication {
    // 1.创建队列
    NSOperationQueue *queue = [[NSOperationQueue alloc]init];

    // 2.添加操作
    [queue addOperationWithBlock:^{
        // 异步进行耗时操作
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
            NSLog(@"1---%@", [NSThread currentThread]); // 打印当前线程
        }

        // 回到主线程
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            // 进行一些 UI 刷新等操作
            for (int i = 0; i < 2; i++) {
                [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
                NSLog(@"2---%@", [NSThread currentThread]); // 打印当前线程
            }
        }];
    }];
}
- (void)initTicketStatusNotSave {
    NSLog(@"currentThread---%@",[NSThread currentThread]); // 打印当前线程

    self.ticketSurplusCount = 50;

    // 1.创建 queue1,queue1 代表北京火车票售卖窗口
    NSOperationQueue *queue1 = [[NSOperationQueue alloc] init];
    queue1.maxConcurrentOperationCount = 1;

    // 2.创建 queue2,queue2 代表上海火车票售卖窗口
    NSOperationQueue *queue2 = [[NSOperationQueue alloc] init];
    queue2.maxConcurrentOperationCount = 1;

    // 3.创建卖票操作 op1
    NSBlockOperation *op1 = [NSBlockOperation blockOperationWithBlock:^{
        [self saleTicketNotSafe];
    }];

    // 4.创建卖票操作 op2
    NSBlockOperation *op2 = [NSBlockOperation blockOperationWithBlock:^{
        [self saleTicketNotSafe];
    }];

    // 5.添加操作，开始卖票
    [queue1 addOperation:op1];
    [queue2 addOperation:op2];
}
/**
 * 售卖火车票(非线程安全)
 */
- (void)saleTicketNotSafe {
    while (1) {

        if (self.ticketSurplusCount > 0) {
            //如果还有票，继续售卖
            self.ticketSurplusCount--;
            NSLog(@"%@", [NSString stringWithFormat:@"剩余票数:%d 窗口:%@", self.ticketSurplusCount, [NSThread currentThread]]);
            [NSThread sleepForTimeInterval:0.2];
        } else {
            NSLog(@"所有火车票均已售完");
            break;
        }
    }
}
- (void)initTicketStatusSave {
    NSLog(@"currentThread---%@",[NSThread currentThread]); // 打印当前线程

    self.ticketSurplusCount = 50;

    self.lock = [[NSLock alloc] init];  // 初始化 NSLock 对象

    // 1.创建 queue1,queue1 代表北京火车票售卖窗口
    NSOperationQueue *queue1 = [[NSOperationQueue alloc] init];
    queue1.maxConcurrentOperationCount = 1;

    // 2.创建 queue2,queue2 代表上海火车票售卖窗口
    NSOperationQueue *queue2 = [[NSOperationQueue alloc] init];
    queue2.maxConcurrentOperationCount = 1;

    // 3.创建卖票操作 op1
    NSBlockOperation *op1 = [NSBlockOperation blockOperationWithBlock:^{
        [self saleTicketSafe];
    }];

    // 4.创建卖票操作 op2
    NSBlockOperation *op2 = [NSBlockOperation blockOperationWithBlock:^{
        [self saleTicketSafe];
    }];

    // 5.添加操作，开始卖票
    [queue1 addOperation:op1];
    [queue2 addOperation:op2];
}

/**
 * 售卖火车票(线程安全)
 */
- (void)saleTicketSafe {
    while (1) {

        // 加锁
        [self.lock lock];

        if (self.ticketSurplusCount > 0) {
            //如果还有票，继续售卖
            self.ticketSurplusCount--;
            NSLog(@"%@", [NSString stringWithFormat:@"剩余票数:%d 窗口:%@", self.ticketSurplusCount, [NSThread currentThread]]);
            [NSThread sleepForTimeInterval:0.2];
        }

        // 解锁
        [self.lock unlock];

        if (self.ticketSurplusCount <= 0) {
            NSLog(@"所有火车票均已售完");
            break;
        }
    }
}
@end


//
//  GloableOperation.m
//  TEST
//
//  Created by zhangjikuan on 2019/5/23.
//  Copyright © 2019 winchannel. All rights reserved.
//

#import "GloableOperation.h"
#import "OperationAction.h"
#import "CustomOperation.h"

@implementation GloableOperation
- (void)deal_OperationClass {
    OperationAction *action = [[OperationAction alloc] init];
    // 1.可以看到：在没有使用 NSOperationQueue、在主线程中单独使用使用子类
    // NSInvocationOperation 执行一个操作的情况下，操作是在当前线程执行的，并没有开启新线程。
    [action useInvocationOperation];

    // 2.可以看到：在其他线程中单独使用子类 NSInvocationOperation，操作是在当前调用的其他线程执行的，并没有开启新线程。
    [action testAation];

    // 3.在没有使用 NSOperationQueue、在主线程中单独使用 NSBlockOperation
    // 执行一个操作的情况下，操作是在当前线程执行的，并没有开启新线程。
    [action useBlockOperation];

    // 4.通过 addExecutionBlock: 就可以为 NSBlockOperation 添加额外的操作。
    // 这些操作（包括 blockOperationWithBlock 中的操作）可以在不同的线程中同时（并发）执行。
    // 只有当所有相关的操作已经完成执行时，才视为完成。
    [action useBlockOperationAddExecutionBlock];

    // 5. 自定义的custom
    // 可以看出：在没有使用 NSOperationQueue、在主线程单独使用自定义继承自 NSOperation 的子类的情况下，是在主线程执行操作，并没有开启新线程。
    [action useCutomOperation];

    // 6.addOperationtoqueue
    // 可以看出：使用 NSOperation 子类创建操作，并使用 addOperation: 将操作加入到操作队列后能够开启新线程，进行并发执行。
    
    [action addOperationToQueue];

    // 7.使用 addOperationWithBlock: 将操作加入到操作队列后能够开启新线程，进行并发执行。
    [action addOperationWithBlockToQueue];

    // 8. 设置并发数
    [action setMaxConcurrentOperationCount:1];

    // 9.添加依赖
    [action addDependency];

    // 10.线程之间的安全问题
    [action initTicketStatusNotSave];

    // 线程安全
    [action initTicketStatusSave];

}
- (NSString *)operationTitle {
    return @"NSOperation 线程";
}
- (NSArray<NSString *> *)operations {
    return @[@"1.useInvocationOperation",
             @"2.testAation",
             @"3.useBlockOperation",
             @"4.useBlockOperationAddExecutionBlock",
             @"5.useCutomOperation",
             @"6.addOperationToQueue",
             @"7.addOperationWithBlockToQueue",
             @"8.setMaxConcurrentOperationCount",
             @"9.addDependency",
             @"10.initTicketStatusNotSave",
             @"11.saleTicketSafe"];
}
- (void)operationTarget:(id)target WithIndex:(NSInteger)index {
    [self deal_opertationWithIndex:index];
}
- (void)deal_opertationWithIndex:(NSInteger)index {
    OperationAction *action = [[OperationAction alloc] init];

    switch (index) {
        case 0:
            [action useInvocationOperation];

            break;
        case 1:
            [action testAation];

            break;
        case 2:
            [action useBlockOperation];

            break;
        case 3:
            [action useBlockOperationAddExecutionBlock];

            break;
        case 4:
            [action useCutomOperation];

            break;
        case 5:
            [action addOperationToQueue];

            break;
        case 6:
            [action addOperationWithBlockToQueue];

            break;
        case 7:
            [action setMaxConcurrentOperationCount:1];

            break;
        case 8:
            [action addDependency];

            break;
        case 9:
            [action initTicketStatusNotSave];

            break;
        case 10:

            [action initTicketStatusSave];
            break;

        default:
            break;
    }
}
@end

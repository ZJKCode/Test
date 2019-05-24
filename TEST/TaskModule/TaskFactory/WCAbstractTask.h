//
//  WCAbstractTask.h
//  TEST
//
//  Created by zhangjikuan on 2019/4/22.
//  Copyright © 2019 winchannel. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum {
    TASK_STATUS_SUCCESS,

    TASK_STATUS_FAILDE,

    TASK_STATUS_INTERREPT,

}TASK_STATUS;

@class WCAbstractTask;

@protocol WCAbstractTaskDelegate <NSObject>

-(void)dofinishTaskBack:(NSObject *)object;

-(void)doSuccessFinishTaskBack:(WCAbstractTask *)task;

-(void)doTaskInprocess:(WCAbstractTask *)task;

-(void)doFailedFinishTaskBack:(WCAbstractTask *)task;

@end

@interface WCAbstractTask : NSObject

@property (nonatomic, copy) NSString *taskName;

@property (nonatomic, copy)  NSMutableDictionary *taskparam;

@property (nonatomic, copy) NSString *taskSynType;

@property (nonatomic, copy) NSString *taskReturnType;

@property (nonatomic, copy) NSString *dependonTaskResult;

@property (nonatomic, copy) NSString *needParam;

@property (nonatomic, copy)  NSObject *resultafterexecute;

@property (nonatomic, copy)  NSString *dependresultfromtask;

@property (nonatomic, weak) id <WCAbstractTaskDelegate> delegate;

@property (nonatomic, assign) TASK_STATUS  executionstatus;

@property (nonatomic, copy) NSString *specific_task;

- (id)init;

- (id)initWithParam:(NSMutableDictionary *)paramdict;

- (void)acceptParam:(NSObject *)param;

- (void)doTask;

- (void)taskFailedTod;

- (NSMutableDictionary *)doTaskWithReturn;


@end

NS_ASSUME_NONNULL_END

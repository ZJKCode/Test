//
//  WCTaskExecutor.h
//  TEST
//
//  Created by zhangjikuan on 2019/4/22.
//  Copyright © 2019 winchannel. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class WCTaskExecutor;

@class WCAbstractTask;

@protocol WCTaskExecutorDelegate <NSObject>

- (void)doTaskFaild:(WCAbstractTask *)task;

- (void)doTaskSuccess:(WCAbstractTask *)task;

- (void)taskExecutionEnd:(NSMutableDictionary *)dict;

@end

@interface WCTaskExecutor : NSObject

@property (nonatomic, strong) NSMutableArray *taskArray;

@property (nonatomic, weak) id <WCTaskExecutorDelegate> delegate;

@property (nonatomic, assign) BOOL execute_by_order;


-(id)initWithTaskFile:(NSString *)taskfile;

-(void)doExecuteOperation;

-(void)destoryAllTask;

-(void)reStartTaskAtTaskIndex:(NSInteger)index;

-(NSInteger)findTaskIndByName:(NSString *)name;

@end

NS_ASSUME_NONNULL_END

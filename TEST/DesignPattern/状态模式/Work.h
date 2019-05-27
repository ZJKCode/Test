//
//  Work.h
//  Design Pattern
//
//  Created by zhangjikuan on 2016/9/26.
//  Copyright © 2016年 zhang_jk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "State.h"

@interface Work : NSObject

@property (nonatomic, strong) id<State> current;
@property (nonatomic, assign) double hour;
@property (nonatomic, assign) BOOL finish;

- (void) writeProgram;

@end

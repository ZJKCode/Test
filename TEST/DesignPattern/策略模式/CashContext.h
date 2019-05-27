//
//  CashContext.h
//  Design Pattern
//
//  Created by zhangjikuan on 16/8/31.
//  Copyright © 2016年 zhang_jk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CashSuper.h"

@interface CashContext : NSObject
- (void) cashContext:(id<CashSuper>)cashSuper;

- (double)getResult:(double)money;

- (void) cashContext1:(NSString *)type;

@end


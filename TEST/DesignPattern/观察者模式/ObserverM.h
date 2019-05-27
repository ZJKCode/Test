//
//  ObserverM.h
//  Design Pattern
//
//  Created by zhangjikuan on 16/9/22.
//  Copyright © 2016年 zhang_jk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Subject.h"

@interface ObserverM : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) Subject *sub;
- (instancetype)initWithObserver:(NSString *)name withSubject:(Subject *)subject;

@end

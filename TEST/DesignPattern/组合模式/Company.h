//
//  Company.h
//  Design Pattern
//
//  Created by zhangjikuan on 2016/10/9.
//  Copyright © 2016年 zhang_jk. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Company <NSObject>

// 增加
- (void) add:(id<Company>)c;
// 移除
- (void) remove:(id<Company>)c;
// 显示
- (void) display:(int)depth;
// 旅行职责
- (void) lineOfDuty;

@end

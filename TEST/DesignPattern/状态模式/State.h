//
//  State.h
//  Design Pattern
//
//  Created by zhangjikuan on 2016/9/26.
//  Copyright © 2016年 zhang_jk. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Work;

@protocol State <NSObject>
- (void)writeProgram:(Work *)w;

@end

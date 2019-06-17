//
//  AutoRealsePool.h
//  TEST
//
//  Created by zhangjikuan on 2019/6/14.
//  Copyright © 2019 winchannel. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AutoRealsePool : NSObject

/**
 没有AutoReleasePool
 */
- (void)functionWithNOAutoReleasePool;

/**
 在使用AutoReleasePool函数
 */
- (void)functionWithAutoReleasePool;

@end

NS_ASSUME_NONNULL_END

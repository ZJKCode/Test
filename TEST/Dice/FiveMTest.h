//
//  FiveMTest.h
//  TEST
//
//  Created by zhangjikuan on 2019/7/22.
//  Copyright © 2019 winchannel. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FiveMTest : NSObject

+ (instancetype) shareInstance;


- (NSString *)calculateNextWillShow:(NSInteger)thisResult;


@end

NS_ASSUME_NONNULL_END

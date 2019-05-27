//
//  ZJKDeviceMananger.h
//  TEST
//
//  Created by zhangjikuan on 2019/5/27.
//  Copyright © 2019 winchannel. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZJKDeviceMananger : NSObject

/**
 是否是iPhoneX

 @return YES 设备是iPhoneX NO
 */
+ (BOOL)isiPhoneX;

+ (NSMutableArray *)getMonthList:(NSInteger)mothonNumber;

@end

NS_ASSUME_NONNULL_END

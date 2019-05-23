//
//  RandomMoney.h
//  TEST
//
//  Created by zhangjikuan on 2019/2/11.
//  Copyright © 2019 winchannel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class RedPackage;

@interface RandomMoney : NSObject

- (CGFloat)getRandomMoney:(RedPackage *)redPackage;


@end

@interface RedPackage : NSObject

@property (nonatomic, assign) NSInteger remainSize;

@property (nonatomic, assign) CGFloat remainMoney;

@end

NS_ASSUME_NONNULL_END

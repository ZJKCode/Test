//
//  Gasoline.h
//  TEST
//
//  Created by zhangjikuan on 2019/1/28.
//  Copyright © 2019 winchannel. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol Gasoline <NSObject>
/// setter && getter
@property(nonatomic, copy) NSString *name;
@property (nonatomic, assign, readonly) BOOL isQuality;

@end

NS_ASSUME_NONNULL_END

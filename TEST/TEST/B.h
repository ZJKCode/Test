//
//  B.h
//  TEST
//
//  Created by zhangjikuan on 2019/4/10.
//  Copyright © 2019 winchannel. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "C.h"
NS_ASSUME_NONNULL_BEGIN

@protocol BDelegate <NSObject>
- (void)BMethod;

@end

@interface B : NSObject

@property (nonatomic, weak) id<BDelegate> delegate;

@end

NS_ASSUME_NONNULL_END

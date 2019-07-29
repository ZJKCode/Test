//
//  SubCompanyManager.h
//  TEST
//
//  Created by zhangjikuan on 2019/7/24.
//  Copyright © 2019 winchannel. All rights reserved.
//

#import <Foundation/Foundation.h>


@class SubEmployee;


NS_ASSUME_NONNULL_BEGIN

@interface SubCompanyManager : NSObject

- (NSArray <SubEmployee *> *)getAllEmployee;


@end

NS_ASSUME_NONNULL_END

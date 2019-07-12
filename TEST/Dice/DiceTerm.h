//
//  DiceTerm.h
//  TEST
//
//  Created by zhangjikuan on 2019/7/12.
//  Copyright © 2019 winchannel. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DiceTerm : NSObject

+ (instancetype)shareInstance;
@property (nonatomic, assign) NSInteger count;
@property (nonatomic, copy) NSString *lastDate;
- (NSString *)currentTerm;



@end

NS_ASSUME_NONNULL_END

//
//  ModuleProtocolLogin.h
//  iToast
//
//  Created by zhangjikuan on 2019/5/21.
//  Copyright © 2019 com.winchannel. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ModuleProtocolLogin <NSObject>
@optional

- (void)changePassword;

- (void)loginOut;

- (void)forgetPassword;

- (void)bindMobile;

- (void)reBindMobile;

@end

NS_ASSUME_NONNULL_END

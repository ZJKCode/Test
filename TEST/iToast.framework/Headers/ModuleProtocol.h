//
//  ModuleProtocol.h
//  iToast
//
//  Created by zhangjikuan on 2019/5/21.
//  Copyright © 2019 com.winchannel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ModuleProtocolLogin.h"
#import "ModuleProtocolHome.h"
#import "ModuleProtocolShopplist.h"

NS_ASSUME_NONNULL_BEGIN

/**
 通用模块协议
 */
@protocol ModuleProtocol <NSObject, ModuleProtocolLogin, ModuleProtocolHome, ModuleProtocolShopplist>
@optional
- (void)reloadData;

- (void)refreshView;

- (void)share;

- (void)submmit;

- (void)changeChannel;

@end

NS_ASSUME_NONNULL_END

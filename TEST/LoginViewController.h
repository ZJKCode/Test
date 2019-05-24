//
//  LoginViewController.h
//  TEST
//
//  Created by zhangjikuan on 2019/5/21.
//  Copyright © 2019 winchannel. All rights reserved.
//

#import "ViewController.h"
#import <iToast/ModuleProtocolLogin.h>

NS_ASSUME_NONNULL_BEGIN

@interface LoginViewController : ViewController <ModuleProtocolLogin>
- (void)changePassword;

@end

NS_ASSUME_NONNULL_END

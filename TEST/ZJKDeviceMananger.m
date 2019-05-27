//
//  ZJKDeviceMananger.m
//  TEST
//
//  Created by zhangjikuan on 2019/5/27.
//  Copyright © 2019 winchannel. All rights reserved.
//

#import "ZJKDeviceMananger.h"
#import <UIKit/UIKit.h>

@implementation ZJKDeviceMananger
+ (BOOL)isiPhoneX {
    if (@available(iOS 11.0,*)) {

        UIWindow*keyWindow = [[[UIApplication sharedApplication] delegate]window];
        CGFloat bottomSafeInset = keyWindow.safeAreaInsets.bottom;
        if(bottomSafeInset == 34.0f|| bottomSafeInset == 21.0f){
            return YES;
        }
    }
    return NO;
}
@end

//
//  GloableMacro.h
//  TEST
//
//  Created by zhangjikuan on 2019/5/23.
//  Copyright © 2019 winchannel. All rights reserved.
//

#import "ZJKDeviceMananger.h"

#ifndef GloableMacro_h
#define GloableMacro_h

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define isiPhoneX [ZJKDeviceMananger isiPhoneX]
#define kNaviBarHeight (isiPhoneX?88:64)


#endif /* GloableMacro_h */

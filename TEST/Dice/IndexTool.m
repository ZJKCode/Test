//
//  IndexTool.m
//  TEST
//
//  Created by zhangjikuan on 2019/7/29.
//  Copyright © 2019 winchannel. All rights reserved.
//

#import "IndexTool.h"

@implementation IndexTool

+ (NSInteger)indexOfArrayForCount:(NSInteger)count
{
    switch (count) {
        case 1:
            return 0;
            break;
        case 3:
            return 1;
            break;
        case 8:
            return 2;
            break;
        case 24:
            return 3;
            break;
        case 72:
            return 4;
            break;
        case 216:
            return 5;
            break;
        case 648:
            return 6;
            break;
        case 1944:
            return 7;
            break;
        case 5832:
            return 8;
            break;
        case 17496:
            return 9;
            break;
        case 52488:
            return 10;
            break;
        case 157464:
            return 11;
            break;
        case 472392:
            return 12;
            break;
        case 1417176:
            return 13;
            break;
        case 4251528:
            return 14;
            break;
        case 127545884:
            return 15;
            break;
        case 127545884*3:
            return 16;
            break;
        case 127545884*9:
            return 17;
            break;
        default:
            break;
    }

    /// 此时已经必输无疑
    return 18;
}
@end

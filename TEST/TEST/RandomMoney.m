//
//  RandomMoney.m
//  TEST
//
//  Created by zhangjikuan on 2019/2/11.
//  Copyright © 2019 winchannel. All rights reserved.
//

#import "RandomMoney.h"
@implementation RandomMoney

- (CGFloat)getRandomMoney:(RedPackage *)redPackage{
    if (redPackage.remainSize == 1) {
        redPackage.remainSize --;
        return (double) round(redPackage.remainMoney * 100) / 100;
    }
    double min   = 0.01; //
    double max   = redPackage.remainMoney / redPackage.remainSize * 2;

    random();
    double money = random() * max;
    money = money <= min ? 0.01: money;
    money = floor(money * 100) / 100;
    redPackage.remainSize--;
    redPackage.remainMoney -= money;
    return money;
}

@end

@implementation RedPackage



@end

//
//  B.m
//  TEST
//
//  Created by zhangjikuan on 2019/4/10.
//  Copyright © 2019 winchannel. All rights reserved.
//

#import "B.h"

@implementation B


- (void)dealDelegate {
    if (self.delegate && [self.delegate respondsToSelector:@selector(BMethod)]) {
        [self.delegate BMethod];
    }
}

@end

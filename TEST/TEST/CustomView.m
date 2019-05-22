//
//  CustomView.m
//  TEST
//
//  Created by zhangjikuan on 2019/4/17.
//  Copyright © 2019 winchannel. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView
- (instancetype)init
{
    self = [super init];
    if (self) {

    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    NSLog(@"rect");

}
/// 1.
- (void)layoutSubviews{
    [super layoutSubviews];

    NSLog(@"layoutSubViews");
}
///2.
- (void)layoutIfNeeded {
    [super layoutIfNeeded];
}

/// 3.
- (void)setNeedsLayout {
    [super setNeedsLayout];
}

/// 4.
- (void)drawRect {
}

/// 5.
- (void)sizeThatFits {

}
/// 6.
- (void)sizeToFit {

}
@end

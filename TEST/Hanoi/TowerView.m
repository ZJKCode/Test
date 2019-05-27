//
//  TowerView.m
//  Hanoi
//
//  Created by apple on 2017/8/28.
//  Copyright © 2017年 sweetkk. All rights reserved.
//

#import "TowerView.h"

@implementation TowerView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // 竖线
        UIView *verticalView = [[UIView alloc] initWithFrame:CGRectMake((self.frame.size.width-5)/2, 0, 5, self.frame.size.height-5)];
        verticalView.backgroundColor = [UIColor darkGrayColor];
        [self addSubview:verticalView];
        
        // 横线
        UIView *horizontalView = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height-5, self.frame.size.width, 5)];
        horizontalView.backgroundColor = [UIColor darkGrayColor];
        [self addSubview:horizontalView];
    }
    return self;
}

@end

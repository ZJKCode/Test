//
//  HittestView.m
//  TEST
//
//  Created by zhangjikuan on 2019/1/30.
//  Copyright © 2019 winchannel. All rights reserved.
//

#import "HittestView.h"

@implementation HittestView

- (instancetype)init
{
    self = [super init];
    if (self) {

    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
        button.backgroundColor = [UIColor redColor];
        [button setTitle:@"按钮1" forState:UIControlStateNormal];
        button.tag = 1009;
        [button addTarget:self action:@selector(click1) forControlEvents:UIControlEventTouchUpInside];

        UIButton *button2 = [[UIButton alloc] initWithFrame:CGRectMake(160, 160, 200, 100)];
        button2.backgroundColor = [UIColor yellowColor];
        [button2 setTitle:@"按钮2" forState:UIControlStateNormal];
        button2.tag = 1010;
        [self addSubview:button];
        [self addSubview:button2];
        [button2 addTarget:self action:@selector(click2) forControlEvents:UIControlEventTouchUpInside];


    }
    return self;
}

- (void)click1 {
    NSLog(@"1");
}

- (void)click2 {
    NSLog(@"2");
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    // 1.判断当前控件能否接收事件
    if (self.userInteractionEnabled == NO || self.hidden == YES || self.alpha <= 0.01) return nil;
    // 2. 判断点在不在当前控件
    if ([self pointInside:point withEvent:event] == NO) return nil;
    // 3.从后往前遍历自己的子控件
    NSInteger count = self.subviews.count;
    for (NSInteger i = count - 1; i >= 0; i--) { // 系统的内部原理
        UIView *childView = self.subviews[i];
        // 把当前控件上的坐标系转换成子控件上的坐标系
        CGPoint childP = [self convertPoint:point toView:childView];
        UIView *fitView = [childView hitTest:childP withEvent:event];
        NSLog(@"view Tag : %ld", (long)fitView.tag);
        if (fitView) { // 寻找到最合适的view
            return fitView;
        }
    }

    // 3.1.从前往后遍历自己的子控件
    for (NSInteger i = 0; i < count; i++) {
        UIView *childView = self.subviews[i];
        // 把当前控件上的坐标系转换成子控件上的坐标系
        CGPoint childP = [self convertPoint:point toView:childView];
        UIView *fitView = [childView hitTest:childP withEvent:event];
        if (fitView) { // 寻找到最合适的view
            return fitView;
        }
    }
    // 循环结束,表示没有比自己更合适的view
    // 事件传递的内部原理
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

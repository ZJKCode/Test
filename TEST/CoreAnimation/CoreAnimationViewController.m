//
//  CoreAnimationViewController.m
//  TEST
//
//  Created by zhangjikuan on 2019/5/23.
//  Copyright © 2019 winchannel. All rights reserved.
//

#import "CoreAnimationViewController.h"
#import "CustomView.h"

@interface CoreAnimationViewController () <CAAnimationDelegate>

@end

@implementation CoreAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    switch (self.selectIndex) {
        case 0:
            [self testAnimation];
            break;

        default:
            break;
    }
}

- (void)testAnimation {
    CustomView *cView = [[CustomView alloc] initWithFrame:CGRectMake(100, 200, 50, 50)];
    cView.backgroundColor = [UIColor redColor];

    [self.view addSubview:cView];

    [UIView animateWithDuration:5.0 animations:^{
        cView.frame = CGRectMake(200, 400, 60, 60);
    } completion:^(BOOL finished) {
        cView.frame = CGRectMake(200, 400, 60, 60);
    }];

    [cView setNeedsLayout];
    // 1. 创建关键帧动画
    CAKeyframeAnimation *keyAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    [keyAnimation setValue:[NSValue valueWithCGPoint:CGPointMake(50, 614) ]forKey:@"LayerPosition"];

    // 2. 设置贝塞尔曲线路径
    CGMutablePathRef path = CGPathCreateMutable();
    // 设置易懂的起始点
    CGPathMoveToPoint(path, NULL, cView.layer.position.x, cView.layer.position.y);

    // 绘制二次贝塞尔曲线
    // 可以添加路径,
    CGPathAddCurveToPoint(path, NULL, 160, 280, -30, 300, 50, 400);
    CGPathAddCurveToPoint(path, NULL, 160, 500, -30, 600, 50, 614);
    // 给动画添加路径 设置路径属性
    keyAnimation.path = path;

    CAShapeLayer *shapLayer = [CAShapeLayer layer];
    shapLayer.path = path;
    shapLayer.fillColor = [UIColor blueColor].CGColor;

    shapLayer.lineWidth = 1.0f;

    [self.view.layer addSublayer:shapLayer];

    // 记得释放路径
    CGPathRelease(path);

    keyAnimation.calculationMode = kCAAnimationCubic;

    // 设置动画其他属性
    keyAnimation.duration = 5.0;
    keyAnimation.removedOnCompletion = NO;
    keyAnimation.repeatCount = 10;

    keyAnimation.delegate = self;

    // 给图层添加动画
    [cView.layer addAnimation:keyAnimation forKey:@"KCKeyAnimation_Positon"];

}


- (void)animationDidStart:(CAAnimation *)anim {

}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {

}
@end

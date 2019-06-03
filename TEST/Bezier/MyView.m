//
//  MyView.m
//  BezierPath_贝塞尔
//
//  Created by zhang_jk on 16/4/5.
//  Copyright © 2016年 Free_E. All rights reserved.
//

#import "MyView.h"

@interface MyView ()

@property (nonatomic, strong) UIBezierPath *bezierPath;
@property (nonatomic, strong) NSMutableArray *cancelArray;
//@property (nonatomic, strong) CAShapeLayer *shapLayer;

@end


@implementation MyView

- (void)drawRect:(CGRect)rect
{
    self.layer.sublayers = nil;
    for (int i = 0; i< self.allLine.count; i++) {
        NSMutableDictionary *dic = self.allLine[i];
        UIBezierPath *path = dic[@"line"];
        UIColor *tColor = dic[@"color"];
        NSNumber *num = dic[@"lineWidth"];
        CGFloat width = [num floatValue];
        
        CAShapeLayer *_shapLayer = [CAShapeLayer layer];
        _shapLayer.lineWidth =width;
        _shapLayer.path = path.CGPath;
        _shapLayer.strokeColor =  tColor.CGColor;
        _shapLayer.fillColor = [UIColor clearColor].CGColor;
        _shapLayer.lineJoin = kCALineJoinRound;
        _shapLayer.lineCap = kCALineCapRound;
        [self.layer addSublayer:_shapLayer];
    }
}

- (void)initMyView
{
    self.color = [UIColor redColor];
    self.lineWidth = 1.0f;
    self.allLine = [NSMutableArray arrayWithCapacity:50];
    self.cancelArray = [NSMutableArray arrayWithCapacity:50];
    self.layer.borderColor = [UIColor blueColor].CGColor;
    self.layer.borderWidth = 0.5f;
    
}

- (void)backImage
{
    if (self.allLine.count>0) {
        NSUInteger index = self.allLine.count - 1;
        [self.cancelArray addObject:self.allLine[index]];
        [self.allLine removeObjectAtIndex:index];
        [self setNeedsDisplay];
    }

}

- (void)forWardImage{
    if (self.cancelArray.count>0) {
        NSUInteger index = self.cancelArray.count - 1;
        [self.allLine addObject:self.cancelArray[index]];
        [self.cancelArray removeObjectAtIndex:index];
        [self setNeedsDisplay];
    }
}

/** 开始触屏*/
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    self.bezierPath = [UIBezierPath bezierPath];
    
    UITouch *myTouch = [touches anyObject];
    CGPoint pont = [myTouch locationInView:self];
    [self.bezierPath moveToPoint:pont];
    
    NSMutableDictionary *tempDic = [[NSMutableDictionary alloc] initWithCapacity:3];
    [tempDic setObject:self.color forKey:@"color"];
    [tempDic setObject:[NSNumber numberWithFloat:self.lineWidth] forKey:@"lineWidth"];
    [tempDic setObject:self.bezierPath forKey:@"line"];
    [self.allLine addObject:tempDic];
    
}

/** 触屏移动*/
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    [self.bezierPath addLineToPoint:point];
    [self setNeedsDisplay];
}

/** 触屏结束*/
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    [self.bezierPath addLineToPoint:point];
    [self setNeedsDisplay];

}



@end

//
//  ZJKBezierViewController.m
//  TEST
//
//  Created by zhangjikuan on 2019/5/27.
//  Copyright © 2019 winchannel. All rights reserved.
//

#import "ZJKBezierViewController.h"
#import "MyView.h"
#import "GloableMacro.h"
@interface ZJKBezierViewController ()
@property (nonatomic, strong) MyView *myView;

@end

@implementation ZJKBezierViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"";
    UIButton *btn1  = [self createButton:@"上一步"];
    UIButton *btn2 = [self createButton:@"下一步"];
    [self.view addSubview:btn1];
    [self.view addSubview:btn2];
    btn1.frame = CGRectMake(15, self.view.frame.size.height - 20 - kBottomDistanceHeight, 90, 20);
    btn2.frame = CGRectMake(self.view.frame.size.width - 115, self.view.frame.size.height - 20 - kBottomDistanceHeight, 90, 20);

    _myView = [[MyView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 30-kBottomDistanceHeight)];
    [_myView initMyView];
    [self.view addSubview:_myView];
}

- (UIButton *)createButton:(NSString *)buttonTitle {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:buttonTitle forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor blueColor]];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];

    return button;

}

@end

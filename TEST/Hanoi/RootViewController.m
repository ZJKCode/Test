//
//  RootViewController.m
//  Hanoi
//
//  Created by apple on 2017/8/28.
//  Copyright © 2017年 sweetkk. All rights reserved.
//

#import "RootViewController.h"
#import "TowerViewController.h"
#import "GloableMacro.h"

@interface RootViewController ()
@property (nonatomic, strong)UITextField *textField;
@property (nonatomic, strong)UIButton *startBtn;
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"输入层数";
    self.view.backgroundColor = [UIColor whiteColor];
    [self configUI];
}

- (void)configUI {
    [self.view addSubview:self.textField];
    [self.view addSubview:self.startBtn];
}
#pragma mark - getter
- (UITextField *)textField {
    if (!_textField) {
        _textField = [[UITextField alloc] initWithFrame:CGRectMake(0, kNaviBarHeight,SCREEN_WIDTH ,40)];
        _textField.borderStyle = UITextBorderStyleRoundedRect;
        _textField.placeholder = @"请输入汉诺塔层数";
        _textField.textAlignment = NSTextAlignmentCenter;
    }
    return _textField;
}

- (UIButton *)startBtn {
    if (!_startBtn) {
        _startBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_startBtn setTitle:@"确定" forState:UIControlStateNormal];
        _startBtn.frame = CGRectMake((SCREEN_WIDTH-100)*0.5, CGRectGetMaxY(self.textField.frame) + 15,100 , 30);
        _startBtn.backgroundColor = [UIColor yellowColor];
        _startBtn.layer.borderWidth = 1.0;
        _startBtn.layer.cornerRadius = 10;
        _startBtn.clipsToBounds = YES;
        [_startBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_startBtn addTarget:self action:@selector(start:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _startBtn;
}

#pragma mark - privite method
- (void)start:(UIButton *)btn {
    if (_textField.text.length>0) {
        TowerViewController *tower = [TowerViewController new];
        tower.diskNumber = [_textField.text intValue];
        [self.navigationController pushViewController:tower animated:YES];
    }else {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"请输入汉诺塔层数" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [alert dismissViewControllerAnimated:YES completion:nil];
        }];
        [alert addAction:action];
        [self presentViewController:alert animated:YES completion:nil];
    }

}

@end

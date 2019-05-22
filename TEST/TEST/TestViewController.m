//
//  TestViewController.m
//  TEST
//
//  Created by zhangjikuan on 2019/2/18.
//  Copyright © 2019 winchannel. All rights reserved.
//

#import "TestViewController.h"
#import "GCDAction.h"
#import "CustomView.h"

#import <iToast/UIView+iToast.h>
#import <iToast/Instancefactory.h>
#import <WCSDK/WCSDK.h>

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // 线程 (CPU 调度)
    // 任务：sync 和 async
    // 队列：串行队列 和 并发队列
//
//
//    [[GCDAction shareInstance] testDispatchGroup];
//    [[GCDAction shareInstance] testDispatchBarrier];
//    [[GCDAction shareInstance] testDispatchOnceToken];
//    [[GCDAction shareInstance] testDispatchOnceToken];

    NSLog(@"%@", [self getMonthList]);

    [self pupSort:@[]];

    [self directInsertSort];

    [self binaryInsertSort];

    NSMutableArray *arr = [[NSMutableArray alloc] initWithObjects:@(6), @(1),@(2),@(5),@(9),@(4),@(3),@(7),@(90),@(60),nil];

    [self quickSortArray:arr withLeftIndex:0 andRightIndex:arr.count - 1];

//    [self addSubViews];
    NSLog(@"%@",arr);

    NSArray *putOutAFire = @[@"冷却灭火",@"隔离灭火",@"窒息灭火",@"化学抑制"];

    NSLog(@"%@",putOutAFire);

    NSObject<ModuleProtocol> *instance = [Instancefactory instanceWithClassName:@"LoginViewController"];

    [instance changePassword];

//    [self.view makeToast:@"what fucking the code"];
//    [self.view makeToast:@"the position is top" duration:10 position:CSToastPositionTop];
    [self.view makeToast:@"the position is center" duration:10 position:CSToastPositionCenter];

    WCSDKUser *user =  [[WCSDKUser alloc] init];
    user.nickname = @"wanghiakl";

    NSLog(@"nickName%@", user.nickname);

    NSDictionary *dic = @{@"url":@"www.baidu.com",@"nickName":@"小百度"};

    WCSDKUser *mode2 = [[WCSDKUser alloc] initWithDict:dic];

    NSLog(@"mode2 %@",mode2.url);

}

- (void)addSubViews {
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
- (NSArray *)pupSort:(NSArray *)list {
    // 冒泡排序时候 逻辑思想是 相邻的两个元素相互比较,较大的放在后面 较大的放在后面

    NSArray *test = @[@12,@23,@43,@2,@3,@5,@8];
    NSMutableArray *mArray = [NSMutableArray arrayWithArray:test];

    for (int i = 0; i < mArray.count - 1; i++) {
        NSInteger a = [mArray[i] integerValue];
        NSInteger b = [mArray[i+1] integerValue];
        if (a>b) {
            // 互换
            mArray[i] = [NSNumber numberWithInteger:b];
            mArray[i+1] = [NSNumber numberWithInteger:a];
        }
    }
    NSLog(@"%@", mArray);

    for (int i = 0; i<mArray.count; i++) {
        for (int j = 0; j<mArray.count-i; j++) {

        }
    }
    return @[];
}

- (NSMutableArray *)getMonthList{

    NSCalendar *calendar0 = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSInteger unitFlags =  NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute;
    comps = [calendar0 components:unitFlags fromDate:[NSDate date]];
    NSInteger currentY=[comps year];
    NSInteger currentM = [comps month];

    NSMutableArray *monthList = [NSMutableArray arrayWithCapacity:24];

    for (int i = 0; i < 24; i++) {
        if (currentM<10) {
            [monthList addObject:[NSString stringWithFormat:@"0%ld/%ld",(long)currentM,currentY]];
        } else {
            [monthList addObject:[NSString stringWithFormat:@"%ld/%ld", (long)currentM, currentY]];
        }
        currentM -= 1; // 获取上一个月份
        if (currentM == 0) {
            currentY -= 1;
            currentM = 12;
        }
    }

    return monthList;
}


- (void)directInsertSort {
    // 直接插入排序
    // 直接插入排序 从后向前找到合适位置后插入
    NSArray *list0 = @[@49, @38, @65, @97, @76, @13, @27, @49, @78, @34, @12, @64, @1];
    NSMutableArray *list = [NSMutableArray arrayWithArray:list0];
    NSLog(@"排序之前");
    for (int i = 0; i < list.count; i ++) {
        NSLog(@"index %d %@ \n",i, list[i]);
    }

    // 直接插入排序
    for (int i = 1; i < list.count; i ++) {
        // 待插入排序
        int temp = [list[i] intValue];
        int j ;
        for (j = i - 1; j >= 0; j --) {
            // 将大于temp的往后移动一位
            if ([list[j]  intValue] > temp) {
                list[j+1] = list[j];
            } else {
                break;
            }
        }
        list[j + 1] = [NSString stringWithFormat:@"%d", temp];
    }

    NSLog(@"排序之后： %@", list);


}
/// 二分插入排序
/// 基本思想：二分法插入排序的思想和直接插入一样，只是找合适的插入位置的方式不同，这里是按二分法找到合适的位置，可以减少比较的次数。
- (void)binaryInsertSort {
    NSArray *list0 = @[@49, @38, @65, @97, @176, @213, @227, @49, @78, @34, @12, @164, @11, @18, @1];

    NSMutableArray *list = [NSMutableArray arrayWithArray:list0];

    NSLog(@"排序之前： %@", list0);
    for (int i = 0; i < list.count; i ++) {
        int temp = [list[i] intValue];
        int left = 0;
        int right = i - 1;
        int mid = 0;
        while (left <= right) {
            mid = (left + right) / 2;
            if (temp < [list[mid] intValue]) {
                right = mid - 1;
            } else {
                left = mid + 1;
            }

        }
        for (int j = i - 1; j >= left; j--)
        {
            list[j + 1] = list[j];
        }
        if (left != i)
        {
            list[left] = [NSString stringWithFormat:@"%d", temp];
        }
    }

    NSLog(@"排序之后：%@", list);
}

/// 快速排序
- (void)quickSortArray:(NSMutableArray *)array withLeftIndex:(NSInteger)leftIndex andRightIndex:(NSInteger)rightIndex {
    if (leftIndex >= rightIndex) {//如果数组长度为0或1时返回
        return ;
    }

    NSInteger i = leftIndex;
    NSInteger j = rightIndex;
    //记录比较基准数
    NSInteger key = [array[i] integerValue];

    while (i < j) {
        /**** 首先从右边j开始查找比基准数小的值 ***/
        while (i < j && [array[j] integerValue] >= key) {//如果比基准数大，继续查找
            j--;
        }
        //如果比基准数小，则将查找到的小值调换到i的位置
        array[i] = array[j];

        /**** 当在右边查找到一个比基准数小的值时，就从i开始往后找比基准数大的值 ***/
        while (i < j && [array[i] integerValue] <= key) {//如果比基准数小，继续查找
            i++;
        }
        //如果比基准数大，则将查找到的大值调换到j的位置
        array[j] = array[i];

    }

    //将基准数放到正确位置
    array[i] = @(key);

    /**** 递归排序 ***/
    //排序基准数左边的
    [self quickSortArray:array withLeftIndex:leftIndex andRightIndex:i - 1];
    //排序基准数右边的
    [self quickSortArray:array withLeftIndex:i + 1 andRightIndex:rightIndex];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
}
@end

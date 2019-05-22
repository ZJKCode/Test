//
//  ViewController.m
//  TEST
//
//  Created by zhangjikuan on 2018/11/15.
//  Copyright © 2018 winchannel. All rights reserved.
//

#import "ViewController.h"
#import "Calculator.h"
#import "Car.h"
#import "BaoMaCar.h"
#import "Gasoline90.h"
#import "Gasoline93.h"
#import "SangTaNaCar.h"
#import <WebKit/WebKit.h>
#import "HittestView.h"
#import "TestViewController.h"
@interface ViewController ()
@property (nonatomic, strong) UILabel *randomLabel;
@property (nonatomic, strong) NSMutableArray *mArray;
@end

@implementation ViewController
__weak NSString *string_weak_ = nil;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self case3];

    Calculator *cal = [[Calculator alloc] init];
    cal.result = 0.0;
    cal.add(3).sub(1).add(9);
    NSLog(@"%f", cal.result);
    cal.mutil(4);
    NSLog(@"%f", cal.result);
    cal.divided(2).add(3).mutil(5);
    NSLog(@"%f", cal.result);

    // 里氏替换原则
    Car *car = [[Car alloc] init];
    [self testCar:car];

    //  父类需要实现就写接口，不需要实现仅仅是扩展就写成协议
    BaoMaCar *car2 = [[BaoMaCar alloc] init];
    [self testCar:car2];
    [car2 refuel:[self gasoline90]];

    SangTaNaCar *car3 = [[SangTaNaCar alloc] init];
    [car3 refuel:[self gasoline93]];

    self.view.backgroundColor = [UIColor blueColor];

    HittestView *view = [[HittestView alloc] initWithFrame:self.view.bounds];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];

    [self randomArray];

    _randomLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 300, [UIScreen mainScreen].bounds.size.width, 200)];
    _randomLabel.backgroundColor = [UIColor brownColor];
    _randomLabel.numberOfLines = 0;
    [self.view addSubview:_randomLabel];
    [_randomLabel addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap2)]];

    _mArray = [NSMutableArray array];

    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 530, 300, 100);
    button.backgroundColor = [UIColor orangeColor];
    [button addTarget:self action:@selector(tap2) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];


    NSLocalizedStringFromTableInBundle(@"",
                                       @"Localizable",
                                       [NSBundle bundleWithPath:
                                        [[NSBundle mainBundle] pathForResource:@"WCReturns"
                                                                        ofType:@"bundle"]],nil);
    [self directInsertSort];
}
- (void)tap2 {
//    [self weChatRedEnvelopeWithTotalMoney:50000 totalPeople:15 minMoney:10];
//    NSMutableString *mtr = [NSMutableString string];
//
//    for (NSNumber *money in _mArray) {
//        NSString *m = [NSString stringWithFormat:@" %@ ", money];
//        [mtr appendString:m];
//    }
//
//    _randomLabel.text = mtr;
    NSString *path = [NSString stringWithFormat:@"winretailsr://sfa/?pagetype=18&urlScheme=mengniu&customer=1606280&offline=0&warehouseId=008&isDriverOrder=1&warehouseName=惠下单经销商j测试测试"];

    path =  [path stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];

    NSURL *url = [NSURL URLWithString:path];


    UIApplication *app = [UIApplication sharedApplication];
    if([app canOpenURL:url]) {  // 2.打开应用程序
        [app openURL:url];
    }
}

- (void)weChatRedEnvelopeWithTotalMoney:(CGFloat)totalMoney totalPeople:(NSInteger)totalPeople minMoney:(CGFloat)minMoney{

//    totalMoney = 50000; // 红包总金额
//    totalPeople = 15; // 抢红包总人数
//    minMoney = 10; // 每个人最少能收到0.01元
    [_mArray removeAllObjects];

    for (int i = 1; i < totalPeople; i++) {

        // 剩下几个人
        NSInteger remainPeopleNum = totalPeople - (i - 1);

        // 红包额度峰值
        CGFloat topMoney = totalMoney - minMoney * remainPeopleNum;

        // 获取随机金额
        CGFloat rNum = (arc4random_uniform(100) + 1) / 100.0;
        NSLog(@"随机数:%.2f",rNum);
        CGFloat individualMoney = rNum * topMoney + minMoney;

        totalMoney = totalMoney - individualMoney;

        NSLog(@"第 %zd 个红包： %.2f 元，剩下：%.2f 元\n", i, individualMoney,
              totalMoney);
        [_mArray addObject:[NSNumber numberWithFloat:individualMoney]];
    }
    NSLog(@"第 %zd 个红包： %.2f 元，剩下：0 元\n", totalPeople,totalMoney);

}
- (void)randomArray {

    NSArray *array = @[@"一",@"二",@"三",@"四",@"五"];
    NSMutableArray *nutableArray = [[NSMutableArray alloc]initWithArray:array];
    int i = (int)[nutableArray count];
    while(--i > 0) {
        int j = rand() % (i+1);
        [nutableArray exchangeObjectAtIndex:i withObjectAtIndex:j];
    }
    NSLog(@"nutableArray :%@",nutableArray);
}

- (id<Gasoline>)gasoline90 {
    Gasoline90 *gasoline = [[Gasoline90 alloc] init];
    gasoline.name = @"90909090";
    return gasoline;
}

- (id<Gasoline>)gasoline93 {
    Gasoline93 *gasoline = [[Gasoline93 alloc] init];
    return gasoline;
}
- (void)testCar:(Car *)car{

    [car run];
}

- (void)case1 {
    // 场景1
    NSString *string = [NSString stringWithFormat:@"yi_tiao_da_he_bo_lang_kuan"];
    string_weak_ = string;
    NSLog(@"string: %@",string_weak_);
}

- (void)case2 {
    // 场景2
    @autoreleasepool {
        // retaincount +1
        NSString *string = [NSString stringWithFormat:@"yi_tiao_da_he_bo_lang_kuan"];
        string_weak_ = string;

        // retaincount = 2 引用计数为2

    }
    // 出了
    NSLog(@"string: %@",string_weak_);
}

- (void)case3 {
    // 场景3
    NSString *string = nil;
    @autoreleasepool {
        string = [NSString stringWithFormat:@"yi_tiao_da_he_bo_lang_kuan"];
        string_weak_ = string;
    }

    NSLog(@"string: %@",string_weak_);
}

- (void) directInsertSort {
    // 直接插入排序
    NSArray *list = @[@49, @38, @65, @97, @76, @13, @27, @49, @78, @34, @12, @64, @1];
    NSLog(@"排序之前");
    for (int i = 0; i < list.count; i ++) {
        NSLog(@"%@ \n",list[i]);
    }


}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"string: %@",string_weak_);
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"string: %@", string_weak_);
}


@end

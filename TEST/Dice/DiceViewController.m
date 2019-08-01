//
//  DiceViewController.m
//  TEST
//
//  Created by zhangjikuan on 2019/7/11.
//  Copyright © 2019 winchannel. All rights reserved.
//

#import "DiceViewController.h"
#import "DiceModel.h"
#import "DiceM.h"
#import "DiceSingle.h"
#import "DiceTableViewCell.h"
#import "Multiple.h"
#import "IndexTool.h"


#define   kScreenHEIGHT      [UIScreen mainScreen].bounds.size.height
#define kScreenWidth  UIScreen.mainScreen.bounds.size.width
#define buttonWidth UIScreen.mainScreen.bounds.size.width/4
/// 最大倍投数目

/// 交替
static NSInteger alternateCount = 1;
/// 顺龙
static NSInteger shunlongCount = 1;
/// 斩龙
static NSInteger zhanlongCount = 1;

/// 交替 最大倍数
static NSInteger alternateMaxCount = 1;
/// 顺龙 最大倍数
static NSInteger shunlongMaxCount = 1;
/// 斩龙 最大倍数
static NSInteger zhanlongMaxCount = 1;

static NSInteger count = 1;

@interface DiceViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *list;
@property (nonatomic, strong) UITextField *textField1;
@property (nonatomic, strong) UITextField *textField2;

/**
 最新的插入的数据
 */
@property (nonatomic, strong) DiceModel *lastDice;

/**
    交替执行最新的值
 */
@property (nonatomic, copy) NSString *alternateLast;

/**
 顺龙执行最新的值
 */
@property (nonatomic, copy) NSString *shunlongLast;

/**
 斩龙执行最新的值
 */
@property (nonatomic, copy) NSString *zhanlongLast;


@property (nonatomic, strong) UILabel *infoLabel;

// 统计次数，在几倍的情况下出现的次数
@property (nonatomic, strong) NSMutableArray *alternateMarray;
@property (nonatomic, strong) NSMutableArray *shunlongMarray;
@property (nonatomic, strong) NSMutableArray *zhanlongMarray;

@property (nonatomic, strong) NSMutableArray *sections;

@property (nonatomic, strong) UITableView *mutaTableView;

@property (nonatomic, strong) NSTimer *timer;


@end

@implementation DiceViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _alternateMarray = [NSMutableArray array];
        _shunlongMarray = [NSMutableArray array];
        _zhanlongMarray = [NSMutableArray array];
        _sections = [NSMutableArray array];

        [_sections addObject:_alternateMarray];
        [_sections addObject:_shunlongMarray];
        [_sections addObject:_zhanlongMarray];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"骰子游戏模拟";

    [self addSubViews];

    [self setData];

}

- (UIButton *)randomButtonWithTitle:(NSString *)title action:(SEL)selector {
    UIButton *randomDiceButton = [UIButton buttonWithType:UIButtonTypeCustom];
    randomDiceButton.backgroundColor = [UIColor greenColor];
    [randomDiceButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [randomDiceButton setTitle:title forState:UIControlStateNormal];
    [randomDiceButton addTarget:self
                         action:selector
               forControlEvents:UIControlEventTouchUpInside];
    randomDiceButton.layer.cornerRadius = 10;
    randomDiceButton.layer.masksToBounds = YES;
    return randomDiceButton;

}

- (void)addSubViews {

    UIButton *randomDiceButton = [self randomButtonWithTitle:@"随机投掷" action:@selector(insertRandomDice)];
    randomDiceButton.frame = CGRectMake(10, 63, buttonWidth * 2-20, 60);
    [self.view addSubview:randomDiceButton];

    UIButton *bigDiceButton = [self randomButtonWithTitle:@"大" action:@selector(insertBigDice)];
    bigDiceButton.frame = CGRectMake(buttonWidth * 2, 63, buttonWidth-10, 60);
    [self.view addSubview:bigDiceButton];

    UIButton *smallDiceButton = [self randomButtonWithTitle:@"小" action:@selector(insertSmallDice)];
    smallDiceButton.frame = CGRectMake(buttonWidth * 3, 63, buttonWidth-10, 60);
    [self.view addSubview:smallDiceButton];

    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(10,120+7.5, 30, 45)];
    label1.text = @"大";
    label1.textAlignment = NSTextAlignmentCenter;
    label1.layer.cornerRadius = 10;
    label1.layer.masksToBounds = YES;
    label1.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:label1];

    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(buttonWidth * 2,120+7.5, 30, 45)];
    label2.text = @"小";
    label2.layer.cornerRadius = 10;
    label2.layer.masksToBounds = YES;
    label2.textAlignment = NSTextAlignmentCenter;
    label2.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:label2];

    [self.view addSubview:self.textField1];
    [self.view addSubview:self.textField2];
    [self.view addSubview:self.infoLabel];
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.mutaTableView];

}

- (void)setData {

    for (int i = 0; i < 50; i ++) {
        DiceModel *model = [[DiceM shareInstance] getRandomDice];
        [self.list addObject:model];
    }

    [self.list sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return NSOrderedDescending;
    }];

    [self.tableView reloadData];
    [self runRandomJobs];

}

- (void)runRandomJobs {

    _timer = [NSTimer scheduledTimerWithTimeInterval:0.3
                                                     repeats:YES
                                                       block:^(NSTimer * _Nonnull timer) {
                                                           [self insertRandomDice];
                                                       }];

    [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];

}
- (void)insertBigDice {

    DiceModel *model = [[DiceM shareInstance] getSumBigDice];
    [self insertDice:model];

}

- (void)insertSmallDice {

    DiceModel *model = [[DiceM shareInstance] getSumSmallDice];
    [self insertDice:model];

}

- (void)insertRandomDice {

    NSInteger maxCount1 = [_textField1.text integerValue];
    NSInteger minCount2 = [_textField2.text integerValue];

    if (maxCount1>minCount2) {
        // 插入和为小的结果
        NSLog(@"平台赚 %ld", maxCount1 - minCount2);
        [self insertSmallDice];
    } else if (maxCount1 < minCount2) {
        // 插入和为大的结果
        NSLog(@"平台赚 %ld", minCount2 - maxCount1);
        [self insertBigDice];
    } else {
        // 随机 概率性太小太小
        NSLog(@"平台不赚");
        DiceModel *model = [[DiceM shareInstance] getRandomDice];
        [self insertDice:model];
    }
}
// 交替策略， 不管结果是大是小， 只会执行交替任务，
- (void)alternateStrategy {


    // 判断是否相等
    if ([self.alternateLast isEqualToString:_lastDice.size]) {
        // 相等则 初始化
        alternateCount = 1;
    } else {
        if (alternateCount == 3) {
            alternateCount = 8;
        } else {
            alternateCount = alternateCount * 3;
        }
    }
    NSInteger index = [IndexTool indexOfArrayForCount:alternateCount];
    NSInteger arrayCount = [_alternateMarray count];
    if (index >= arrayCount) {
        // 创建
        Multiple *mut = [[Multiple alloc] init];
        mut.multiple = alternateCount;
        mut.times = mut.times + 1;
        [_alternateMarray addObject:mut];
    } else {
        //
        Multiple *mutiple = [_alternateMarray objectAtIndex:index];
        mutiple.times = mutiple.times + 1;
    }

    _sections[0] = _alternateMarray;



    // 目前的倍数是
    NSLog(@"交替执行的倍数为：%ld", alternateCount);
    if (alternateCount > alternateMaxCount) {
        alternateMaxCount = alternateCount;
    }

    // aler 字符串重新交替
    if ([self.alternateLast isEqualToString:@"大"]) {
        self.alternateLast = @"小";
    } else {
        self.alternateLast = @"大";
    }

}


/// 顺龙策略
- (void)shunlongStrategy {


    if ([_lastDice.size isEqualToString:self.shunlongLast] ) {
        // 相等则处理为
        shunlongCount = 1;
    } else {
        /// 倍投
        if (shunlongCount == 3) {
            shunlongCount = 8;
        } else {
            shunlongCount = shunlongCount * 3;
        }
        self.shunlongLast = _lastDice.size;
    }
    NSInteger index = [IndexTool indexOfArrayForCount:shunlongCount];
    NSInteger arrayCount = [_shunlongMarray count];
    if (index >= arrayCount) {
        // 创建
        Multiple *mut = [[Multiple alloc] init];
        mut.multiple = shunlongCount;
        mut.times = mut.times + 1;
        [_shunlongMarray addObject:mut];
    } else {
        //
        Multiple *mutiple = [_shunlongMarray objectAtIndex:index];
        mutiple.times = mutiple.times + 1;
    }

    _sections[1] = _shunlongMarray;


    NSLog(@"顺龙交替执行的次数为： %ld", shunlongCount);
    if (shunlongCount > shunlongMaxCount) {
        shunlongMaxCount = shunlongCount;
    }
}

/// 斩龙策略
- (void)zhanlongStrategy {
    if ([_lastDice.size isEqualToString:self.zhanlongLast]) {
        zhanlongCount = 1;
    } else {
        /// 倍投
        if (zhanlongCount == 3) {
            zhanlongCount = 8;
        } else {
            zhanlongCount = zhanlongCount * 3;
        }
    }

    if ([_lastDice.size isEqualToString:@"大"]) {
        self.zhanlongLast = @"小";
    } else {
        self.zhanlongLast = @"大";
    }
    NSInteger index = [IndexTool indexOfArrayForCount:zhanlongCount];
    NSInteger arrayCount = [_zhanlongMarray count];
    if (index >= arrayCount) {
        // 创建
        Multiple *mut = [[Multiple alloc] init];
        mut.multiple = zhanlongCount;
        mut.times = mut.times + 1;
        [_zhanlongMarray addObject:mut];
    } else {
        //
        Multiple *mutiple = [_zhanlongMarray objectAtIndex:index];
        mutiple.times = mutiple.times + 1;
    }

    _sections[2] = _zhanlongMarray;

    NSLog(@"斩龙执行的次数： %ld", zhanlongCount);
    if (zhanlongCount > zhanlongMaxCount) {
        zhanlongMaxCount = zhanlongCount;
        
    }
}

- (void)insertDice:(DiceModel *)dice {

    [self.list insertObject:dice atIndex:0];
    NSMutableArray *indexPaths = [NSMutableArray array];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [indexPaths addObject:indexPath];

    // tablview 回到顶部
    [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]
                          atScrollPosition:UITableViewScrollPositionTop animated:YES];

    // 更新最新的数据
    [self.tableView beginUpdates];
    [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationMiddle];
    [self.tableView endUpdates];

    // 将值付给最新的值
    _lastDice = dice;

    /// 分别测试三种策略方法
    [self alternateStrategy];
    [self shunlongStrategy];
    [self zhanlongStrategy];
    count = count + 1;

    [UIView transitionWithView:_infoLabel
                      duration:0.25f
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    animations:^{
                        self.infoLabel.text =[NSString stringWithFormat:@"%d : 交-%ld(%ld) 顺-%ld(%ld) 斩-%ld(%ld)",count, alternateCount, alternateMaxCount, shunlongCount, shunlongMaxCount, zhanlongCount, zhanlongMaxCount];
                    } completion:nil];

    [self.mutaTableView reloadData];

}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (tableView == self.mutaTableView) {
        return self.sections.count;
    }

    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView == self.mutaTableView) {
        return [self.sections[section] count];
    }
    return self.list.count;
}
- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (tableView == self.mutaTableView) {
        switch (section) {
            case 0:
                return @"交替策略";
                break;
            case 1:
                return @"顺龙策略";
                break;
            case 2:
                return @"斩龙策略";
                break;
            default:
                break;
        }
    }
    return @"随机大小";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == self.mutaTableView) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"rowCell"];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"rowCell"];
        }
        NSArray *array = self.sections[indexPath.section];

        Multiple *muti = array[indexPath.row];

        [UIView transitionWithView:cell.textLabel
                          duration:0.25f
                           options:UIViewAnimationOptionTransitionCrossDissolve
                        animations:^{
                            cell.textLabel.text = [NSString stringWithFormat:@"倍数：%ld ------------- 出现次数: %ld",muti.multiple, muti.times];

                        } completion:nil];
        return cell;
    }
    DiceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"diceCell"];
    if (cell == nil) {
        cell = [[DiceTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"diceCell"];
    }
    DiceModel *dice = [self.list objectAtIndex:indexPath.row];
    cell.dice = dice;

    if (dice.countSum.intValue > 10) {
        cell.textLabel.textColor = UIColor.redColor;
    } else {
        cell.textLabel.textColor = UIColor.blueColor;
    }

    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {

}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, kScreenHEIGHT - 160, [UIScreen mainScreen].bounds.size.width, 150) style:UITableViewStylePlain];

        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.showsVerticalScrollIndicator = YES;
    }
    return _tableView;
}

- (UITableView *)mutaTableView {
    if (!_mutaTableView) {
        _mutaTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 220, [UIScreen mainScreen].bounds.size.width, UIScreen.mainScreen.bounds.size.height - 390) style:UITableViewStylePlain];

        _mutaTableView.delegate = self;
        _mutaTableView.dataSource = self;
        _mutaTableView.showsVerticalScrollIndicator = YES;
    }
    return _mutaTableView;
}

- (UITextField *)textField1 {
    if (!_textField1) {
        _textField1 = [[UITextField alloc] initWithFrame:CGRectMake(45, 120+7.5, buttonWidth * 2-55, 45)];
        _textField1.placeholder = @"请输入投注金额";
        _textField1.borderStyle = UITextBorderStyleRoundedRect;
        _textField1.backgroundColor = [UIColor whiteColor];
    }
    return _textField1;
}

- (UITextField *)textField2 {
    if (!_textField2) {

        _textField2 = [[UITextField alloc] initWithFrame:CGRectMake(buttonWidth *2+35, 120+7.5, buttonWidth * 2-50, 45)];
        _textField2.placeholder = @"请输入投注金额";
        _textField2.backgroundColor = [UIColor whiteColor];
        _textField2.borderStyle = UITextBorderStyleRoundedRect;
    }

    return _textField2;
}
- (NSMutableArray *)list {
    if (_list == nil) {
        _list = [NSMutableArray array];
    }
    return _list;
}

- (NSString *)alternateLast {
    return @"大";
}

-(NSString *)shunlongLast {
    return @"大";
}

- (NSString *)zhanlongLast {
    return @"小";
}
- (UILabel *)infoLabel {
    if (_infoLabel == nil) {
        _infoLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,CGRectGetMaxY(self.textField2.frame) + 5,kScreenWidth, 40-5)];
        _infoLabel.backgroundColor = [UIColor whiteColor];
        _infoLabel.textColor = [UIColor redColor];
        _infoLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _infoLabel;
}


- (void)dealloc {
    [_timer invalidate];
    _timer = nil;
}
@end

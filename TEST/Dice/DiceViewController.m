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


@end

@implementation DiceViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _alternateMarray = [NSMutableArray array];
    _shunlongMarray = [NSMutableArray array];
    _zhanlongMarray = [NSMutableArray array];
    _sections = [NSMutableArray array];

    [_sections addObject:_alternateMarray];
    [_sections addObject:_shunlongMarray];
    [_sections addObject:_zhanlongMarray];

    CGFloat buttonWidth = UIScreen.mainScreen.bounds.size.width/8;
    self.title = @"哈哈哈测试动画";
    UIButton *randomDiceButton = [UIButton buttonWithType:UIButtonTypeCustom];
    randomDiceButton.backgroundColor = [UIColor greenColor];
    [randomDiceButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [randomDiceButton setTitle:@"随机投掷" forState:UIControlStateNormal];
    [randomDiceButton addTarget:self action:@selector(insertRandomDice) forControlEvents:UIControlEventTouchUpInside];
    randomDiceButton.frame = CGRectMake(0, 60, buttonWidth * 2, 60);
    [self.view addSubview:randomDiceButton];

    UIButton *bigDiceButton = [UIButton buttonWithType:UIButtonTypeCustom];
    bigDiceButton.backgroundColor = [UIColor blueColor];
    [bigDiceButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [bigDiceButton setTitle:@"大" forState:UIControlStateNormal];
    [bigDiceButton addTarget:self action:@selector(insertBigDice) forControlEvents:UIControlEventTouchUpInside];
    bigDiceButton.frame = CGRectMake(buttonWidth * 2, 60, buttonWidth, 60);
    [self.view addSubview:bigDiceButton];


    UIButton *smallDiceButton = [UIButton buttonWithType:UIButtonTypeCustom];
    smallDiceButton.backgroundColor = [UIColor yellowColor];
    [smallDiceButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [smallDiceButton setTitle:@"小" forState:UIControlStateNormal];
    [smallDiceButton addTarget:self action:@selector(insertSmallDice) forControlEvents:UIControlEventTouchUpInside];
    smallDiceButton.frame = CGRectMake(buttonWidth * 3, 60, buttonWidth, 60);
    [self.view addSubview:smallDiceButton];

    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(10,120+7.5, 20, 45)];
    label1.text = @"大";
    label1.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:label1];
    _textField1 = [[UITextField alloc] initWithFrame:CGRectMake(35, 120+7.5, buttonWidth * 4-30-35, 45)];
    _textField1.placeholder = @"预测 和 为 大金额";
    _textField1.borderStyle = UITextBorderStyleRoundedRect;
    _textField1.backgroundColor = [UIColor whiteColor];
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(buttonWidth * 4 + 10,120+7.5, 20, 45)];
    label2.text = @"小";
    label2.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:label2];

    _textField2 = [[UITextField alloc] initWithFrame:CGRectMake(buttonWidth *4+15+15, 120+7.5, buttonWidth * 4-30-35, 45)];
    _textField2.placeholder = @"预测 和 为 小 金额";
    _textField2.backgroundColor = [UIColor whiteColor];
    _textField2.borderStyle = UITextBorderStyleRoundedRect;



    // 如何拿到数据呢？

    [self.view addSubview:_textField1];
    [self.view addSubview:_textField2];

    _infoLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,CGRectGetMaxY(_textField2.frame) + 5, UIScreen.mainScreen.bounds.size.width, 40-5)];
    _infoLabel.backgroundColor = [UIColor whiteColor];
    _infoLabel.textColor = [UIColor redColor];
    _infoLabel.textAlignment = NSTextAlignmentCenter;

    [self.view addSubview:_infoLabel];

    [self.view addSubview:self.tableView];
    [self.view addSubview:self.mutaTableView];
    for (int i = 0; i < 50; i ++) {
        DiceModel *model = [[DiceM shareInstance] getRandomDice];
        [self.list addObject:model];
    }
    [self.list sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return NSOrderedDescending;
    }];


    [self.tableView reloadData];

    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.3 repeats:YES block:^(NSTimer * _Nonnull timer) {
        [self insertRandomDice];
    }];
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

//        cell.textLabel.text = [NSString stringWithFormat:@"倍数：%ld   |||   次数: %ld",muti.multiple, muti.times];
        [UIView transitionWithView:cell.textLabel
                          duration:0.25f
                           options:UIViewAnimationOptionTransitionCrossDissolve
                        animations:^{
                            cell.textLabel.text = [NSString stringWithFormat:@"倍数：%ld   |||   次数: %ld",muti.multiple, muti.times];

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

@end

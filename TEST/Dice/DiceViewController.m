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

@interface DiceViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *list;

@end

@implementation DiceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGFloat buttonWidth = UIScreen.mainScreen.bounds.size.width/8;

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


    [self.view addSubview:self.tableView];
    for (int i = 0; i < 50; i ++) {
        DiceModel *model = [[DiceM shareInstance] getRandomDice];
        [self.list addObject:model];
    }
    [self.list sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return NSOrderedDescending;
    }];


    [self.tableView reloadData];
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

    DiceModel *model = [[DiceM shareInstance] getRandomDice];
    [self insertDice:model];

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

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.list.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
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
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 120, [UIScreen mainScreen].bounds.size.width, UIScreen.mainScreen.bounds.size.height - 120) style:UITableViewStylePlain];

        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.showsVerticalScrollIndicator = YES;
    }
    return _tableView;
}

- (NSMutableArray *)list {
    if (_list == nil) {
        _list = [NSMutableArray array];
    }
    return _list;
}
@end

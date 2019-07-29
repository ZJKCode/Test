//
//  PartTimeViewController.m
//  TEST
//
//  Created by zhangjikuan on 2019/7/22.
//  Copyright © 2019 winchannel. All rights reserved.
//

#import "PartTimeViewController.h"

@interface PartTimeViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *list;
@end

@implementation PartTimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view addSubview:self.tableView];

    [self.list addObject:@"码易众包"];

    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.list.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"diceCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"diceCell"];
    }

    cell.textLabel.text = @"Hello";
    return cell;
}



- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 180, [UIScreen mainScreen].bounds.size.width, UIScreen.mainScreen.bounds.size.height - 120) style:UITableViewStylePlain];

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

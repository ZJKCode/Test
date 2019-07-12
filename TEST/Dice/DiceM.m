//
//  DiceM.m
//  TEST
//
//  Created by zhangjikuan on 2019/7/11.
//  Copyright © 2019 winchannel. All rights reserved.
//

#import "DiceM.h"
#import "DiceModel.h"
#import "DiceSingle.h"
#import "DiceTerm.h"

static DiceM *dice = nil;


@implementation DiceM

+ (instancetype)shareInstance {

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dice = [[DiceM alloc] init];
    });

    return dice;
}

- (NSArray *)dices {

    return @[
            @[@1,@2,@3,@4,@5,@6],
            @[@1,@2,@3,@4,@5,@6],
            @[@1,@2,@3,@4,@5,@6]
            ];
}

- (void)runRandom {

    int m = 0;
    for (int i = 0; i < 3; i++) {
        int x = arc4random() % 6 + 1;
        NSLog(@"骰子大小点数：%d", x);
        m = m + x;
    }

    NSLog(@"三个点数之和为：%d", m);
    if (m > 10) {
        NSLog(@"大");
    } else {
        NSLog(@"小");
    }

}
- (DiceModel *)getDice {
    DiceModel *dice = [[DiceModel alloc] init];
    NSMutableArray *diceArray = [NSMutableArray array];

    int m = 0;
    for (int i = 0; i < 3; i++) {
        int x = arc4random() % 6 + 1;
        m = m + x;
        DiceSingle *diceS = [[DiceSingle alloc] init];
        diceS.count = x;
        [diceArray addObject:diceS];
    }
    dice.dices = diceArray;
    dice.countSum = [NSString stringWithFormat:@"%d", m];

    if (m > 10) {
        dice.size = @"大";
        dice.sumSize = DiceSumBig;
    } else {
        dice.size = @"小";
        dice.sumSize = DiceSumSmall;
    }


    return dice;
}
- (DiceModel *)getRandomDice {
    DiceModel *model = [self getDice];
    model.diceTerm = [[DiceTerm shareInstance] currentTerm];
    return model;

}

- (DiceModel *)getSumBigDice {

    return [self getSumSize:DiceSumBig];
}

- (DiceModel *)getSumSmallDice {

    return [self getSumSize:DiceSumSmall];
}

- (DiceModel *)getSumSize:(DiceSumSize)sumSize
{
    DiceModel *model = [self getDice];

    if (model.sumSize == sumSize) {
        model.diceTerm = [[DiceTerm shareInstance] currentTerm];
        return model;
    } else {
        return [self getSumSize:sumSize];
    }
}
@end

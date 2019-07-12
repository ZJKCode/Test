//
//  DiceTableViewCell.m
//  TEST
//
//  Created by zhangjikuan on 2019/7/12.
//  Copyright © 2019 winchannel. All rights reserved.
//

#define KLabelWidth         UIScreen.mainScreen.bounds.size.width/6

#import "DiceTableViewCell.h"

@interface DiceTableViewCell ()
/// 期数
@property (nonatomic, strong) UILabel *termLabel;
/// 三点
@property (nonatomic, strong) UILabel *threeDiceLabel;
/// 三点和
@property (nonatomic, strong) UILabel *diceSumLabel;
/// 三点和的大小
@property (nonatomic, strong) UILabel *diceSizeLabel;


@end

@implementation DiceTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.termLabel];
        [self.contentView addSubview:self.threeDiceLabel];
        [self.contentView addSubview:self.diceSumLabel];
        [self.contentView addSubview:self.diceSizeLabel];
    }
    return self;
}

- (void)setDice:(DiceModel *)dice {
    self.termLabel.text = dice.diceTerm;
    DiceSingle *s0 = dice.dices[0];
    DiceSingle *s1 = dice.dices[1];
    DiceSingle *s2 = dice.dices[2];
    self.threeDiceLabel.text = [NSString stringWithFormat:@"%ld, %ld, %ld", s0.count, s1.count, s2.count];
    self.diceSumLabel.text = dice.countSum;
    self.diceSizeLabel.text = dice.size;
    if (dice.sumSize == DiceSumBig) {
        self.diceSizeLabel.textColor = [UIColor blueColor];
        self.diceSumLabel.textColor = [UIColor blueColor];
    } else {
        self.diceSizeLabel.textColor = [UIColor redColor];
        self.diceSumLabel.textColor = [UIColor redColor];
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}
- (UILabel *)termLabel {
    if (_termLabel == nil) {
        _termLabel = [self createLabel:CGRectMake(0, 0, KLabelWidth * 2, 45)];

    }
    return _termLabel;
}
- (UILabel *)threeDiceLabel {
    if (_threeDiceLabel == nil) {
        _threeDiceLabel = [self createLabel:CGRectMake(KLabelWidth * 2, 0, KLabelWidth, 45)];
    }
    return _threeDiceLabel;
}

- (UILabel *)diceSumLabel {
    if (_diceSumLabel == nil) {
        _diceSumLabel = [self createLabel:CGRectMake(KLabelWidth * 3, 0, KLabelWidth, 45)];


    }

    return _diceSumLabel;
}

- (UILabel *)diceSizeLabel {
    if (_diceSizeLabel == nil) {
        _diceSizeLabel = [self createLabel:CGRectMake(KLabelWidth * 4, 0, KLabelWidth, 45)];
    }

    return _diceSizeLabel;
}

- (UILabel *)createLabel:(CGRect) rect {
    UILabel *label = [[UILabel alloc] initWithFrame:rect];
    label.font = [UIFont systemFontOfSize:14];
    label.textAlignment = NSTextAlignmentCenter;

    return label;
}
@end

//
//  StockObserver.m
//  Design Pattern
//
//  Created by zhangjikuan on 16/9/22.
//  Copyright © 2016年 zhang_jk. All rights reserved.
//

#import "StockObserver.h"
#import "Subject.h"


@implementation StockObserver

- (void)closeStockMarket
{
    NSLog(@"%@ %@ 关闭股票行情，继续工作！",self.sub.action,self.name);
}

@end

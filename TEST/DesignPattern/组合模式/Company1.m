//
//  Company1.m
//  Design Pattern
//
//  Created by zhangjikuan on 2016/10/9.
//  Copyright © 2016年 zhang_jk. All rights reserved.
//

#import "Company1.h"

@interface Company1 ()


@end

@implementation Company1

- (instancetype)initWithCompany:(NSString *)company
{
    self = [super init];
    if (self) {
        _name = company;
    }
    return self;
}

// 增加
- (void)add:(Company1 *)c
{
}
// 移除
- (void)remove:(Company1 *)c
{
}
// 显示
- (void)display:(int)depth
{
}
// 履行职责
- (void)lineOfDuty
{

}

@end

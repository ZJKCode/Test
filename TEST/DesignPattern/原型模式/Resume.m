//
//  Resume.m
//  Design Pattern
//
//  Created by zhangjikuan on 16/9/2.
//  Copyright © 2016年 zhang_jk. All rights reserved.
//

#import "Resume.h"

@implementation Resume
- (instancetype)initWithName:(NSString *)name
{
    self = [super init];
    if (self) {
        _name = name;
    }
    return self;
}

- (void)setPersonInfoSex:(NSString *)sex age:(NSString *)age
{
    _sex = sex;
    _age = age;

}

- (void)setWorkExprienceTimeArea:(NSString *)timeArea company:(NSString *)company
{
    _timeArea = timeArea;
    _company = company;

}

- (void)dispaly
{
    NSLog(@"%@, %@, %@",_name,_sex,_age);
    NSLog(@"工作经历：%@ %@",_timeArea,_company);

}

- (id)copyWithZone:(nullable NSZone *)zone
{
    return self ;
    
}



@end

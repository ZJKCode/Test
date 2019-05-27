//
//  VolunteerFactory.m
//  Design Pattern
//
//  Created by zhangjikuan on 16/9/2.
//  Copyright © 2016年 zhang_jk. All rights reserved.
//

#import "VolunteerFactory.h"
#import "Volunteer.h"
@implementation VolunteerFactory

+(LeiFeng *)createLeiFeng
{
    return [[Volunteer alloc] init];
}

@end

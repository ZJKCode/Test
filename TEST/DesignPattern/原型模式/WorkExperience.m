//
//  WorkExperience.m
//  Design Pattern
//
//  Created by zhangjikuan on 16/9/2.
//  Copyright © 2016年 zhang_jk. All rights reserved.
//

#import "WorkExperience.h"

@implementation WorkExperience
- (id)copyWithZone:(NSZone *)zone
{
    WorkExperience *workExperience= [[self class] allocWithZone:zone];
    workExperience.workDate = [self.workDate copy];
    workExperience.company = [self.company copy];
    return workExperience;
}
@end

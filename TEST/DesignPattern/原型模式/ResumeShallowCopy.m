//
//  ResumeShallowCopy.m
//  Design Pattern
//
//  Created by zhangjikuan on 16/9/2.
//  Copyright © 2016年 zhang_jk. All rights reserved.
//

#import "ResumeShallowCopy.h"

@implementation ResumeShallowCopy
- (id) copyWithZone:(NSZone *)zone
{
    Resume *resume = [[[self class] allocWithZone:zone] init];
    resume.name= self.name;
    resume.sex = self.sex;
    resume.age = self.age;
    return resume;
    
}
@end

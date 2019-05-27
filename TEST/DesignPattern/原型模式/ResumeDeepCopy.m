//
//  ResumeDeepCopy.m
//  Design Pattern
//
//  Created by zhangjikuan on 16/9/2.
//  Copyright © 2016年 zhang_jk. All rights reserved.
//

#import "ResumeDeepCopy.h"

@implementation ResumeDeepCopy
- (id)copyWithZone:(NSZone *)zone
{
    Resume *resume = [[[self class] allocWithZone:zone] init];
    resume.name = [self.name copy];
    resume.sex = [self.sex copy];
    resume.age = [self.age copy];
    
    return resume;
}
@end

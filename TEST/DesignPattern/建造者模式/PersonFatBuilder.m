//
//  PersonFatBuilder.m
//  Design Pattern
//
//  Created by zhangjikuan on 16/9/19.
//  Copyright © 2016年 zhang_jk. All rights reserved.
//

#import "PersonFatBuilder.h"

@implementation PersonFatBuilder
- (void)buildHead{
    
    NSLog(@"创建胖子头部");
}
- (void)buildBody{
    NSLog(@"创建胖子身体");
    
}
- (void)buildArmLeft{
    NSLog(@"创建胖子左胳膊");
    
    
}
- (void)buildArmRight{
    NSLog(@"创建胖子右胳膊");
    
    
}
- (void)buildLegLeft{
    NSLog(@"创建胖子左腿");
    
    
}
- (void)buildLegRight{
    NSLog(@"创建胖子右腿");
}

@end

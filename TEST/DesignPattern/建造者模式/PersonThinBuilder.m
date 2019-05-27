//
//  PersonThinBuilder.m
//  Design Pattern
//
//  Created by zhangjikuan on 16/9/19.
//  Copyright © 2016年 zhang_jk. All rights reserved.
//

#import "PersonThinBuilder.h"

@implementation PersonThinBuilder

/**
 实现协议
 */
- (void)buildHead{

    NSLog(@"创建瘦子头部");
}
- (void)buildBody{
    NSLog(@"创建瘦子身体");

}
- (void)buildArmLeft{
    NSLog(@"创建瘦子左胳膊");


}
- (void)buildArmRight{
    NSLog(@"创建瘦子右胳膊");


}
- (void)buildLegLeft{
    NSLog(@"创建瘦子左腿");


}
- (void)buildLegRight{
    NSLog(@"创建瘦子右腿");
}

@end

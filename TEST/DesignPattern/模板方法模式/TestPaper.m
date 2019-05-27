//
//  TestPaper.m
//  Design Pattern
//
//  Created by zhangjikuan on 16/9/5.
//  Copyright © 2016年 zhang_jk. All rights reserved.
//

#import "TestPaper.h"

@implementation TestPaper
- (void)testQuestion1
{
    NSLog(@"杨过得到，后来给了郭靖，练成倚天剑、屠龙刀的玄铁可能是[] a.球磨铸铁 b.马口铁 c.高速合金钢 d.碳素纤维");
    NSLog(@"答案：%@",[self answer1]);
}

- (void)testQuestion2{
    NSLog(@" 杨过、程英、陆无双铲除了情花，造成[] a.使这种植物不再伤害人 b.使一种珍惜物种灭绝 c.破坏了那个生物圈的生态平衡 d.造成地区沙漠化");
    NSLog(@"答案：%@",[self answer2]);


}

- (void)testQuestion3{
    NSLog(@" 蓝凤凰致使华山师徒、桃谷六仙呕吐不止，如果你是大夫，会给他们开什么药[] a.阿匹斯林 b.牛黄解毒片 c.氟哌酸 d.让他们喝大量的生牛奶 e.以上全不对");
    NSLog(@"答案：%@",[self answer3]);

    

}

- (NSString *)answer1{

    return @"";
}

- (NSString *)answer2{
    
    return @"";
}

- (NSString *)answer3{
    
    return @"";
}

@end

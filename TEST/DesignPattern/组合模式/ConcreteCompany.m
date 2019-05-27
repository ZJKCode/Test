//
//  ConcreteCompany.m
//  Design Pattern
//
//  Created by zhangjikuan on 2016/10/9.
//  Copyright © 2016年 zhang_jk. All rights reserved.
//

#import "ConcreteCompany.h"

@interface ConcreteCompany ()
@property (nonatomic, strong) NSMutableArray *children;

@end

@implementation ConcreteCompany
-(void)add:(Company1 *)c
{
    [self.children addObject:c];
}

- (void)remove:(Company1 *)c
{
    [self.children removeObject:c];

}

- (void)display:(int)depth
{
    for (Company1 *c in self.children) {
        NSLog(@"%@",c);
    }

}

- (void)lineOfDuty
{

}

@end

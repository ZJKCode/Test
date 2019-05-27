//
//  OperationDiv.m
//  Design Pattern
//
//  Created by zhangjikuan on 16/8/31.
//  Copyright © 2016年 zhang_jk. All rights reserved.
//

#import "OperationDiv.h"

@implementation OperationDiv
-(double)getResult
{
    double result=0;
    if (self.numberB == 0)
        NSLog(@"除数不为0");
    
    result = self.numberA / self.numberB;
    return result;
}
@end

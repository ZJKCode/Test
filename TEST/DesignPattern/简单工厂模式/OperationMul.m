//
//  OperationMul.m
//  Design Pattern
//
//  Created by zhangjikuan on 16/8/31.
//  Copyright © 2016年 zhang_jk. All rights reserved.
//

#import "OperationMul.h"

@implementation OperationMul
-(double)getResult
{
    double result=0;
    result = self.numberA*self.numberB;
    return result;
}
@end

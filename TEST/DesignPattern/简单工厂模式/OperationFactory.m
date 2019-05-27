//
//  OperationFactory.m
//  Design Pattern
//
//  Created by zhangjikuan on 16/8/31.
//  Copyright © 2016年 zhang_jk. All rights reserved.
//

#import "OperationFactory.h"
#import "Operation.h"
#import "OperationAdd.h"
#import "OperationMul.h"
#import "OperationSub.h"
#import "OperationDiv.h"

@implementation OperationFactory
+ (Operation *)createOperate:(NSString *)operate
{
    Operation *oper = nil;
 
    if ([operate isEqualToString:@"+"]) {
        oper = [[OperationAdd alloc] init];
    }else if ([operate isEqualToString:@"-"]){
        oper = [[OperationSub alloc] init];
    }else if ([operate isEqualToString:@"*"]){
        oper = [[OperationMul alloc] init];
    }else if ([operate isEqualToString:@"/"]){
        oper = [[OperationDiv alloc] init];
    }
    return oper;
}
@end

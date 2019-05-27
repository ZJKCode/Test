//
//  Operation.h
//  Design Pattern
//
//  Created by zhangjikuan on 16/8/31.
//  Copyright © 2016年 zhang_jk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OperationProtocol.h"
/*!
 *  运算类
 */
@interface Operation : NSObject
@property (nonatomic, assign)double numberA;
@property (nonatomic, assign)double numberB;

-(double)getResult;


@end

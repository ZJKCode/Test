//
//  OperationProtocol.h
//  Design Pattern
//
//  Created by zhangjikuan on 16/8/31.
//  Copyright © 2016年 zhang_jk. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol OperationProtocol <NSObject>
@property (nonatomic, assign)double numberA;
@property (nonatomic, assign)double numberB;

-(double)getResult;

@end

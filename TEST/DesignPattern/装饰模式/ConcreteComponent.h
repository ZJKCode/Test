//
//  ConcreteComponent.h
//  Design Pattern
//
//  Created by zhangjikuan on 16/9/1.
//  Copyright © 2016年 zhang_jk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Component.h"

@interface ConcreteComponent : NSObject<Component>
- (void)operation;

@end

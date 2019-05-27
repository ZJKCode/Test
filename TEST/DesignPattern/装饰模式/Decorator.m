//
//  Decorator.m
//  Design Pattern
//
//  Created by zhangjikuan on 16/9/1.
//  Copyright © 2016年 zhang_jk. All rights reserved.
//

#import "Decorator.h"
#import "Component.h"

@interface Decorator ()
@property (nonatomic, strong)id<Component> component;


@end

@implementation Decorator
- (void)setComponent:(id<Component>)component
{
    _component = component;
}

-(void)operation
{
    if (_component!=nil) {
        [_component operation];
    }

}

@end

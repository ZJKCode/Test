//
//  PersonDirect.h
//  Design Pattern
//
//  Created by zhangjikuan on 16/9/19.
//  Copyright © 2016年 zhang_jk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PersonBuilder.h"

@interface PersonDirect : NSObject
@property (nonatomic, copy) id <PersonBuilder> pb;

- (instancetype)initWithPerson:(id<PersonBuilder>)pb;

- (void)createPerson;

@end

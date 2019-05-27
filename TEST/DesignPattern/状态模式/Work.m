//
//  Work.m
//  Design Pattern
//
//  Created by zhangjikuan on 2016/9/26.
//  Copyright © 2016年 zhang_jk. All rights reserved.
//

#import "Work.h"
#import "ForenoonState.h"

@implementation Work


- (id<State>)current
{
    if (!_current) {
      return   [[ForenoonState alloc] init];
    }
    return _current;
    
}
- (void) writeProgram
{
    [self.current writeProgram:self];
}
@end

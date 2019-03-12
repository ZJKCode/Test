//
//  WCStream.m
//  TEST
//
//  Created by zhangjikuan on 2019/1/28.
//  Copyright © 2019 winchannel. All rights reserved.
//

#import "WCStream.h"

@implementation WCStream
- (instancetype)init {
    self = [super init];
    self.name = @"";
    return self;
}

#pragma mark abstract methods
- (WCStream *)bind:(WCStreamBindBlock  _Nullable (^)(void))block {
    NSString *reason = [NSString stringWithFormat:@"%@ must be overridden by subclasses", NSStringFromSelector(_cmd)];
    @throw [NSException exceptionWithName:NSInternalInconsistencyException reason:reason userInfo:nil];
}

- (WCStream *)concat:(WCStream *)stream {
    NSString *reason = [NSString stringWithFormat:@"%@ must be overridden by subclasses", NSStringFromSelector(_cmd)];
    @throw [NSException exceptionWithName:NSInternalInconsistencyException reason:reason userInfo:nil];
}

- (WCStream *)zipWith:(WCStream *)stream {
    NSString *reason = [NSString stringWithFormat:@"%@ must be overridden by subclasses", NSStringFromSelector(_cmd)];
    @throw [NSException exceptionWithName:NSInternalInconsistencyException reason:reason userInfo:nil];
}

- (instancetype)setNameWithFormat:(NSString *)format, ... NS_FORMAT_FUNCTION(1, 2) {
    if (getenv("RAC_DEBUG_SIGNAL_NAMES") == NULL) return self;

    NSCParameterAssert(format != nil);

    va_list args;
    va_start(args, format);

    NSString *str = [[NSString alloc] initWithFormat:format arguments:args];
    va_end(args);

    self.name = str;
    return self;
}
// 框架 
@end

//
//  WCStream.h
//  TEST
//
//  Created by zhangjikuan on 2019/1/28.
//  Copyright © 2019 winchannel. All rights reserved.
//

#import <Foundation/Foundation.h>
@class RACStream;
NS_ASSUME_NONNULL_BEGIN
@interface WCStream <__covariant ValueType> : NSObject

_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Wstrict-prototypes\"") \

typedef ValueType _Nonnull (^WCGenericReduceBlock)();
typedef id _Nonnull (^WCReduceBlock)();
_Pragma("clang diagnostic pop")

/// 返回参数是 RACStream 实例，意味着，改框架可以进行链式编程， 每一个block都可以使用返回值进行方法的调用
typedef WCStream * _Nullable (^WCStreamBindBlock)(ValueType _Nullable value, BOOL * _Nullable stop);

- (__kindof WCStream *_Nullable)bind:(WCStreamBindBlock _Nullable (^_Nullable)(void))block;

/// 调用的顺序是由内而外的，事件流就传出去了
- (__kindof WCStream *)concat:(WCStream *)stream;

///
- (__kindof WCStream *)zipWith:(WCStream *)stream;


@end


/// 所有的方法要求必须返回该类的实例对象 语法的设计上要求参数是一个block对象，
@interface WCStream ()
@property (copy) NSString *name;
- (instancetype)setNameWithFormat:(NSString *)format, ... NS_FORMAT_FUNCTION(1, 2);

@end

NS_ASSUME_NONNULL_END

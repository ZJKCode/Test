//
//  Instancefactory.h
//  iToast
//
//  Created by zhangjikuan on 2019/5/21.
//  Copyright © 2019 com.winchannel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ModuleProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface Instancefactory : NSObject

+ (NSObject <ModuleProtocol>  *)instanceWithClassName:(NSString *)clsName;



@end

NS_ASSUME_NONNULL_END

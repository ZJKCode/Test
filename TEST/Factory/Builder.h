//
//  Builder.h
//  TEST
//
//  Created by zhangjikuan on 2019/1/29.
//  Copyright © 2019 winchannel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Product.h"
NS_ASSUME_NONNULL_BEGIN

@interface Builder : NSObject
- (Product *)createProduct;

@end

NS_ASSUME_NONNULL_END

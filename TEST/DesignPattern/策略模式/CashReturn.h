//
//  CashReturn.h
//  Design Pattern
//
//  Created by zhangjikuan on 16/8/31.
//  Copyright © 2016年 zhang_jk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CashSuper.h"

/*!
 *  返利收费
 */
@interface CashReturn : NSObject<CashSuper>
- (void)cashReturnCondation:(NSString *)moneyCondation return:(NSString *)moneyReturn;
-(double)acceptCash:(double)money;

@end

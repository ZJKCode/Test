/*!
 
 @header Company1.h

 @abstract
 
 @author Created by zhangjikuan on 2016/10/9.
 
 @version 1.00 2016/10/9 Creation

   Copyright © 2016年 zhang_jk. All rights reserved.
 */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
/*!
  @class Company1
  @abstract 定义抽象接口
 */

@interface Company1 : NSObject

@property (nonatomic, copy) NSString *name;

// 增加
- (void)add:(Company1 *)c;
// 移除
- (void)remove:(Company1 *)c;
// 显示
- (void)display:(int)depth;
// 履行职责
- (void)lineOfDuty;

UIKIT_EXTERN void ZJKPictures(CGSize size);


@end

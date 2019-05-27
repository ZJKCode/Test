//
//  MyView.h
//  BezierPath_贝塞尔
//
//  Created by zhang_jk on 16/4/5.
//  Copyright © 2016年 Free_E. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyView : UIView

@property (nonatomic, strong) UIColor *color;
@property (nonatomic, assign) CGFloat lineWidth;
@property (nonatomic, strong) NSMutableArray *allLine;


/*!
 *  @brief 初始化
 */
- (void) initMyView;

/*!
 *  @brief unDo操作
 */
- (void) backImage;

/*!
 *  @brief reDo 操作
 */
- (void) forWardImage;

@end

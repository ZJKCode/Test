//
//  Resume.h
//  Design Pattern
//
//  Created by zhangjikuan on 16/9/2.
//  Copyright © 2016年 zhang_jk. All rights reserved.
//

#import <Foundation/Foundation.h>

/*!
 *  简历类，实现NSCopying协议
 */
@interface Resume : NSObject<NSCopying>
/*!
 *  姓名
 */
@property (nonatomic, copy) NSString *name;
/*!
 *  性别
 */
@property (nonatomic, copy) NSString *sex;
/*!
 *  年龄
 */
@property (nonatomic, copy) NSString *age;
/*!
 *  时间
 */
@property (nonatomic, copy) NSString *timeArea;
/*!
 *  公司
 */
@property (nonatomic, copy) NSString *company;

-(instancetype)initWithName:(NSString *)name;
- (void)setPersonInfoSex:(NSString *)sex age:(NSString *)age;
- (void)setWorkExprienceTimeArea:(NSString *)timeArea company:(NSString *)company;
- (void)dispaly;

@end

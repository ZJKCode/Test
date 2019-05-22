//
//  WCSDKUser.h
//  WCSDK
//
//  Created by zhangjikuan on 2019/5/22.
//  Copyright © 2019 winchannel. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "WCDataModel.h"

NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSUInteger, WCSDKGender)
{
    /**
     *  男
     */
    WCSDKGenderMale      = 0,
    /**
     *  女
     */
    WCSDKGenderFemale    = 1,
    /**
     *  未知
     */
    WCSDKGenderUnknown   = 2,
};
@interface WCSDKUser : WCDataModel
/**
 *  平台类型
 */
@property (nonatomic) NSInteger platformType;

/**
 *  用户标识
 */
@property (nonatomic, copy) NSString *uid;

/**
 *  昵称
 */
@property (nonatomic, copy) NSString *nickname;

/**
 *  头像
 */
@property (nonatomic, copy) NSString *icon;

/**
 *  性别
 */
@property (nonatomic) NSInteger gender;

/**
 *  用户主页
 */
@property (nonatomic, copy) NSString *url;

/**
 *  用户简介
 */
@property (nonatomic, copy) NSString *aboutMe;

/**
 *  认证用户类型
 */
@property (nonatomic) NSInteger verifyType;

/**
 *  认证描述
 */
@property (nonatomic, copy) NSString *verifyReason;

/**
 *  生日
 */
@property (nonatomic, strong) NSDate *birthday;

/**
 *  粉丝数
 */
@property (nonatomic) NSInteger followerCount;

/**
 *  好友数
 */
@property (nonatomic) NSInteger friendCount;

/**
 *  分享数
 */
@property (nonatomic) NSInteger shareCount;

/**
 *  注册时间
 */
@property (nonatomic) NSTimeInterval regAt;

/**
 *  用户等级
 */
@property (nonatomic) NSInteger level;

/**
 *  教育信息
 */
@property (nonatomic, retain) NSArray *educations;

/**
 *  职业信息
 */
@property (nonatomic, retain) NSArray *works;

/**
 *  原始数据
 */
@property (nonatomic, retain) NSDictionary *rawData;

@end

NS_ASSUME_NONNULL_END

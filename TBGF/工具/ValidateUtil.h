//
//  ValidateUtil.h
//  TBGF
//
//  Created by 张晓东 on 2017/11/29.
//  Copyright © 2017年 张晓东. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ValidateUtil : NSObject
/**
 是否是手机号码
 */
+ (BOOL)isMatchPhoneNumberFormat:(NSString *)mobile;
/**
 是否是正常密码格式
 */
+ (BOOL)isMatchPasswordFormat:(NSString *)password;
@end

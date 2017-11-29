//
//  ValidateUtil.m
//  TBGF
//
//  Created by 张晓东 on 2017/11/29.
//  Copyright © 2017年 张晓东. All rights reserved.
//

#import "ValidateUtil.h"

@implementation ValidateUtil
+(BOOL)isMatchPhoneNumberFormat:(NSString *)mobile{
       NSLog(@"phone%lu ",(unsigned long)mobile.length);
     NSLog(@"%@ ",mobile);
    if (mobile.length < 10)
    {
        return NO;
    }else{
        /**
         * 移动号段正则表达式
         */
        NSString *CM_NUM = @"^((13[4-9])|(147)|(15[0-2,7-9])|(178)|(18[2-4,7-8]))\\d{8}|(1705)\\d{7}$";
        /**
         * 联通号段正则表达式
         */
        NSString *CU_NUM = @"^((13[0-2])|(145)|(15[5-6])|(176)|(18[5,6]))\\d{8}|(1709)\\d{7}$";
        /**
         * 电信号段正则表达式
         */
        NSString *CT_NUM = @"^((133)|(153)|(177)|(18[0,1,9]))\\d{8}$";
        NSPredicate *pred1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM_NUM];
        BOOL isMatch1 = [pred1 evaluateWithObject:mobile];
        NSPredicate *pred2 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU_NUM];
        BOOL isMatch2 = [pred2 evaluateWithObject:mobile];
        NSPredicate *pred3 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT_NUM];
        BOOL isMatch3 = [pred3 evaluateWithObject:mobile];
        
        if (isMatch1 || isMatch2 || isMatch3) {
            return YES;
        }else{
            return NO;
        }
    }
    return NO;
}
+(BOOL)isMatchPasswordFormat:(NSString *)password{
    NSLog(@"password%lu ",(unsigned long)password.length);
    NSLog(@"%@ ",password);
    if (password.length < 7||password.length >16)
    {
        return NO;
    }else{
        /**
         * 密码正则表达式
         */
       // NSString *PS_WORD = @"^((13[4-9])|(147)|(15[0-2,7-9])|(178)|(18[2-4,7-8]))\\d{8}|(1705)\\d{7}$";
        NSString *CN_WORD = @"^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,16}$";
        NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CN_WORD];
        
        BOOL isMatch = [pred evaluateWithObject:password];
        if (isMatch) {
            return YES;
        }else{
            return NO;
        }
    }
    return NO;
}
@end

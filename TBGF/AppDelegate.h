//
//  AppDelegate.h
//  TBGF
//
//  Created by 张晓东 on 2017/11/22.
//  Copyright © 2017年 张晓东. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainTabViewController.h"
#import "LoginViewController.h"
#import <BaiduMapAPI_Map/BMKMapComponent.h>//引入地图功能所有的头文件
#import <AFNetworking.h>
// 引入JPush功能所需头文件
#import "JPUSHService.h"
// iOS10注册APNs所需头文件
#ifdef NSFoundationVersionNumber_iOS_9_x_Max
#import <UserNotifications/UserNotifications.h>
#endif
// 如果需要使用idfa功能所需要引入的头文件（可选）
#import <AdSupport/AdSupport.h>
static NSString *appKey = @"d567cb1f9dcbfa451546d4cf";
static NSString *channel = @"App store";
static BOOL isProduction = FALSE;
@interface AppDelegate : UIResponder<UIApplicationDelegate> {
    BMKMapManager* _mapManager;
}
@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UINavigationController *navController;
 
@property (strong, nonatomic) UITabBarController *tabBarController;

@end


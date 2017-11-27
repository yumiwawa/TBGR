//
//  AppDelegate.h
//  TBGF
//
//  Created by 张晓东 on 2017/11/22.
//  Copyright © 2017年 张晓东. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainTabViewController.h"
#import <BaiduMapAPI_Map/BMKMapComponent.h>//引入地图功能所有的头文件
@interface AppDelegate : UIResponder<UIApplicationDelegate> {
    BMKMapManager* _mapManager;
}
@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UINavigationController *navController;
 
@property (strong, nonatomic) UITabBarController *tabBarController;

@end


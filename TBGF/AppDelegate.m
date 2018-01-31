//
//  AppDelegate.m
//  TBGF
//
//  Created by 张晓东 on 2017/11/22.
//  Copyright © 2017年 张晓东. All rights reserved.
//

#import "AppDelegate.h"
#import "RootViewController.h"
#import "MYViewController.h"
#import "MapViewController.h"
#import <AlipaySDK/AlipaySDK.h>
@interface AppDelegate ()<JPUSHRegisterDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSLog(@"didFinishLaunchingWithOptions");
    // Override point for customization after application launch.
    _mapManager = [[BMKMapManager alloc]init];
    BOOL success =  [_mapManager start:@"chkdQij54eulOC3dMWadlbl08Cu874h6" generalDelegate:nil];
    
    if (!success) {
        NSLog(@"百度地图初始化失败");
    }
      NSLog(@"百度地图初始化成功");
 
//    //初始化百度定位
//    [[BMKLocationAuth sharedInstance] checkPermisionWithKey:@"chkdQij54eulOC3dMWadlbl08Cu874h6" authDelegate:self];
//    _mapLocationManager.delegate = self;
//    //设置返回位置的坐标系类型
//    _mapLocationManager.coordinateType = BMKLocationCoordinateTypeBMK09LL;
//    //设置距离过滤参数
//    _mapLocationManager.distanceFilter = kCLDistanceFilterNone;
//    //设置预期精度参数
//    _mapLocationManager.desiredAccuracy = kCLLocationAccuracyBest;
//    //设置应用位置类型
//    _mapLocationManager.activityType = CLActivityTypeAutomotiveNavigation;
//    //设置是否自动停止位置更新
//    _mapLocationManager.pausesLocationUpdatesAutomatically = NO;
//    //设置是否允许后台定位
//    _mapLocationManager.allowsBackgroundLocationUpdates = YES;
//    //设置位置获取超时时间
//    _mapLocationManager.locationTimeout = 10;
//    //设置获取地址信息超时时间
//    _mapLocationManager.reGeocodeTimeout = 10;
    
    // 如果要关注网络及授权验证事件，请设定     generalDelegate参数
    BOOL ret = [_mapManager start:@"chkdQij54eulOC3dMWadlbl08Cu874h6"  generalDelegate:nil];
    if (!ret) {
        NSLog(@"manager start failed!*****************");
    }
    // 创建程序窗口
    self.window = [[UIWindow alloc] initWithFrame:
                   [[UIScreen mainScreen] bounds]];
    
    MainTabViewController *mainVC = [[MainTabViewController alloc] init];
    self.window.rootViewController = mainVC;
    
    LoginViewController *loginVC = [[LoginViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:loginVC];
    [nav setNavigationBarHidden:NO];
    
    [mainVC addChildViewController:nav];
    [mainVC.view addSubview:nav.view];
    
    self.window.rootViewController = mainVC;
    [self.window makeKeyAndVisible];
    
    
    
    //极光推送APNS
    //notice: 3.0.0及以后版本注册可以这样写，也可以继续用之前的注册方式
    JPUSHRegisterEntity * entity = [[JPUSHRegisterEntity alloc] init];
    entity.types = JPAuthorizationOptionAlert|JPAuthorizationOptionBadge|JPAuthorizationOptionSound;
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
        // 可以添加自定义categories
        // NSSet<UNNotificationCategory *> *categories for iOS10 or later
        // NSSet<UIUserNotificationCategory *> *categories for iOS8 and iOS9
    }
    [JPUSHService registerForRemoteNotificationConfig:entity delegate:self];
    
    // Optional
    // 获取IDFA
    // 如需使用IDFA功能请添加此代码并在初始化方法的advertisingIdentifier参数中填写对应值
    NSString *advertisingId = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
    
    // Required
    // init Push
    // notice: 2.1.5版本的SDK新增的注册方法，改成可上报IDFA，如果没有使用IDFA直接传nil
    // 如需继续使用pushConfig.plist文件声明appKey等配置内容，请依旧使用[JPUSHService setupWithOption:launchOptions]方式初始化。
    [JPUSHService setupWithOption:launchOptions appKey:appKey
                          channel:channel
                 apsForProduction:isProduction
            advertisingIdentifier:advertisingId];
    
    
    //极光推送自定义消息
    NSNotificationCenter *defaultCenter = [NSNotificationCenter defaultCenter];
    [defaultCenter addObserver:self selector:@selector(networkDidReceiveMessage:) name:kJPFNetworkDidReceiveMessageNotification object:nil];
    
    return YES;
}
- (void)networkDidReceiveMessage:(NSNotification *)notification {
    NSDictionary * userInfo = [notification userInfo];
    NSString *content = [userInfo valueForKey:@"content"];
    NSDictionary *extras = [userInfo valueForKey:@"extras"];
    
    NSString *phoneNum= [extras valueForKey:@"id"];
    NSString *type=[extras valueForKey:@"type"];
    NSString *address=[extras valueForKey:@"address"];
    NSString *latitude=[extras valueForKey:@"latitude"];
    NSString *longitude=[extras valueForKey:@"longitude"];
    NSString *nickname=[extras valueForKey:@"nickName"];
    NSLog(@"%@", type);
    UIAlertController *alert;
    NSInteger msgType=[type intValue];
    if(msgType==1)
    {
        if(![phoneNum isEqualToString:@"15201019158"])
        {
            NSString *msg= [@"来自 " stringByAppendingString:phoneNum];
            msg= [msg stringByAppendingString:@"\n昵称 "];
            msg= [msg stringByAppendingString:nickname];
            msg= [msg stringByAppendingString:@"\n信息 "];
            msg= [msg stringByAppendingString:content];
            msg= [msg stringByAppendingString:@"\n纬度 "];
            msg= [msg stringByAppendingString:latitude];
            msg= [msg stringByAppendingString:@"\n经度 "];
            msg= [msg stringByAppendingString:longitude];
            msg= [msg stringByAppendingString:@"\n地址 "];
            msg= [msg stringByAppendingString:address];
            NSLog(msg);
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"不管" style:UIAlertActionStyleCancel handler:nil];
            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"救助" style:UIAlertActionStyleDefault handler:nil];
            
            alert = [UIAlertController alertControllerWithTitle:@"紧急求救" message: msg preferredStyle:  UIAlertControllerStyleAlert];
            [alert addAction:cancelAction];
            [alert addAction:okAction];
        }
        
    }else if(msgType==2)
    {
        alert = [UIAlertController alertControllerWithTitle:@"尊敬的用户" message:@"登录失败" preferredStyle:  UIAlertControllerStyleAlert];
    }
    if(alert!=nil)
    {
         [_window.rootViewController presentViewController:alert animated:YES completion:nil];
    }
}

- (void)applicationWillResignActive:(UIApplication *)application {
    NSLog(@"applicationWillResignActive");
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    NSLog(@"applicationDidEnterBackground");
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    NSLog(@"applicationWillEnterForeground");
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    NSLog(@"applicationDidBecomeActive");
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    NSLog(@"applicationWillTerminate");
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


//注册APNs成功并上报DeviceToken
- (void)application:(UIApplication *)application
didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    
    /// Required - 注册 DeviceToken
    [JPUSHService registerDeviceToken:deviceToken];
}
//实现注册APNs失败接口（可选）
- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    //Optional
    NSLog(@"did Fail To Register For Remote Notifications With Error: %@", error);
}

- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(NSInteger))completionHandler {
    // Required
    NSLog(@"center willPresentNotification %@",notification.request.content.userInfo);
    NSDictionary * userInfo = notification.request.content.userInfo;
    if([notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        [JPUSHService handleRemoteNotification:userInfo];
    }
    completionHandler(UNNotificationPresentationOptionAlert); // 需要执行这个方法，选择是否提醒用户，有Badge、Sound、Alert三种类型可以选择设置
}

// iOS 10 Support
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)())completionHandler {
    // Required
    NSLog(@"didReceiveNotificationResponse");
    NSDictionary * userInfo = response.notification.request.content.userInfo;
    if([response.notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        [JPUSHService handleRemoteNotification:userInfo];
    }
    completionHandler();  // 系统要求执行这个方法
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    NSLog(@"didReceiveRemoteNotification fetchCompletionHandler");
    // Required, iOS 7 Support
    [JPUSHService handleRemoteNotification:userInfo];
    completionHandler(UIBackgroundFetchResultNewData);
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    NSLog(@"didReceiveRemoteNotification");
    // Required,For systems with less than or equal to iOS6
    [JPUSHService handleRemoteNotification:userInfo];
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    if ([url.host isEqualToString:@"safepay"]) {
        // 支付跳转支付宝钱包进行支付，处理支付结果
        [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:^(NSDictionary *resultDic) {
            NSLog(@"result = %@",resultDic);
        }];
        
        // 授权跳转支付宝钱包进行支付，处理支付结果
        [[AlipaySDK defaultService] processAuth_V2Result:url standbyCallback:^(NSDictionary *resultDic) {
            NSLog(@"result = %@",resultDic);
            // 解析 auth code
            NSString *result = resultDic[@"result"];
            NSString *authCode = nil;
            if (result.length>0) {
                NSArray *resultArr = [result componentsSeparatedByString:@"&"];
                for (NSString *subResult in resultArr) {
                    if (subResult.length > 10 && [subResult hasPrefix:@"auth_code="]) {
                        authCode = [subResult substringFromIndex:10];
                        break;
                    }
                }
            }
            NSLog(@"授权结果 authCode = %@", authCode?:@"");
        }];
    }
    return YES;
}

// NOTE: 9.0以后使用新API接口
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString*, id> *)options
{
    if ([url.host isEqualToString:@"safepay"]) {
        // 支付跳转支付宝钱包进行支付，处理支付结果
        [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:^(NSDictionary *resultDic) {
            NSLog(@"result = %@",resultDic);
        }];
        
        // 授权跳转支付宝钱包进行支付，处理支付结果
        [[AlipaySDK defaultService] processAuth_V2Result:url standbyCallback:^(NSDictionary *resultDic) {
            NSLog(@"result = %@",resultDic);
            // 解析 auth code
            NSString *result = resultDic[@"result"];
            NSString *authCode = nil;
            if (result.length>0) {
                NSArray *resultArr = [result componentsSeparatedByString:@"&"];
                for (NSString *subResult in resultArr) {
                    if (subResult.length > 10 && [subResult hasPrefix:@"auth_code="]) {
                        authCode = [subResult substringFromIndex:10];
                        break;
                    }
                }
            }
            NSLog(@"授权结果 authCode = %@", authCode?:@"");
        }];
    }
    return YES;
}
@end

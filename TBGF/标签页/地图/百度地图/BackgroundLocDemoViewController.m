//
//  BackgroundLocDemoViewController.m
//  IphoneMapSdkDemo
//
//  Created by baidu on 2017/8/24.
//  Copyright © 2017年 Baidu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BackgroundLocDemoViewController.h"
#import "MyLocation.h"

//尺寸设置
#define aiScreenWidth [UIScreen mainScreen].bounds.size.width
#define aiScreenHeight [UIScreen mainScreen].bounds.size.height
#define STATUS_BAR_HEIGHT [[UIApplication sharedApplication] statusBarFrame].size.height
#define NAVIGATION_BAR_HEIGHT self.navigationController.navigationBar.frame.size.height
#define TAB_BAR_HEIGHT self.tabBarController.tabBar.frame.size.height

@interface BackgroundLocDemoViewController()

@property(nonatomic, strong) BMKLocationManager *locationManager;
@property(nonatomic, assign) BOOL isNeedAddr;
@property(nonatomic, assign) BOOL isNeedBackLoc;
@property(nonatomic, assign) BOOL isLocationg;
@property(nonatomic, assign) int locnum;
@property(nonatomic, assign) CLLocationDistance distanceConfig;

@end

@implementation BackgroundLocDemoViewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        UIBarButtonItem *customRightBarButtonItem = [[UIBarButtonItem alloc] init];
        customRightBarButtonItem.title = @"说明";
        customRightBarButtonItem.action = @selector(showDialoger);
        customRightBarButtonItem.target = self;
        self.navigationItem.rightBarButtonItem = customRightBarButtonItem;
    }
    _isNeedAddr = YES;
    _isLocationg = NO;
    _isNeedBackLoc = YES;
    _distanceConfig = kCLDistanceFilterNone;
    _locnum = 0;
    
    return self;
}

-(void)showDialoger
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"后台连续定位" message:@"点击HOME进入后台，APP会持续进行定位" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
    }];
    
    [alert addAction:action1];
    
    
    [self presentViewController:alert animated:YES completion:^{
    }];
    
    
}



-(void)initLocation
{
    
     [[BMKLocationAuth sharedInstance] checkPermisionWithKey:@"chkdQij54eulOC3dMWadlbl08Cu874h6" authDelegate:self];
    _locationManager = [[BMKLocationManager alloc] init];
    
    _locationManager.delegate = self;
    
    _locationManager.coordinateType = BMKLocationCoordinateTypeBMK09LL;
    _locationManager.distanceFilter = 10.0f;
    _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    _locationManager.activityType = CLActivityTypeAutomotiveNavigation;
    _locationManager.pausesLocationUpdatesAutomatically = NO;
    _locationManager.allowsBackgroundLocationUpdates = YES;// YES的话是可以进行后台定位的，但需要项目配置，否则会报错，具体参考开发文档
    _locationManager.locationTimeout = 10;
    _locationManager.reGeocodeTimeout = 10;
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //适配ios7
    if( ([[[UIDevice currentDevice] systemVersion] doubleValue]>=7.0))
    {
        //        self.edgesForExtendedLayout=UIRectEdgeNone;
        self.navigationController.navigationBar.translucent = NO;
    }
    [self initLocation];
    [self startLoc];
    //打开实时路况图层
    [_mapView setTrafficEnabled:NO];
    _mapView.showsUserLocation = YES;//显示定位图层
    _mapView.userTrackingMode = BMKUserTrackingModeFollow;//设置定位的状态为普通定位模式
}

-(void)viewWillAppear:(BOOL)animated {
    [_mapView viewWillAppear];
    _mapView.delegate = self; // 此处记得不用的时候需要置nil，否则影响内存的释放
    _mapView.showsUserLocation = YES;
}

-(void)viewWillDisappear:(BOOL)animated {
    [_mapView viewWillDisappear];
    _mapView.delegate = nil; // 不用时，置nil
}
- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    
    [_locationManager stopUpdatingLocation];
    [_locationManager stopUpdatingHeading];
    _locationManager.delegate = nil;
    
}
- (void)dealloc {
    if (_mapView) {
        _mapView = nil;
    }
    _locationManager = nil;
}


/**
 *  @brief 当定位发生错误时，会调用代理的此方法。
 *  @param manager 定位 BMKLocationManager 类。
 *  @param error 返回的错误，参考 CLError 。
 */
- (void)BMKLocationManager:(BMKLocationManager * _Nonnull)manager didFailWithError:(NSError * _Nullable)error
{
    
    NSLog(@"serial loc error = %@", error);
    
}

- (void)BMKLocationManager:(BMKLocationManager * _Nonnull)manager didUpdateLocation:(BMKLocation * _Nullable)location orError:(NSError * _Nullable)error

{
    
    
    if (error)
    {
        NSLog(@"locError:{%ld - %@};", (long)error.code, error.localizedDescription);
        
        
    } if (location) {//得到定位信息，添加annotation
        if (location.location) {
            NSLog(@"LOC = %@",location.location);
        }
        BMKPointAnnotation *pointAnnotation = [[BMKPointAnnotation alloc]init];
        
        pointAnnotation.coordinate = location.location.coordinate;
        pointAnnotation.title = @"连续定位";
        if (location.rgcData) {
            pointAnnotation.subtitle = [location.rgcData description];
        } else {
            pointAnnotation.subtitle = @"rgc = null!";
        }
        
        
      //  [self addAnnotationToMapView:pointAnnotation];
        
        MyLocation * loc = [[MyLocation alloc]initWithLocation:location.location withHeading:nil];
        [self addLocToMapView:loc];
      
        
        [self updateMessage:[NSString stringWithFormat:@"lat=%.5f | lon=%.5f",location.location.coordinate.latitude, location.location.coordinate.longitude]];
        
    }
    
}

- (void)addLocToMapView:(MyLocation *)loc
{
    [_mapView updateLocationData:loc];
    [_mapView setCenterCoordinate:loc.location.coordinate animated:YES];
}

/**
 *  @brief 定位权限状态改变时回调函数
 *  @param manager 定位 BMKLocationManager 类。
 *  @param status 定位权限状态。
 */
- (void)BMKLocationManager:(BMKLocationManager * _Nonnull)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    
    
    NSLog(@"serial loc CLAuthorizationStatus = %d", status);
    
}



/**
 * BMKLocationManagerShouldDisplayHeadingCalibration:
 *    该方法为BMKLocationManager提示需要设备校正回调方法。
 * @param manager 提供该定位结果的BMKLocationManager类的实例
 */
- (BOOL)BMKLocationManagerShouldDisplayHeadingCalibration:(BMKLocationManager * _Nonnull)manager
{
    
    
    NSLog(@"serial loc need calibration heading! ");
    return YES;
}

/**
 * BMKLocationManager:didUpdateHeading:
 *    该方法为BMKLocationManager提供设备朝向的回调方法。
 * @param manager 提供该定位结果的BMKLocationManager类的实例
 * @param heading 设备的朝向结果
 */
- (void)BMKLocationManager:(BMKLocationManager * _Nonnull)manager
          didUpdateHeading:(CLHeading * _Nullable)heading
{
    
    
    NSLog(@"serial loc heading = %@", heading.description);
    
}


-(void)updateMessage:(NSString *)msg
{
    _locnum++;

}

- (void)addAnnotationToMapView:(BMKPointAnnotation *)annotation
{
    [_mapView addAnnotation:annotation];
}

- (void) startLoc {
    if (_isLocationg) {
        [_locationManager stopUpdatingLocation];
        if ([BMKLocationManager headingAvailable]) {
            [_locationManager stopUpdatingHeading];
        }
      
        _isLocationg = NO;
    } else {
        _locationManager.locatingWithReGeocode = _isNeedAddr;
        _locationManager.allowsBackgroundLocationUpdates = _isNeedBackLoc;
        [_locationManager startUpdatingLocation];
        if ([BMKLocationManager headingAvailable]) {
            
            NSLog(@"BMKLocationManager headingAvailable true ");
            [_locationManager startUpdatingHeading];
        }
       
        _isLocationg = YES;
        
//        if (_locationManager.allowsBackgroundLocationUpdates) {
//            [self addToastWithString:@"连续定位已启动，可点击home进入后台" inView:self.view];
//        }
    }
}


- (void) addToastWithString:(NSString *)string inView:(UIView *)view {
    
    CGRect initRect = CGRectMake(0, STATUS_BAR_HEIGHT + 140, aiScreenWidth, 0);
    CGRect rect = CGRectMake(0, STATUS_BAR_HEIGHT + 140, aiScreenWidth, 22);
    UILabel* label = [[UILabel alloc] initWithFrame:initRect];
    label.text = string;
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont systemFontOfSize:14];
    label.backgroundColor = [UIColor colorWithRed:0 green:0.6 blue:0.9 alpha:0.6];
    
    [view addSubview:label];
    
    //弹出label
    [UIView animateWithDuration:0.5 animations:^{
        
        label.frame = rect;
        
    } completion:^ (BOOL finished){
        //弹出后持续1s
        [NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(removeToastWithView:) userInfo:label repeats:NO];
    }];
}

- (void) removeToastWithView:(NSTimer *)timer {
    
    UILabel* label = [timer userInfo];
    
    CGRect initRect = CGRectMake(0, STATUS_BAR_HEIGHT + 140, aiScreenWidth, 0);
    //    label消失
    [UIView animateWithDuration:0.5 animations:^{
        
        label.frame = initRect;
    } completion:^(BOOL finished){
        
        [label removeFromSuperview];
    }];
}

@end

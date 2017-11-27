//
//  MAPViewController.m
//  TBGF
//
//  Created by 张晓东 on 2017/11/24.
//  Copyright © 2017年 张晓东. All rights reserved.
//

#import "BaiduMapViewController.h"
#import <BaiduMapAPI_Map/BMKMapView.h>//只引入所需的单个头文件

@interface BaiduMapViewController ()<BMKMapViewDelegate>

@end
@implementation BaiduMapViewController
@synthesize mapView=_mapView;
-(id)initWithNibName:(NSString *)nibNameOrNil
              bundle:(NSBundle *)nibBundleOrNil
{
    if ([super initWithNibName:nibNameOrNil bundle:nibBundleOrNil] != nil)
    {
        // 为该控制器设置标签项
        self.tabBarItem = [[UITabBarItem alloc]
                           initWithTitle:@"地图"
                           image:[UIImage imageNamed:@"map_icon_normal.png"] tag:2];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    BMKMapView* mapView = [[BMKMapView alloc]initWithFrame:self.view.bounds];
    self.view = mapView;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void)viewWillAppear:(BOOL)animated
{
    [_mapView viewWillAppear];
    _mapView.delegate = self; // 此处记得不用的时候需要置nil，否则影响内存的释放
}
-(void)viewWillDisappear:(BOOL)animated
{
    [_mapView viewWillDisappear];
    _mapView.delegate = nil; // 不用时，置nil
}

@end

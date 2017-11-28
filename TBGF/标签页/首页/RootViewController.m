//
//  RootViewController.m
//  兔子的5s
//
//  Created by 张晓东 on 14-10-10.
//  Copyright (c) 2014年 张晓东. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()
@end

@implementation RootViewController



-(id)initWithNibName:(NSString *)nibNameOrNil
              bundle:(NSBundle *)nibBundleOrNil
{
    if ([super initWithNibName:nibNameOrNil bundle:nibBundleOrNil] != nil)
    {
        // 为该控制器设置标签项
        self.tabBarItem = [[UITabBarItem alloc]
                           initWithTitle:@"首页"
                           image:[UIImage imageNamed:@"home_icon_normal.png"] tag:1];
        
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // 设置title
    self.title = @"首页";
   
    
    [_dongtai setUserInteractionEnabled:YES];
    [_dongtai addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickCategory:)]];
    
    
}
- (void)viewWillAppea:(BOOL)animated
{
   
}
- (void)viewWillDisappear:(BOOL)animated
{
    
    [super viewWillDisappear:animated];
}
-(void)clickCategory:(UITapGestureRecognizer* )gestureRecognizer
{
    UIView *viewClicked=[gestureRecognizer view];
    if (viewClicked==_dongtai) {
        NSLog(@"dongtai");
//        BaiduMapViewController *baiduMapController = [[BaiduMapViewController alloc]init];
//
//        UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] init];
//        temporaryBarButtonItem.title = @"地图";
//        self.navigationItem.backBarButtonItem = temporaryBarButtonItem;
//        [self.navigationController pushViewController:baiduMapController animated:NO];
        
    }else if(viewClicked==_dongtai)
    {
        NSLog(@"imageView2");
    }
}

@end

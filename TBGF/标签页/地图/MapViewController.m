//
//  MapViewController.m
//  TBGF
//
//  Created by 张晓东 on 2017/11/27.
//  Copyright © 2017年 张晓东. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()

@end

@implementation MapViewController


-(id)initWithNibName:(NSString *)nibNameOrNil
              bundle:(NSBundle *)nibBundleOrNil
{
    if ([super initWithNibName:nibNameOrNil bundle:nibBundleOrNil] != nil)
    {
        // 为该控制器设置标签项
        self.tabBarItem = [[UITabBarItem alloc]
                           initWithTitle:@"地图"
                           image:[UIImage imageNamed:@"my_icon_normal.png"] tag:3];
        //设置徽标
        self.tabBarItem.badgeValue=@"牛";
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib
    // 设置title
    self.title = @"地图";
    
    [_ditu setUserInteractionEnabled:YES];
    [_ditu addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickCategory:)]];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)clickCategory:(UITapGestureRecognizer* )gestureRecognizer
{
    UIView *viewClicked=[gestureRecognizer view];
    if (viewClicked==_ditu) {
        NSLog(@"ditu");
        BaiduMapViewController *baiduMapController = [[BaiduMapViewController alloc]init];
        baiduMapController.hidesBottomBarWhenPushed = YES;
        UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] init];
        temporaryBarButtonItem.title = @"地图";
        self.navigationItem.backBarButtonItem = temporaryBarButtonItem;
        [self.navigationController pushViewController:baiduMapController animated:NO];
        if(self.navigationController==nil)
        {
               NSLog(@"navigationController nil");
        }
        
//        BaiduMapViewController *baiduMapController = [[BaiduMapViewController alloc]init];
//        UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] init];
//        temporaryBarButtonItem.title = @"地图";
//        self.navigationItem.backBarButtonItem = temporaryBarButtonItem;
//        [self.navigationController pushViewController:baiduMapController animated:NO];
    }else if(viewClicked==_ditu)
    {
        NSLog(@"imageView2");
    }
}

@end

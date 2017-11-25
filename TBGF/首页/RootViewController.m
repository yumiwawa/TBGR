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
    [NSThread sleepForTimeInterval:3];
    [super viewDidLoad];
    //自定义title
    UIButton *button = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    [button setTitle: @"首页" forState: UIControlStateNormal];
    [button sizeToFit];
    //标题view
    self.navigationItem.titleView = button;
    //返回view
    
   // [self.myTableView reloadData];
    
}
- (void)viewWillAppea:(BOOL)animated
{
   
}
- (void)viewWillDisappear:(BOOL)animated
{
    
    [super viewWillDisappear:animated];
}


@end

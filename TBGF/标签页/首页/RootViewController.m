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
    
    [_gameImageView setUserInteractionEnabled:YES];
    [_gameImageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickCategory:)]];
    
    [_sosImageView setUserInteractionEnabled:YES];
    [_sosImageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickCategory:)]];
    
    [_emergencyImageView setUserInteractionEnabled:YES];
    [_emergencyImageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickCategory:)]];
    
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
        GfdtViewController *gfdtController = [[GfdtViewController alloc]init];

        UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] init];
        temporaryBarButtonItem.title = @"国防动态";
        self.navigationItem.backBarButtonItem = temporaryBarButtonItem;
        [self.navigationController pushViewController:gfdtController animated:NO];
        
    }else if(viewClicked==_gameImageView)
    {
        NSLog(@"game");
        GameViewController *gameController = [[GameViewController alloc]init];
         gameController.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:gameController animated:NO];
        
    }else if(viewClicked==_sosImageView)
    {
        NSLog(@"sos");
        SosViewController *sosController = [[SosViewController alloc]init];
        sosController.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:sosController animated:NO];
    }else if(viewClicked==_emergencyImageView)
    {
        NSLog(@"emergency");
        EmergencyViewController *emController = [[EmergencyViewController alloc]init];
        emController.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:emController animated:NO];
    }
}

@end

//
//  MYViewController.m
//  兔子的5s
//
//  Created by 张晓东 on 15/12/19.
//  Copyright © 2015年 张晓东. All rights reserved.
//

#import "MYViewController.h"

@interface MYViewController ()

@end

@implementation MYViewController




-(id)initWithNibName:(NSString *)nibNameOrNil
              bundle:(NSBundle *)nibBundleOrNil
{
    if ([super initWithNibName:nibNameOrNil bundle:nibBundleOrNil] != nil)
    {
        // 为该控制器设置标签项
        self.tabBarItem = [[UITabBarItem alloc]
                           initWithTitle:@"我"
                           image:[UIImage imageNamed:@"my_icon_normal.png"] tag:3];
        //设置徽标
        self.tabBarItem.badgeValue=@"牛";
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
}
@end

//
//  MainTabViewController.m
//  TBGF
//
//  Created by 张晓东 on 2017/11/27.
//  Copyright © 2017年 张晓东. All rights reserved.
//

#import "MainTabViewController.h"

@interface MainTabViewController ()

@end

@implementation MainTabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 执行加载控制器
    [self loadViewControllers];
    
  
    //设置标签栏背景
    //[self.tabBar setBackgroundImage:[UIImage imageNamed:@"feiji"]];

    // Do any additional setup after loading the view.
}
- (void)loadViewControllers {
    
    // 1.新建第一页视图控制器实例
    RootViewController *firstVC = [[RootViewController alloc] init];
    // 2.新建第一页导航控制器实例，把firstVC加入进去
    UINavigationController *firstNC = [[UINavigationController alloc] initWithRootViewController:firstVC];
    // 3.新建第一页的标签栏图标
//    UITabBarItem *firstTabBarItem =[[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemBookmarks tag:0];
    // 自定义显示的图片
//    UIImage *homeNormal = [UIImage imageNamed:@"home_icon_selected"];
//    UITabBarItem *firstTabBarItem = [[UITabBarItem alloc] initWithTitle:@"Main" image:homeNormal tag:0];
    UITabBarItem *firstTabBarItem = [[UITabBarItem alloc]
                                     initWithTitle:@"首页"
                                     image:[UIImage imageNamed:@"home_icon_normal.png"] tag:0];
    // 4.图标加入到第一页的导航控制器上
    firstNC.tabBarItem = firstTabBarItem;
    
    [firstNC.navigationBar  setBackgroundImage:[self createImageWithColor:[UIColor clearColor]] forBarMetrics:UIBarMetricsDefault];
    [firstNC.navigationBar  setShadowImage:[self createImageWithColor:[UIColor clearColor]]];
    //    [self.navigationController.navigationBar  setTintColor:[UIColor whiteColor]];
    [firstNC.navigationBar  setTranslucent:YES];
    
   
    //设置导航栏
//    // 设置导航栏背景图片(需要素材)
//    [firstNC.navigationBar setBackgroundImage:[UIImage imageNamed:@"feiji"] forBarMetrics:UIBarMetricsDefault];
//    // 设置导航栏样式
//    [firstNC.navigationBar setBarStyle:UIBarStyleBlackTranslucent];
//    // 设置返回按钮文字和图标颜色
//    [firstNC.navigationBar setTintColor:[UIColor redColor]];
    
    
    // 第二页
    MapViewController *secondVC = [[MapViewController alloc] init];
    UINavigationController *secondNC = [[UINavigationController alloc] initWithRootViewController:secondVC];
    UITabBarItem *secondTabBarItem = [[UITabBarItem alloc]
                                     initWithTitle:@"地图"
                                      image:[UIImage imageNamed:@"map_icon_normal.png"] tag:1];
    secondNC.tabBarItem = secondTabBarItem;
    
    // 第三页
    MYViewController *thirdVC = [[MYViewController alloc] init];
    UINavigationController *thirdNC = [[UINavigationController alloc] initWithRootViewController:thirdVC];
    UITabBarItem *thirdTabBarItem = [[UITabBarItem alloc]
                                      initWithTitle:@"我"
                                      image:[UIImage imageNamed:@"my_icon_normal.png"] tag:2];
    thirdNC.tabBarItem = thirdTabBarItem;
     thirdNC.tabBarItem.badgeValue=@"牛";
    
    // 5.新建一个导航控制器实例的数组
    NSArray *controllersArray = @[firstNC, secondNC,thirdNC];
    // 6.把导航控制器的数组加入到标签控制器
    [self setViewControllers:controllersArray animated:YES];
    
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(UIImage *) createImageWithColor: (UIColor *) color
{
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
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
    [self.selectedViewController beginAppearanceTransition: YES animated: animated];
}

-(void) viewDidAppear:(BOOL)animated
{
    [self.selectedViewController endAppearanceTransition];
}

-(void) viewWillDisappear:(BOOL)animated
{
    [self.selectedViewController beginAppearanceTransition: NO animated: animated];
}

-(void) viewDidDisappear:(BOOL)animated
{
    [self.selectedViewController endAppearanceTransition];
}
@end

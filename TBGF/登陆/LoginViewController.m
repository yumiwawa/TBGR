//
//  ViewController.m
//  TBGF
//
//  Created by 张晓东 on 2017/11/28.
//  Copyright © 2017年 张晓东. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
      [NSThread sleepForTimeInterval:3];
    self.title=@"登陆";
    //    //创建rootview
    //    RootViewController *rootView = [[RootViewController alloc] init];
    //    [self.navController pushViewController:rootView animated:YES];
    //
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

- (IBAction)goToLogin:(UIButton *)sender {
     NSLog(@"登录");
    MainTabViewController *mainVC = [[MainTabViewController alloc] init];
   [self.navigationController pushViewController:mainVC animated:NO];
    [self.navigationController setNavigationBarHidden:YES];
    
}

- (IBAction)goFrogetPassword:(UIButton *)sender {
      NSLog(@"忘记密码");
    ChangePasswordViewController *cpVc = [[ChangePasswordViewController alloc] init];
    [self.navigationController pushViewController:cpVc animated:NO];
}

- (IBAction)goRegister:(UIButton *)sender {
    NSLog(@"去注册");
    PhoneVerifyViewController *pvVc = [[PhoneVerifyViewController alloc] init];
    [self.navigationController pushViewController:pvVc animated:NO];
    
}
@end

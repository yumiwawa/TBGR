//
//  PhoneVerifyViewController.m
//  TBGF
//
//  Created by 张晓东 on 2017/11/28.
//  Copyright © 2017年 张晓东. All rights reserved.
//

#import "PhoneVerifyViewController.h"

@interface PhoneVerifyViewController ()

@end

@implementation PhoneVerifyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
       self.title = @"手机号码验证";
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

- (IBAction)goToRegister:(UIButton *)sender {
    RegisterViewController *rgVc = [[RegisterViewController alloc] init];
    [self.navigationController pushViewController:rgVc animated:NO];
}
@end

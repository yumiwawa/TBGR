//
//  ViewController.h
//  TBGF
//
//  Created by 张晓东 on 2017/11/28.
//  Copyright © 2017年 张晓东. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainTabViewController.h"
#import "PhoneVerifyViewController.h"
#import "ChangePasswordViewController.h"

@interface LoginViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *account;
@property (strong, nonatomic) IBOutlet UITextField *password;
@property (strong, nonatomic) IBOutlet UIButton *login;
@property (strong, nonatomic) IBOutlet UIButton *frogetPassword;
@property (strong, nonatomic) IBOutlet UIButton *toRegister;
- (IBAction)goToLogin:(UIButton *)sender;
- (IBAction)goFrogetPassword:(UIButton *)sender;
- (IBAction)goRegister:(UIButton *)sender;

@end

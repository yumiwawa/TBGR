//
//  ViewController.m
//  TBGF
//
//  Created by 张晓东 on 2017/11/28.
//  Copyright © 2017年 张晓东. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()<UITextFieldDelegate>

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
      [NSThread sleepForTimeInterval:3];
    self.title=@"登陆";
    _account.delegate = self;//代理指定为自身所在的类对象
     _password.delegate = self;//代理指定为自身所在的类对象
    //添加变化监听
    [_account addTarget:self action:@selector(textFieldChanged:) forControlEvents:UIControlEventEditingChanged];
    [_password addTarget:self action:@selector(textFieldChanged:) forControlEvents:UIControlEventEditingChanged];
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

- (IBAction)didEndOnExit:(id)sender {
    [sender resignFirstResponder];
}

- (IBAction)closeKeyboard:(id)sender {
    [self.account resignFirstResponder];
    [self.password resignFirstResponder];
}

//文本框追踪按回车自动切换下一行
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSLog(@"next");
    //如果光标 用户名切换到密码
    if (textField == self.account) {
        //密码成为第一响应者
        [self.password becomeFirstResponder];
          return NO;
    }
    return YES;
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSLog(@"%@ %@",NSStringFromRange(range),string);
    NSInteger loc = range.location;
    if (textField == self.account) {
        if (loc > 10)
            return NO;
        
    }else{
        if (loc > 15)
            return NO;
    }
    
    return YES;
    
}
- (void)textFieldDidEndEditing:(UITextField *)textField;
{
    
    [self isRightFormat];
}
- (void)isRightFormat
{
    NSString *phoneNum=self.account.text;
    NSString *password=self.password.text;
    Boolean isPhone= [ValidateUtil isMatchPhoneNumberFormat:phoneNum];
    Boolean isPassword= [ValidateUtil isMatchPasswordFormat:password];
      NSLog(@"*****%@ ",phoneNum);
    if(isPhone)
    {
        NSLog(@"是电话号码");
        if(isPassword)
        {
            NSLog(@"密码格式对");
            [self.login setEnabled:true];
        }else{
            NSLog(@"密码格式不对");
            [self.login setEnabled:false];
        }
    }else
    {
        NSLog(@"不是电话号码");
        [self.login setEnabled:false];
    }
}
- (void)textFieldChanged:(UITextField *)textField {
       [self isRightFormat];
}
@end

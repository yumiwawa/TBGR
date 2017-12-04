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
    self.title=@"登录";
    _account.delegate = self;//代理指定为自身所在的类对象
     _password.delegate = self;//代理指定为自身所在的类对象
    //设置提示字体颜色
    [_account setValue:[UIColor grayColor] forKeyPath:@"_placeholderLabel.textColor"];
     [_password setValue:[UIColor grayColor] forKeyPath:@"_placeholderLabel.textColor"];
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
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];//创建AFN管理者
    //序列化
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    //接受类型是字符串
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    //获取用户输入的账号密码
    NSString *userStr = self.account.text;
    NSString *passStr = self.password.text;
    NSDictionary *dic = @{
                          @"name":userStr,
                          @"password":passStr
                          };
   
    [manager POST:@"http://www.smartbyy.com/login/loginNameTest.php" parameters:dic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *nsdic = responseObject;
        NSLog(@"%@",nsdic);
        NSLog(@"登录成功 我的天");
        NSString * str = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
        NSLog(@"登录结果%@",str);
         UIAlertController *alert;
        if([str isEqual:@"0"])
        {
              alert = [UIAlertController alertControllerWithTitle:@"尊敬的用户" message:@"登录成功" preferredStyle:  UIAlertControllerStyleAlert];
            MainTabViewController *mainVC = [[MainTabViewController alloc] init];
            [self.navigationController pushViewController:mainVC animated:NO];
            [self.navigationController setNavigationBarHidden:YES];
        }else
        {
              alert = [UIAlertController alertControllerWithTitle:@"尊敬的用户" message:@"登录失败" preferredStyle:  UIAlertControllerStyleAlert];
        }
        [self presentViewController:alert animated:true completion:nil];
            //弹出提示框；
        [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(creatAlert:) userInfo:alert repeats:NO];

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSError *err = error;
        NSLog(@"%@",err);
        NSLog(@"登录失败");
        UIAlertController *alert;
        alert = [UIAlertController alertControllerWithTitle:@"尊敬的用户" message:@"登录失败" preferredStyle:  UIAlertControllerStyleAlert];
         [self presentViewController:alert animated:true completion:nil];
    }];
   
}
- (void)creatAlert:(NSTimer *)timer{
    UIAlertController *alert = [timer userInfo];
    [alert dismissViewControllerAnimated:YES completion:nil];
    alert = nil;
    
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

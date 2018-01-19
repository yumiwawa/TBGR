//
//  SosViewController.m
//  TBGF
//
//  Created by 张晓东 on 2017/12/7.
//  Copyright © 2017年 张晓东. All rights reserved.
//

#import "SosViewController.h"

@interface SosViewController ()

@end

@implementation SosViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [_chooseSegment addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
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

- (IBAction)onclick110:(id)sender {
    NSMutableString * str=[[NSMutableString alloc] initWithFormat:@"tel:%@",@"110"];
    UIWebView * callWebview = [[UIWebView alloc] init];
    [callWebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:str]]];
    [self.view addSubview:callWebview];
}

- (IBAction)onclick119:(id)sender {
    NSMutableString * str=[[NSMutableString alloc] initWithFormat:@"tel:%@",@"119"];
    UIWebView * callWebview = [[UIWebView alloc] init];
    [callWebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:str]]];
    [self.view addSubview:callWebview];
}

- (IBAction)onclick120:(id)sender {
    NSMutableString * str=[[NSMutableString alloc] initWithFormat:@"tel:%@",@"120"];
    UIWebView * callWebview = [[UIWebView alloc] init];
    [callWebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:str]]];
    [self.view addSubview:callWebview];
}

- (IBAction)onclickDear:(id)sender {
    NSMutableString * str=[[NSMutableString alloc] initWithFormat:@"tel:%@",@"15201019158"];
    UIWebView * callWebview = [[UIWebView alloc] init];
    [callWebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:str]]];
    [self.view addSubview:callWebview];
}

- (IBAction)onclickSos:(id)sender {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];//创建AFN管理者
    //序列化
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    //接受类型是字符串
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    NSDictionary *dic = @{
                          @"message":@"我被困在这里,快来救我,来自iphone8",
                          @"id":@"15201019158",
                          @"type":@"1",
                          @"latitude":@"40.3456",
                          @"longitude":@"113.9876",
                          @"address":@"北京火炬广场一号",
                          @"nickName":@"倔强的兔子",
                          };
    
    [manager POST:@"http://www.smartbyy.com/push.php" parameters:dic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSString * str = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
        NSLog(@"求救信号发送结果%@",str);
        UIAlertController *alert;
        if([str isEqual:@"0"])
        {
            alert = [UIAlertController alertControllerWithTitle:@"尊敬的用户" message:@"求救信号发送成功" preferredStyle:  UIAlertControllerStyleAlert];
            
        }else
        {
            alert = [UIAlertController alertControllerWithTitle:@"尊敬的用户" message:@"求救信号发送失败" preferredStyle:  UIAlertControllerStyleAlert];
        }
        [self presentViewController:alert animated:true completion:nil];
        //弹出提示框；
        [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(creatAlert:) userInfo:alert repeats:NO];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSError *err = error;
        NSLog(@"%@",err);
        NSLog(@"求救失败");
        UIAlertController *alert;
        alert = [UIAlertController alertControllerWithTitle:@"尊敬的用户" message:@"求救失败" preferredStyle:  UIAlertControllerStyleAlert];
        [self presentViewController:alert animated:true completion:nil];
        [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(creatAlert:) userInfo:alert repeats:NO];
    }];
}

-(void)segmentAction:(UISegmentedControl *)Seg{
    
    NSInteger Index = Seg.selectedSegmentIndex;
    
    NSLog(@"Index %li", (long)Index);
    
    switch (Index) {
            
        case 0:
            [_button110 setHidden:NO];
            [_button119 setHidden:NO];
            [_button120 setHidden:NO];
            [_buttonDear setHidden:NO];
            [_buttonSos setHidden:YES];
            break;
            
        case 1:
            [_button110 setHidden:YES];
            [_button119 setHidden:YES];
            [_button120 setHidden:YES];
            [_buttonDear setHidden:YES];
            [_buttonSos setHidden:NO];
            break;
            
        default:
            
            break;
            
    }
    
}
- (void)creatAlert:(NSTimer *)timer{
    UIAlertController *alert = [timer userInfo];
    [alert dismissViewControllerAnimated:YES completion:nil];
//    alert = nil;
    
}
@end

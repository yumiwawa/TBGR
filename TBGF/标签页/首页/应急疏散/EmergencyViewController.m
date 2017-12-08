//
//  EmergencyViewController.m
//  TBGF
//
//  Created by 张晓东 on 2017/12/8.
//  Copyright © 2017年 张晓东. All rights reserved.
//

#import "EmergencyViewController.h"

@interface EmergencyViewController ()

@end

@implementation EmergencyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"应急疏散";
    
    [_onkeyHelp setUserInteractionEnabled:YES];
    [_onkeyHelp addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickCategory:)]];
    [_medicalHelp setUserInteractionEnabled:YES];
    [_medicalHelp addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickCategory:)]];
    [_qiangxianHelp setUserInteractionEnabled:YES];
    [_qiangxianHelp addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickCategory:)]];
    [_fanghuaHelp setUserInteractionEnabled:YES];
    [_fanghuaHelp addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickCategory:)]];
    [_tongxinHelp setUserInteractionEnabled:YES];
    [_tongxinHelp addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickCategory:)]];
    [_yunshuHelp setUserInteractionEnabled:YES];
    [_yunshuHelp addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickCategory:)]];
    [_zhianHelp setUserInteractionEnabled:YES];
    [_zhianHelp addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickCategory:)]];
    // Do any additional setup after loading the view from its nib.
}
-(void)clickCategory:(UITapGestureRecognizer* )gestureRecognizer
{
    UIView *viewClicked=[gestureRecognizer view];
    NSMutableString * str=[[NSMutableString alloc] initWithFormat:@"tel:%@",@"110"];
    UIWebView * callWebview = [[UIWebView alloc] init];
    [callWebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:str]]];
    [self.view addSubview:callWebview];
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

@end

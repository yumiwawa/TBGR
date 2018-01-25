//
//  GameViewController.m
//  TBGF
//
//  Created by 张晓东 on 2017/11/29.
//  Copyright © 2017年 张晓东. All rights reserved.
//

#import "GameViewController.h"

@interface GameViewController ()

@end
WKWebView *webView;
@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect viewBounds=[self.view  bounds];
    viewBounds.origin.y=20;
    viewBounds.size.height=viewBounds.size.height-20;
    if(webView==Nil)
    {
            webView = [[WKWebView alloc] initWithFrame:viewBounds];
    }

    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://play.7724.com/olgames/wddkz/?flag=open319"]]];
    [self.view addSubview:webView];

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

@end

//
//  NewsViewController.m
//  TBGF
//
//  Created by 张晓东 on 2018/1/25.
//  Copyright © 2018年 张晓东. All rights reserved.
//

#import "NewsViewController.h"

@interface NewsViewController ()

@end
WKWebView *newsWebView;
@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect viewBounds=[self.view  bounds];
    viewBounds.origin.y=10;
    viewBounds.size.height=viewBounds.size.height-10;
    if(newsWebView==Nil)
    {
        newsWebView = [[WKWebView alloc] initWithFrame:viewBounds];
    }
    
    [newsWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_newsURL]]];
    [self.view addSubview:newsWebView];
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

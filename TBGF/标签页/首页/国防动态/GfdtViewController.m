//
//  GfdtViewController.m
//  TBGF
//
//  Created by 张晓东 on 2017/12/6.
//  Copyright © 2017年 张晓东. All rights reserved.
//

#import "GfdtViewController.h"

@interface GfdtViewController ()

@end

@implementation GfdtViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    [_gfNewsImageView setUserInteractionEnabled:YES];
    [_gfNewsImageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickCategory:)]];
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
-(void)clickCategory:(UITapGestureRecognizer* )gestureRecognizer
{
    UIView *viewClicked=[gestureRecognizer view];
    if (viewClicked==_gfNewsImageView) {
        NSLog(@"guofangxinwen");
        GfnewsTableViewController *gfNewsController = [[GfnewsTableViewController alloc]initWithStyle:UITableViewStyleGrouped];
        UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] init];
        temporaryBarButtonItem.title = @"国防新闻";
        self.navigationItem.backBarButtonItem = temporaryBarButtonItem;
        [self.navigationController pushViewController:gfNewsController animated:NO];
        
    }
}

@end


//
//  RootViewController.h
//  兔子的5s
//
//  Created by 张晓东 on 14-10-10.
//  Copyright (c) 2014年 张晓东. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "BaiduMapViewController.h"
#import "GameViewController.h"
#import "GfdtViewController.h"
#import "SosViewController.h"
#import "EmergencyViewController.h"
@interface RootViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *businessImageView;
@property (strong, nonatomic) IBOutlet UIImageView *emergencyImageView;
@property (strong, nonatomic) IBOutlet UIImageView *peopleImageView;
@property (strong, nonatomic) IBOutlet UIImageView *knowledgeImageView;
@property (strong, nonatomic) IBOutlet UIImageView *dongtai;
@property (strong, nonatomic) IBOutlet UIImageView *gameImageView;
@property (strong, nonatomic) IBOutlet UIImageView *sosImageView;

@end

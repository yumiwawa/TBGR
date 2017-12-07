//
//  SosViewController.h
//  TBGF
//
//  Created by 张晓东 on 2017/12/7.
//  Copyright © 2017年 张晓东. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AFNetworking.h>
@interface SosViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIButton *button110;
@property (strong, nonatomic) IBOutlet UIButton *button119;
@property (strong, nonatomic) IBOutlet UIButton *button120;
@property (strong, nonatomic) IBOutlet UIButton *buttonDear;
@property (strong, nonatomic) IBOutlet UIButton *buttonSos;
@property (strong, nonatomic) IBOutlet UISegmentedControl *chooseSegment;
- (IBAction)onclick110:(id)sender;
- (IBAction)onclick119:(id)sender;
- (IBAction)onclick120:(id)sender;
- (IBAction)onclickDear:(id)sender;
- (IBAction)onclickSos:(id)sender;

@end

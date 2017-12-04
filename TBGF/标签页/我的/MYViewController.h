//
//  MYViewController.h
//  兔子的5s
//
//  Created by 张晓东 on 15/12/19.
//  Copyright © 2015年 张晓东. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyTableViewCell.h"
@interface MYViewController : UIViewController<UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UILabel *nickName;
@property (strong, nonatomic) IBOutlet UITableView *myTableView;
@property (strong, nonatomic) NSArray  *books;
@property (strong, nonatomic) NSArray  *details;
@property (strong, nonatomic) NSArray  *images;



@end

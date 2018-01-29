//
//  MySettingTableViewCell.m
//  TBGF
//
//  Created by 张晓东 on 2018/1/29.
//  Copyright © 2018年 张晓东. All rights reserved.
//

#import "MySettingTableViewCell.h"

@implementation MySettingTableViewCell


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)setFrame:(CGRect)frame{
    
    frame.origin.x += 10;
    frame.origin.y += 10;
    frame.size.height -= 10;
    frame.size.width -= 20;
    [super setFrame:frame];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}
@end

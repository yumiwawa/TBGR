//
//  MyCellViewTableViewCell.m
//  TBGF
//
//  Created by 张晓东 on 2017/12/4.
//  Copyright © 2017年 张晓东. All rights reserved.
//

#import "MyTableViewCell.h"
#define kPagingLabel 100
#define kPagingLabel2 200
@implementation MyTableViewCell

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
- (void)layoutSubviews {
    [super layoutSubviews];
//
    self.imageView.bounds =CGRectMake(0,0,kPagingLabel,kPagingLabel);
    self.imageView.frame =CGRectMake(0,0,kPagingLabel,kPagingLabel);
    CGRect ivFrame =  self.imageView.frame;
        ivFrame.origin.x = 20;
        ivFrame.origin.y = 20;
        self.imageView.frame=ivFrame;
  self.imageView.contentMode =UIViewContentModeScaleToFill;
    
    
    self.textLabel.bounds =CGRectMake(0,0,kPagingLabel2,kPagingLabel);
    self.textLabel.frame =CGRectMake(0,0,kPagingLabel2,kPagingLabel);
    CGRect tmpFrame = self.textLabel.frame;
    tmpFrame.origin.x = 140;
    tmpFrame.origin.y= 20;
    self.textLabel.frame = tmpFrame;
      self.textLabel.contentMode =UIViewContentModeScaleToFill;
    
}
@end

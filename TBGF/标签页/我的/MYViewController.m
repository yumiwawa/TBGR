//
//  MYViewController.m
//  兔子的5s
//
//  Created by 张晓东 on 15/12/19.
//  Copyright © 2015年 张晓东. All rights reserved.
//

#import "MYViewController.h"
@interface MYViewController ()
@end
@implementation MYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //自定义title
    // 设置title
    self.title = @"我";
    _books=[NSArray arrayWithObjects:@"我的收藏",@"信息推送",@"手机绑定",@"实名认证",@"购物车",@"个人设置", nil];
    _details=[NSArray arrayWithObjects:@"你说的对",@"废话",@"当然了",@"未认证",@"地球人都知道",@"厉害小白杨", nil];
     _images=[NSArray arrayWithObjects:@"my_collection.jpg",@"my_message.jpg",@"my_binding.jpg",@"my_identification.jpg",@"my_shoppingcar.jpg",@"my_setting.jpg", nil];
    self.myTableView.dataSource=self;
//    _myTableView.sectionHeaderHeight = 100;
//    _myTableView.sectionFooterHeight = 100;
//    _myTableView.tableHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0.0f,0.0f,_myTableView.bounds.size.width,0.01f)];
    
}
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    //为表格行定义一个静态字符串作为标识符
    static NSString *cellId=@"cellId";
    //从可重用的表格行的队列中取出一个表格行
    UITableViewCell *cell=[_myTableView dequeueReusableCellWithIdentifier:cellId ];
    if(cell==nil)
    {
        if(indexPath.row==3)
        {
            cell=[[MyTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellId];
        }else
        {
             cell=[[MyTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        }
        //边框圆角
        cell.layer.cornerRadius=12;
        cell.layer.masksToBounds=YES;
       
        NSInteger rowNo=indexPath.row;
        cell.textLabel.text=[_books objectAtIndex:rowNo];
        NSString *imageName=[_images objectAtIndex:rowNo];
        cell.imageView.image=[UIImage imageNamed:imageName];
      //  cell.imageView.highlightedImage=[UIImage imageNamed:@"my_icon_selected.png"];
        cell.detailTextLabel.text=[_details objectAtIndex:rowNo];
    }
     return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _books.count;
}

 


@end

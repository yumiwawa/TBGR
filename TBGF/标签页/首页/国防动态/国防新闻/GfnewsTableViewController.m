//
//  GfnewsTableViewController.m
//  TBGF
//
//  Created by 张晓东 on 2017/12/6.
//  Copyright © 2017年 张晓东. All rights reserved.
//
/**
 *  完美解决Xcode NSLog打印不全的宏 亲测目前支持到8.2bate版
 */


#import "GfnewsTableViewController.h"
Boolean _DEBUG=false;
NSDictionary * _myDict;
NSArray * _myArray;
//#ifdef DEBUG
////#define NSLog(format, ...) printf("class: <%p %s:(%d) > method: %s \n%s\n", self, [[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, __PRETTY_FUNCTION__, [[NSString stringWithFormat:(format), ##__VA_ARGS__] UTF8String] )
//#define NSLog(...) printf("%f %s\n",[[NSDate date]timeIntervalSince1970],[[NSString stringWithFormat:__VA_ARGS__]UTF8String]);
//#else
//#define NSLog(format, ...)
//#endif
@interface GfnewsTableViewController ()

@end

@implementation GfnewsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //分割线显示全
    [self.tableView setSeparatorInset:UIEdgeInsetsZero];
    
    NSDictionary *dic = @{
                          @"type":@"1",
                          @"page":@"1"
                          };
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];//创建AFN管理者
    //序列化
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    //接受类型是字符串
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    
    [manager POST:@"http://www.smartbyy.com/renfang/newsline.php" parameters:dic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSString * str = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
      //  NSLog(@"请求到数据%@",str);
     //  NSLog(@"请求到数据长度%@",str.length);

        NSData * getJsonData = [str dataUsingEncoding:NSUTF8StringEncoding];
        NSError * error = nil;
        
       _myDict = [NSJSONSerialization JSONObjectWithData:getJsonData options:NSJSONReadingMutableContainers error:&error];
     NSLog(@"nsdictionary%@",_myDict);
        
        
        _myArray=[NSArray array];
//        NSLog(@"所有的key%@",[_myDict allKeys]);
        NSEnumerator *en=[_myDict objectEnumerator];
        NSObject *value;
        while(value=[en nextObject])
        {
            _myArray=[_myArray arrayByAddingObject:value];
           // NSLog(@"%@",value);
        }
        
         //NSLog(@"myarray%@",_myArray);
        
        self.tableView.reloadData;
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
          NSLog(@"请求失败%@",error);
    }];

//    self.tableView.delegate=self;
//    self.tableView.dataSource=_myDict;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(_myArray!=NULL)
    {
           return [_myArray count];
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //为表格行定义一个静态字符串作为标识符
    static NSString *cellId=@"cellId";
    //从可重用的表格行的队列中取出一个表格行
    MyTableViewCell *cell=[self.tableView dequeueReusableCellWithIdentifier:cellId ];
    if(cell==nil)
    {
        cell=[[MyTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        //边框圆角
        cell.layer.cornerRadius=12;
        cell.layer.masksToBounds=YES;
        [cell.textLabel setNumberOfLines:5];//可以显示3行
    }
    NSInteger rowNo=indexPath.row;
    NSLog(@"rowNo%l",rowNo);
    NSDictionary *object=[_myArray objectAtIndex:rowNo];
    //        NSLog(@"dss%ld",rowNo);
    NSString *title=[object objectForKey:@"rf_title"];
    NSLog(@"title%@",title);
    NSString *picUrl=[object objectForKey:@"rf_picture"];
    NSLog(@"图片路径%@",picUrl);
    cell.textLabel.text=title;
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:picUrl]
                      placeholderImage:[UIImage imageNamed:@"feiji.png"]];
  
    return cell;
    
    
//    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"cellId"];
//
//    // 自定义表格部分。如果只使用默认形式则只需要如下指定UITableViewCell格式，默认表格行的三个属性为textLabel、detailTextLabel、image
//    // 分别对应UITableViewCell显示的标题、纤细的内容以及左边图标，如果使用自定义表格则指定相应的类进行初始化。
//    if (!cell) {
//        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellId"];
//
//    }
//    //根据表格行好indexPath.row对表格行内容进行设定
//    NSUInteger rowNum = indexPath.row;
//    cell.textLabel.text = @"hello baby";
//    cell.textLabel.font = [UIFont boldSystemFontOfSize:17.0];
//    //cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
 
    NSUInteger row=[indexPath row];
    NSDictionary *object=[_myArray objectAtIndex:row];
    //        NSLog(@"dss%ld",rowNo);
    NSString *url=[object objectForKey:@"rf_line"];
    // NSString * str = [[NSString alloc]initWithData:title encoding:NSUTF8StringEncoding];
    NSLog(@"url%@",url);
    
    NewsViewController *newsViewController = [[NewsViewController alloc] init];
   // newsViewController.title=@"hello baby it is you";
    UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] init];
   temporaryBarButtonItem.title = @"国防新闻";
    self.navigationItem.backBarButtonItem = temporaryBarButtonItem;
    newsViewController.newsURL=url;
    [self.navigationController pushViewController:newsViewController animated:NO];
//    [self.navigationController setNavigationBarHidden:YES];
 
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
  //  [self.navigationController pushViewController:detailViewController animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //返回每行的高度
    //CGFloat就是float
    return 140.0;
}
@end

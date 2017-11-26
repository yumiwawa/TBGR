//
//  MAPViewController.h
//  TBGF
//
//  Created by 张晓东 on 2017/11/24.
//  Copyright © 2017年 张晓东. All rights reserved.
//

#ifndef MAPViewController_h
#define MAPViewController_h


#endif /* MAPViewController_h */
#import <UIKit/UIKit.h>
#import <BaiduMapAPI_Map/BMKMapView.h>//只引入所需的单个头文件

@interface MAPViewController : UIViewController
@property (strong,nonatomic) BMKMapView *mapView;

@end

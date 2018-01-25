//
//  RootViewController.m
//  兔子的5s
//
//  Created by 张晓东 on 14-10-10.
//  Copyright (c) 2014年 张晓东. All rights reserved.
//

#import "RootViewController.h"
#import <AlipaySDK/AlipaySDK.h>
#import "APOrderInfo.h"
#import "APRSASigner.h"
@interface RootViewController ()
@end

@implementation RootViewController



-(id)initWithNibName:(NSString *)nibNameOrNil
              bundle:(NSBundle *)nibBundleOrNil
{
    if ([super initWithNibName:nibNameOrNil bundle:nibBundleOrNil] != nil)
    {
        // 为该控制器设置标签项
        self.tabBarItem = [[UITabBarItem alloc]
                           initWithTitle:@"首页"
                           image:[UIImage imageNamed:@"home_icon_normal.png"] tag:1];
        
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // 设置title
    self.title = @"首页";
   
    
    [_dongtai setUserInteractionEnabled:YES];
    [_dongtai addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickCategory:)]];
    
    [_gameImageView setUserInteractionEnabled:YES];
    [_gameImageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickCategory:)]];
    
    [_sosImageView setUserInteractionEnabled:YES];
    [_sosImageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickCategory:)]];
    
//    [_emergencyImageView setUserInteractionEnabled:YES];
//    [_emergencyImageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickCategory:)]];
//
    [_businessImageView setUserInteractionEnabled:YES];
    [_businessImageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickCategory:)]];
    
}
- (void)viewWillAppea:(BOOL)animated
{
   
}
- (void)viewWillDisappear:(BOOL)animated
{
    
    [super viewWillDisappear:animated];
}
-(void)clickCategory:(UITapGestureRecognizer* )gestureRecognizer
{
    UIView *viewClicked=[gestureRecognizer view];
    if (viewClicked==_dongtai) {
        NSLog(@"dongtai");
        GfdtViewController *gfdtController = [[GfdtViewController alloc]init];
       gfdtController.hidesBottomBarWhenPushed = YES;
        UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] init];
        temporaryBarButtonItem.title = @"国防动态";
        self.navigationItem.backBarButtonItem = temporaryBarButtonItem;
        [self.navigationController pushViewController:gfdtController animated:NO];
        
    }else if(viewClicked==_gameImageView)
    {
        NSLog(@"game");
        GameViewController *gameController = [[GameViewController alloc]init];
         gameController.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:gameController animated:NO];
        
    }else if(viewClicked==_sosImageView)
    {
        NSLog(@"sos");
        SosViewController *sosController = [[SosViewController alloc]init];
        sosController.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:sosController animated:NO];
    }else if(viewClicked==_businessImageView)
    {
//        NSLog(@"emergency");
//        EmergencyViewController *emController = [[EmergencyViewController alloc]init];
//        emController.hidesBottomBarWhenPushed = YES;
//        [self.navigationController pushViewController:emController animated:NO];
        [self doAPPay];
    }
}

#pragma mark -
#pragma mark   ==============点击订单模拟支付行为==============
//
// 选中商品调用支付宝极简支付
//
- (void)doAPPay
{
    // 重要说明
    // 这里只是为了方便直接向商户展示支付宝的整个支付流程；所以Demo中加签过程直接放在客户端完成；
    // 真实App里，privateKey等数据严禁放在客户端，加签过程务必要放在服务端完成；
    // 防止商户私密数据泄露，造成不必要的资金损失，及面临各种安全风险；
    /*============================================================================*/
    /*=======================需要填写商户app申请的===================================*/
    /*============================================================================*/
    NSString *appID = @"2017081408193613";
    
    // 如下私钥，rsa2PrivateKey 或者 rsaPrivateKey 只需要填入一个
    // 如果商户两个都设置了，优先使用 rsa2PrivateKey
    // rsa2PrivateKey 可以保证商户交易在更加安全的环境下进行，建议使用 rsa2PrivateKey
    // 获取 rsa2PrivateKey，建议使用支付宝提供的公私钥生成工具生成，
    // 工具地址：https://doc.open.alipay.com/docs/doc.htm?treeId=291&articleId=106097&docType=1
    NSString *rsa2PrivateKey = @"MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQC5sH4OqOHeBr18/IeuDKhVqIk4bRr79IZS57OmHGE3PqHZdC79rn+c8+mFsmNyRM4uUUawzRRA8kuXLqegGeuq28dvJfArsKyMezVv3BtFxsXnpERE5c4+ZUag9xhFOztuoLDQ3Z9y4sMJ3AnPs2+ucTx1dbZRndB0TYUij+JBx6V44s1fnuDu7KflObODJOuHm7bnIJiIOwvtlJYcBeFKuzPkbRlLynh2/zZcwELtn+K643S1dmPifSqveG5/QyJJuFPP+asYW2z/5NSjv51oBB4e9KYGLnHtfjl9sxAS2aHaQV0AMAd+JKX04DMmwT3bCfuR2NWmzv9Vj+RHe3d/AgMBAAECggEAOOb3yiBAjtw75vgvz8s7LnymCC+PDFSjcPZl2+podBhyWoO6/qwhmQQ5tGm1BchF8nWflwBRS5G0TlDSt0IaMNKGq+3RSmIqjiYXev7VMK236cMx1Hcjm4VHfn4Z5uU+0ijV5jtz6C3LHNNcAlT3TVqP72KyCxK0VV+IA85ZxFQW149j8stj7TLU6+ncfXmrW/+gxUZjzDEi85gcSMBGGsCB5vEKTjZLIyqwCUOk8nUAGCZbuFgjVYIb2bvFvdHIfKqBekZd8AsvdiedWh1aUOUfmSNOO4B8UFCF0ykuhaQVTJlmzU4U5fQmkrCrwKJAGScbxgxAVj1FPVtbnKcUCQKBgQDpRiFmfQfQSQVI3lgYD3BplkKdlJoJrEgdc3nbCRLztbNQa2xdT1JJKcOeRLxTySSw/OmnXnIggvH7JbAmYr5kg3htm1Kmp7dbiZAKp6usvMLB3XSKYKY5FvrIRTlpJ7MWQsuvYQRJYx+lxwKAE7mZHjeCUx3YlFQnqPS8Tf9dvQKBgQDLx5mzcRxxBXjNI7sRTq98wkkxh8SpNneJrSScftiU5nbX/psfwSmOY6G1YyNaYe+HsaF96qE/cFn6MZCBz1qIIP8Ni8fjr/4OaU19v2sPoOYpTWhN77YJlkUofVxGJRQTU6ljWSCFxpHCnNoWIM83K877WkoR4cc3jMgdleVH6wKBgGrg+e6mPI0+15ACZ2Rmtn96G/1tF4J1D/mGbf9gUfGdf5HKFjVOYYop+3mpTowo7Ym15ywLBslElbAXHXUI6ujMn8HAV4cJ8uWayodHOU4EkksWtw2rqJ0hnTdjGCHI0bHSWtZ44ejp5Jck7k1WPEQeZxpsEJGprEEblT4tkmIVAoGBAJT7pwmkBrEy2PDR0LCEoJRLzwthQYyc/6Qua/fmXR3vqK+du3fp1yH9AXsFshEgTOkeGv1eDum8kGv01LuzB3NC/HXA3jE+uDV9E2R+EB3q+prztvBT8vjrXkCN9mpqLVU78zlpLffgBy0LU/6dmiGx66+kgUa1lNquGJhYwLplAoGBANnyawlCaQOtPHOfkDpCFW1QWh3V3M4IQT5LhCJNvbSlNpa4Itb5V4LwOz9rqjpoyIxnWd/IO2dReqppnYFnRs2+XSdgwy9b8vg8evNOUJSsIk7CLrf3J1PvKBiff0zIMEC4+2YOwF2lgZJggBLVQc0xJ6x2Vor7sH68Yb1SCYwI";
    NSString *rsaPrivateKey = @"";
    /*============================================================================*/
    /*============================================================================*/
    /*============================================================================*/
    
    //partner和seller获取失败,提示
    if ([appID length] == 0 ||
        ([rsa2PrivateKey length] == 0 && [rsaPrivateKey length] == 0))
    {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示"
                                                                       message:@"缺少appId或者私钥,请检查参数设置"
                                                                preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"知道了"
                                                         style:UIAlertActionStyleDefault
                                                       handler:^(UIAlertAction *action){
                                                           
                                                       }];
        [alert addAction:action];
        [self presentViewController:alert animated:YES completion:^{ }];
        return;
    }
    
    /*
     *生成订单信息及签名
     */
    //将商品信息赋予AlixPayOrder的成员变量
    APOrderInfo* order = [APOrderInfo new];
    
    // NOTE: app_id设置
    order.app_id = appID;
    
    // NOTE: 支付接口名称
    order.method = @"alipay.trade.app.pay";
    
    // NOTE: 参数编码格式
    order.charset = @"utf-8";
    
    // NOTE: 当前时间点
    NSDateFormatter* formatter = [NSDateFormatter new];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    order.timestamp = [formatter stringFromDate:[NSDate date]];
    
    // NOTE: 支付版本
    order.version = @"1.0";
    
    // NOTE: sign_type 根据商户设置的私钥来决定
    order.sign_type = (rsa2PrivateKey.length > 1)?@"RSA2":@"RSA";
    
    // NOTE: 商品数据
    order.biz_content = [APBizContent new];
    order.biz_content.body = @"我是测试数据";
    order.biz_content.subject = @"购买人防设备从中钛互联";
    order.biz_content.out_trade_no = [self generateTradeNO]; //订单ID（由商家自行制定）
    order.biz_content.timeout_express = @"30m"; //超时时间设置
    order.biz_content.total_amount = [NSString stringWithFormat:@"%.2f", 0.01]; //商品价格
    
    //将商品信息拼接成字符串
    NSString *orderInfo = [order orderInfoEncoded:NO];
    NSString *orderInfoEncoded = [order orderInfoEncoded:YES];
    NSLog(@"orderSpec = %@",orderInfo);
    
    // NOTE: 获取私钥并将商户信息签名，外部商户的加签过程请务必放在服务端，防止公私钥数据泄露；
    //       需要遵循RSA签名规范，并将签名字符串base64编码和UrlEncode
    NSString *signedString = nil;
    APRSASigner* signer = [[APRSASigner alloc] initWithPrivateKey:((rsa2PrivateKey.length > 1)?rsa2PrivateKey:rsaPrivateKey)];
    if ((rsa2PrivateKey.length > 1)) {
        signedString = [signer signString:orderInfo withRSA2:YES];
    } else {
        signedString = [signer signString:orderInfo withRSA2:NO];
    }
    
    // NOTE: 如果加签成功，则继续执行支付
    if (signedString != nil) {
        //应用注册scheme,在AliSDKDemo-Info.plist定义URL types
        NSString *appScheme = @"alisdkdemo";
        
        // NOTE: 将签名成功字符串格式化为订单字符串,请严格按照该格式
        NSString *orderString = [NSString stringWithFormat:@"%@&sign=%@",
                                 orderInfoEncoded, signedString];
        
        // NOTE: 调用支付结果开始支付
        [[AlipaySDK defaultService] payOrder:orderString fromScheme:appScheme callback:^(NSDictionary *resultDic) {
            NSLog(@"reslut = %@",resultDic);
        }];
    }
}



#pragma mark -
#pragma mark   ==============产生随机订单号==============

- (NSString *)generateTradeNO
{
    static int kNumber = 15;
    NSString *sourceStr = @"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    NSMutableString *resultStr = [[NSMutableString alloc] init];
    srand((unsigned)time(0));
    for (int i = 0; i < kNumber; i++)
    {
        unsigned index = rand() % [sourceStr length];
        NSString *oneStr = [sourceStr substringWithRange:NSMakeRange(index, 1)];
        [resultStr appendString:oneStr];
    }
    return resultStr;
}

@end

//
//  BaseViewController.m
//  Chowder
//
//  Created by YangY on 16/8/8.
//  Copyright © 2016年 YangY. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60) forBarMetrics:UIBarMetricsDefault];
    self.view.backgroundColor = APP_ViewBackground_Color;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
-(BOOL)hidesBottomBarWhenPushed{
    return YES;
}
- (void)showHudWithText:(NSString *)text {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.label.text = text;
    hud.label.numberOfLines = 0;
    [hud hideAnimated:YES afterDelay:2.f];
}

@end

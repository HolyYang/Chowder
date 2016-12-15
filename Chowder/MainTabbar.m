//
//  MainTabbar.m
//  Chowder
//
//  Created by YangY on 16/8/8.
//  Copyright © 2016年 YangY. All rights reserved.
//

#import "MainTabbar.h"
#import "MianTableVC.h"
#import "ToolTableVC.h"

@implementation MainTabbar
- (void)viewDidLoad {
    [super viewDidLoad];
    

    MianTableVC * main = [[MianTableVC alloc] init];
    UINavigationController *na1 = [[UINavigationController alloc] initWithRootViewController:main];
    na1.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"首页" image:[[UIImage imageNamed:@"main"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"main_select"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];

    
    ToolTableVC * tool = [[ToolTableVC alloc] init];
    UINavigationController *na2 = [[UINavigationController alloc] initWithRootViewController:tool];
    na2.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"工具" image:[[UIImage imageNamed:@"tool"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"tool_select"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    
    self.viewControllers = @[na1,na2];
}

@end

//
//  BaseTableViewController.m
//  Chowder
//
//  Created by YangY on 16/8/8.
//  Copyright © 2016年 YangY. All rights reserved.
//

#import "BaseTableViewController.h"
#import "MJRefresh.h"
@interface BaseTableViewController ()

@end

@implementation BaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = APP_ViewBackground_Color;
    self.tableView.tableFooterView = [UIView new];
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60) forBarMetrics:UIBarMetricsDefault];
}
- (void)showHudWithText:(NSString *)text {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.label.text = text;
    hud.label.numberOfLines = 0;
    [hud hideAnimated:YES afterDelay:2.f];
}
- (void)setMBProgressHUD{
    self.hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    //大背景颜色
    self.hud.backgroundView.style = MBProgressHUDBackgroundStyleBlur;
    self.hud.backgroundView.color = UIColorFromRGB(0xe6e6e6);
}
- (void)doSomeWork {
    // Simulate by just waiting.
    sleep(3.);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
-(BOOL)hidesBottomBarWhenPushed{
    return YES;
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] init];
    }
    return cell;
}
#pragma mark MJRefresh

- (void)setCanRefresh:(BOOL)canRefresh
{
    if (canRefresh) {
        self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self refresh];
        }];
    }
}

- (void)setCanLoadMore:(BOOL)canLoadMore
{
    if (canLoadMore) {
        self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            [self loadMore];
        }];
    }
}
- (void)refresh
{
    
}
-(void)loadMore
{
    
}

- (void)startRefresh
{
    [self.tableView.mj_header beginRefreshing];
}

- (void)startLoadMore
{
    [self.tableView.mj_footer beginRefreshing];
}

- (void)endRefresh
{
    [self.tableView.mj_header endRefreshing];
    
}

- (void)endLoadMore
{
    [self.tableView.mj_footer endRefreshing];
}
@end

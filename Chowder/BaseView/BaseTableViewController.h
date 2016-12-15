//
//  BaseTableViewController.h
//  Chowder
//
//  Created by YangY on 16/8/8.
//  Copyright © 2016年 YangY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseTableViewController : UITableViewController
@property(nonatomic,strong)MBProgressHUD *hud;

@property (nonatomic, assign) BOOL canRefresh;
@property (nonatomic, assign) BOOL canLoadMore;

- (void)startRefresh;
- (void)startLoadMore;
- (void)refresh;
- (void)endRefresh;
- (void)loadMore;
- (void)endLoadMore;

- (void)setMBProgressHUD;
- (void)showHudWithText:(NSString *)text;
@end

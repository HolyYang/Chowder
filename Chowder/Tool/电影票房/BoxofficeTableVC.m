//
//  BoxofficeTableVC.m
//  Chowder
//
//  Created by YangY on 16/8/8.
//  Copyright © 2016年 YangY. All rights reserved.
//

#import "BoxofficeTableVC.h"
#import "BoxofficeTableViewCell.h"
@interface BoxofficeTableVC ()
@property(nonatomic,strong)NSArray * dataArr;
@end

@implementation BoxofficeTableVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"电影实时票房";
    [self setMBProgressHUD];
    [self setData];
}

- (void)setData{
    [MobAPI sendRequest:[MOBABoxOfficeRequest boxofficeDayRequestByArea:@"CN"]
               onResult:^(MOBAResponse *response) {
                   if (response.error) {
                       [self showHudWithText:response.error.userInfo[@"error_message"]];
                   }else{
                       self.dataArr = response.responder[@"result"];
                       [self.tableView reloadData];
                       [self.hud hideAnimated:YES];
                   }
               }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 86;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BoxofficeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BoxofficeTableViewCell"];
    if (!cell) {
        cell = [[BoxofficeTableViewCell alloc] init];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell setInfo:self.dataArr[indexPath.row]];
    return cell;
}

@end

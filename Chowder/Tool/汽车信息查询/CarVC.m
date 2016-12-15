//
//  CarVC.m
//  Chowder
//
//  Created by YangY on 16/8/17.
//  Copyright © 2016年 YangY. All rights reserved.
//

#import "CarVC.h"
#import "CarInfoVC.h"
@interface CarVC ()
@property(nonatomic,strong)NSArray * dataArr;
@end

@implementation CarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"汽车信息查询";
    [self setMBProgressHUD];
    [self setData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)setData{
    [MobAPI sendRequest:[MOBACarRequest carBrandRequest] onResult:^(MOBAResponse *response) {
        if (response.error) {
            [self showHudWithText:response.error.userInfo[@"error_message"]];
        }else{
            self.dataArr = response.responder[@"result"];
            [self.tableView reloadData];
            [self.hud hideAnimated:YES];
        }
    }];

//    [MobAPI sendRequest:[MOBACarRequest carSeriesDetailRequestByCid:@"1060133"] onResult:^(MOBAResponse *response) {
//    }];
}

#pragma mark - Table view data source
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataArr.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray * arr = [NSArray arrayWithArray:self.dataArr[section][@"son"]];
    return arr.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray * arr = [NSArray arrayWithArray:self.dataArr[indexPath.section][@"son"]];
    NSDictionary * dic = arr[indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CarCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"CarCell"];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = dic[@"car"];
    cell.textLabel.textColor = APP_Title_Color;
    cell.textLabel.font = APP_FONT_15;
    cell.detailTextLabel.text = dic[@"type"];
    cell.detailTextLabel.textColor = APP_Details_Color;
    cell.detailTextLabel.font = APP_FONT_14;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UILabel * headerLable = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, kScreen_Width-40, 30)];
    headerLable.backgroundColor = APP_ViewBackground_Color;
    headerLable.text = self.dataArr[section][@"name"];
    return headerLable;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray * arr = [NSArray arrayWithArray:self.dataArr[indexPath.section][@"son"]];
    NSDictionary * dic = arr[indexPath.row];
    CarInfoVC * carInfoVC =[[CarInfoVC alloc] init];
    carInfoVC.type = dic[@"type"];
    carInfoVC.title = dic[@"type"];
    [self.navigationController pushViewController:carInfoVC animated:YES];
}
@end

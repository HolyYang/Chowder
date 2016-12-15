//
//  CarInfoVC.m
//  Chowder
//
//  Created by YangY on 16/8/17.
//  Copyright © 2016年 YangY. All rights reserved.
//

#import "CarInfoVC.h"
#import "CarInfoDetailsVC.h"
@interface CarInfoVC ()
@property(nonatomic,strong)NSArray * dataArr;

@end

@implementation CarInfoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"车型信息";
    [self setMBProgressHUD];
    [self setData];
}

- (void)setData{
        [MobAPI sendRequest:[MOBACarRequest carSeriesNameRequestByName:self.type] onResult:^(MOBAResponse *response) {
            NSLog(@"%@",response.responder);
            if (response.error) {
                [self showHudWithText:response.error.userInfo[@"error_message"]];
                [self.hud hideAnimated:YES];
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
    return 40;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CarInfoCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"CarInfoCell"];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = self.dataArr[indexPath.row][@"seriesName"];
    cell.textLabel.textColor = APP_Title_Color;
    cell.textLabel.font = APP_FONT_15;
    cell.detailTextLabel.text = self.dataArr[indexPath.row][@"guidePrice"];
    cell.detailTextLabel.textColor = APP_Details_Color;
    cell.detailTextLabel.font = APP_FONT_14;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    CarInfoDetailsVC * carInfoDetailsVC =[[CarInfoDetailsVC alloc] init];
    carInfoDetailsVC.carId = self.dataArr[indexPath.row][@"carId"];
    [self.navigationController pushViewController:carInfoDetailsVC animated:YES];
}
@end

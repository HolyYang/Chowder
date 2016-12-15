//
//  CarInfoDetailsVCViewController.m
//  Chowder
//
//  Created by YangY on 2016/11/9.
//  Copyright © 2016年 YangY. All rights reserved.
//

#import "CarInfoDetailsVC.h"

@interface CarInfoDetailsVC (){
    NSArray * _titleArr;
    NSArray * _titleInfoArr;
}
@property(nonatomic,strong)NSDictionary * dataDic;
@end

@implementation CarInfoDetailsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"车型详细信息";
    [self setMBProgressHUD];
    
    _titleArr = @[@"车型基本配置信息",@"空调/冰箱配置信息",@"车身配置信息",@"底盘配置信息",@"操控配置信息",@"发动机配置信息",@"外部配置信息",@"玻璃/后视镜配置信息",@"内部配置信息",@"灯光配置信息",@"多媒体配置信息",@"安全装置信息",@"座椅配置信息",@"高科技配置信息",@"变速箱信息",@"轮制动信息"];
    _titleInfoArr = @[@"baseInfo",@"airConfig",@"carbody",@"chassis",@"controlConfig",@"engine",@"exterConfig",@"glassConfig",@"interConfig",@"lightConfig",@"mediaConfig",@"safetyDevice",@"seatConfig",@"techConfig",@"transmission",@"wheelInfo"];
    [self setData];
}

- (void)setData{
    
    [MobAPI sendRequest:[MOBACarRequest carSeriesDetailRequestByCid:self.carId] onResult:^(MOBAResponse *response) {
        NSLog(@"%@",response.responder);
        if (response.error) {
            [self showHudWithText:response.error.userInfo[@"error_message"]];
            [self.hud hideAnimated:YES];
        }else{
            self.dataDic = response.responder[@"result"][0];
            [self.tableView reloadData];
            UIImageView * ima = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 240, 180)];
            [ima sd_setImageWithURL:NSURL(self.dataDic[@"carImage"])];
            self.tableView.tableHeaderView = ima;
            [self.hud hideAnimated:YES];
        }
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
#pragma mark - Table view data source
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 16;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSString * str = _titleInfoArr[section];
    return [self.dataDic[str] count];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CarInfodetailsCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"CarInfodetailsCell"];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    NSString * str = _titleInfoArr[indexPath.section];
    NSArray * arr = [NSArray arrayWithArray:self.dataDic[str]];
    if (arr.count != 0) {
        cell.textLabel.text = arr[indexPath.row][@"name"];
        cell.textLabel.textColor = APP_Title_Color;
        cell.textLabel.font = APP_FONT_15;
        if ([arr[indexPath.row][@"value"] isEqualToString:@"1"]) {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
            cell.detailTextLabel.text = @"";
            
        }else{
            cell.detailTextLabel.text = arr[indexPath.row][@"value"];
            cell.accessoryType = UITableViewCellAccessoryNone;
        }
        cell.detailTextLabel.textColor = APP_Details_Color;
        cell.detailTextLabel.font = APP_FONT_14;
    }
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UILabel * headerLable = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, kScreen_Width-40, 30)];
    headerLable.backgroundColor = APP_ViewBackground_Color;
    headerLable.text = _titleArr[section];
    return headerLable;
}

@end

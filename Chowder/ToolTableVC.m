//
//  ToolTableVC.m
//  Chowder
//
//  Created by YangY on 16/8/8.
//  Copyright © 2016年 YangY. All rights reserved.
//

#import "ToolTableVC.h"
#import "BoxofficeTableVC.h"
#import "MobileAddressVC.h"
#import "IDcardVC.h"
#import "WeatherVC.h"
#import "HealthVC.h"
#import "CarVC.h"
@interface ToolTableVC ()
@property(nonatomic,strong)NSArray * dataArr;
@end

@implementation ToolTableVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"工具";
    self.dataArr = @[@"电影实时票房",@"身份证号码",@"手机号码归属地",@"天气查询",@"健康查询",@"汽车信息查询"];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
-(BOOL)hidesBottomBarWhenPushed{
    return NO;
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] init];
    }
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    cell.textLabel.text = self.dataArr[indexPath.row];
    cell.imageView.image = IMAGE(@"mulusuoyin");
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:{
            BoxofficeTableVC * boxoffice = [[BoxofficeTableVC alloc] init];
            [self.navigationController pushViewController:boxoffice animated:YES];
            break;
        }
        case 1:{
            IDcardVC * idcard = [[IDcardVC alloc] init];
            [self.navigationController pushViewController:idcard animated:YES];
            break;
        }
        case 2:{
            MobileAddressVC * mobileAddress = [[MobileAddressVC alloc] init];
            [self.navigationController pushViewController:mobileAddress animated:YES];
            break;
        }
        case 3:{
            WeatherVC * weatherVC = [[WeatherVC alloc] init];
            [self.navigationController pushViewController:weatherVC animated:YES];
            break;
        }
        case 4:{
            HealthVC * healthVC = [[HealthVC alloc] init];
            [self.navigationController pushViewController:healthVC animated:YES];
        }
        case 5:{
            CarVC * carVC = [[CarVC alloc] init];
            [self.navigationController pushViewController:carVC animated:YES];
        }
        default:
            break;
    }
}
@end

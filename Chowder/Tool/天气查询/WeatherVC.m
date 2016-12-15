//
//  WeatherVC.m
//  Chowder
//
//  Created by YangY on 16/8/11.
//  Copyright © 2016年 YangY. All rights reserved.
//

#import "WeatherVC.h"
#import "CityPicker.h"
#import "WeatherCell.h"
#import "WeatherView.h"
@interface WeatherVC ()
@property(nonatomic,strong)CityPicker * picker;
@property(nonatomic,strong)NSArray * cityArr;
@property(nonatomic,strong)NSDictionary * data;
@property(nonatomic,strong)NSArray * futureWeather;
@end

@implementation WeatherVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"天气查询";
    self.data = [[NSDictionary alloc] init];
    self.futureWeather = [[NSArray alloc] init];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [MobAPI sendRequest:[MOBAWeatherRequest citiesRequest]
               onResult:^(MOBAResponse *response) {
                   self.cityArr = [NSArray arrayWithArray:response.responder[@"result"]];
                   UIBarButtonItem * right = [[UIBarButtonItem alloc] initWithImage:IMAGE(@"liebiao") style:UIBarButtonItemStylePlain target:self action:@selector(clickRightBarButton)];
                   self.navigationItem.rightBarButtonItem = right;
               }];
    [self setinfoWithProvinceName:@"北京" countyName:@"朝阳"];
}
-(void)clickRightBarButton{
    [self.picker showPickerWithData:self.cityArr];
}
- (CityPicker *)picker {
    if (!_picker) {
        _picker = [[CityPicker alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        __weak __typeof(self) wself = self;
        _picker.completion = ^(NSString *provinceName,NSString *cityName,NSString *countyName) {
            [wself setinfoWithProvinceName:provinceName countyName:countyName];
        };
        [self.navigationController.view addSubview:_picker];
    }
    return _picker;
}
-(void)setinfoWithProvinceName:(NSString *)provinceName countyName:(NSString *)countyName{
    [self setMBProgressHUD];

    [MobAPI sendRequest:[MOBAWeatherRequest searchRequestByCity:countyName province:provinceName]
               onResult:^(MOBAResponse *response) {
                   if (response.error) {
                       [self showHudWithText:response.error.userInfo[@"error_message"]];
                   }else{
                       self.data = [response.responder[@"result"] firstObject];
                       self.futureWeather = self.data[@"future"];
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
    return self.futureWeather.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 112;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WeatherCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WeatherCell"];
    if (!cell) {
        cell = [[WeatherCell alloc] init];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell setInfo:self.futureWeather[indexPath.row]];
    return cell;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (self.data[@"date"]) {
        return [WeatherView setHeaderViewWithInfo:self.data];
    }
    return nil;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (self.data[@"date"]) {
        return 180;
    }
    return 0;
}
@end

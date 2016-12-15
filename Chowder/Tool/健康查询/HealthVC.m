//
//  HealthVC.m
//  Chowder
//
//  Created by YangY on 16/8/17.
//  Copyright © 2016年 YangY. All rights reserved.
//

#import "HealthVC.h"
#import "HealthCell.h"
#import "HealthDetailsVC.h"
@interface HealthVC ()<UISearchBarDelegate>
@property(nonatomic,strong)NSMutableArray * dataArr;
@property(nonatomic,strong)NSString * key;
@property(nonatomic,assign)int page;
@end

@implementation HealthVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"健康查询";
    self.dataArr = [[NSMutableArray alloc] init];
    self.page = 1;
    self.key = @"身体";
    [self setMBProgressHUD];
    [self setCanRefresh:YES];
    [self setCanLoadMore:YES];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"搜索" style:UIBarButtonItemStylePlain target:self action:@selector(search)];
}
- (void)search{
    UISearchBar * search = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 200, 30)];
    search.placeholder = @"请输入关键词";
    search.delegate = self;
    self.navigationItem.titleView = search;
}
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [searchBar resignFirstResponder];
    self.title = searchBar.text;
    self.key = searchBar.text;
    [self.dataArr removeAllObjects];
    self.page = 1;
    [self setData];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self setData];
}
-(void)refresh{
    [self.dataArr removeAllObjects];
    self.page = 1;
    [self setData];
}
-(void)loadMore{
    self.page++;
    [self setData];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (void)setData{
    [MobAPI sendRequest:[MOBAHealthRequest healthRequestWithKeyword:self.key page:[NSString stringWithFormat:@"%d",self.page] size:nil]
               onResult:^(MOBAResponse *response) {
                   [self endRefresh];
                   [self endLoadMore];
                   if (response.error) {
                       [self showHudWithText:response.error.userInfo[@"error_message"]];
                   }else{
                       [self.dataArr addObjectsFromArray:response.responder[@"result"][@"list"]];
                       [self.tableView reloadData];
                       [self.hud hideAnimated:YES];
                   }
               }];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 88;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HealthCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HealthCell"];
    if (!cell) {
        cell = [[HealthCell alloc] init];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell setInfo:self.dataArr[indexPath.row]];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    HealthDetailsVC* healthDetailVC = [[HealthDetailsVC alloc] init];
    healthDetailVC.info = self.dataArr[indexPath.row];
    [self.navigationController pushViewController:healthDetailVC animated:YES];
}

@end

//
//  MianTableVC.m
//  Chowder
//
//  Created by YangY on 16/8/8.
//  Copyright © 2016年 YangY. All rights reserved.
//

#import "MianTableVC.h"
#import "LoginVC.h"
@interface MianTableVC ()
@property(nonatomic,strong)NSString * uid;
@property(nonatomic,strong)NSString * token;
@property (strong, nonatomic) AFHTTPSessionManager *manager;
@end

@implementation MianTableVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView removeFromSuperview];
    self.title = @"首页";

    
    LoginVC * login = [[LoginVC alloc] init];
    UINavigationController * na = [[UINavigationController alloc] initWithRootViewController:login];
    [self presentViewController:na animated:YES completion:^{
        
    }];
    
    
//    [MobAPI sendRequest:[MOBAUserCenterRequest userRigisterRequestByUsername:@"888888" password:@"123456" email:@"yangyangvip7456@163.com"]
//               onResult:^(MOBAResponse *response) {
//                   if (response.error) {
//                       [self showHudWithText:response.error.userInfo[@"error_message"]];
//                       NSLog(@"%@",response.error);
//                   }else{
//                       NSLog(@"%@",response.responder);
//                   }
//               }];
    //token:cf2c3115a17c664c9d0db674b63193b0
    //uid:dd27143cc8e63697ab25ed546f9b7f979896796b
    self.uid = @"dd27143cc8e63697ab25ed546f9b7f979896796b";
//    [MobAPI sendRequest:[MOBAUserCenterRequest userLoginRequestByUsername:@"888888" password:@"123456"]
//               onResult:^(MOBAResponse *response) {
//                   if (response.error) {
//                       [self showHudWithText:response.error.userInfo[@"error_message"]];
//                       NSLog(@"%@",response.error);
//                   }else{
//                       NSLog(@"%@",response.responder);
//                       self.token = [NSString stringWithFormat:@"%@",response.responder[@"result"][@"token"]];
//                   }
//               }];
    
//        [MobAPI sendRequest:[MOBAUserCenterRequest userProfilePutRequestByToken:@"cfa41188d89affbe85b1064148911444" uid:self.uid item:@"bW9iaWxl" value:@"e21vYmlsZTE6IjE0NzgyODY3MjM4In0"]
//                   onResult:^(MOBAResponse *response) {
//                       if (response.error) {
//                           [self showHudWithText:response.error.userInfo[@"error_message"]];
//                           NSLog(@"用户资料插入error%@",response.error);
//                       }else{
//                           NSLog(@"用户资料插入%@",response.responder);
//                       }
//                   }];
//    [MobAPI sendRequest:[MOBAUserCenterRequest userProfilePutRequestByToken:@"cfa41188d89affbe85b1064148911444" uid:self.uid item:@"bmFtZQ==" value:@"JXU2NzY4JXU5NjMz"]
//               onResult:^(MOBAResponse *response) {
//                   if (response.error) {
//                       [self showHudWithText:response.error.userInfo[@"error_message"]];
//                       NSLog(@"用户资料插入error%@",response.error);
//                   }else{
//                       NSLog(@"用户资料插入%@",response.responder);
//                   }
//               }];
//    [MobAPI sendRequest:[MOBAUserCenterRequest userProfileQueryRequestByUid:self.uid item:nil]
//               onResult:^(MOBAResponse *response) {
//            
//                   if (response.error) {
//                       [self showHudWithText:response.error.userInfo[@"error_message"]];
//                       NSLog(@"用户资料查询error%@",response.error);
//                   }else{
//                       NSLog(@"用户资料查询%@",response.responder);
//                   }
//               
//               
//               }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
-(BOOL)hidesBottomBarWhenPushed{
    return NO;
}

@end

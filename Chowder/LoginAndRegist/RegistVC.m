//
//  RegistVC.m
//  Chowder
//
//  Created by YangY on 16/8/10.
//  Copyright © 2016年 YangY. All rights reserved.
//

#import "RegistVC.h"

@interface RegistVC ()
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UIButton *registe;

@end

@implementation RegistVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"注册";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (IBAction)regist:(id)sender {
    [MobAPI sendRequest:[MOBAUserCenterRequest userRigisterRequestByUsername:self.userName.text password:self.password.text email:self.email.text]
               onResult:^(MOBAResponse *response) {
                   if (response.error) {
                       [self showHudWithText:response.error.userInfo[@"error_message"]];
                       NSLog(@"%@",response.error);
                   }else{
                       NSLog(@"%@",response.responder);
                   }
               }];
}

@end

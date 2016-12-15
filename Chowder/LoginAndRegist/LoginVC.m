//
//  LoginVC.m
//  Chowder
//
//  Created by YangY on 16/8/10.
//  Copyright © 2016年 YangY. All rights reserved.
//

#import "LoginVC.h"
#import "RegistVC.h"
#import "ForgetPassword.h"
@interface LoginVC ()
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UIButton *registe;
@property (weak, nonatomic) IBOutlet UIButton *login;

@end

@implementation LoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"登录";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"注册" style:UIBarButtonItemStylePlain target:self action:@selector(regis)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
-(void)regis{
    RegistVC * regist = [[RegistVC alloc] init];
    [self.navigationController pushViewController:regist animated:YES];
}
- (IBAction)forgetPassword:(id)sender {
    ForgetPassword * forgetPassword = [[ForgetPassword alloc] init];
    [self.navigationController pushViewController:forgetPassword animated:YES];
}
- (IBAction)login:(id)sender {
//        [MobAPI sendRequest:[MOBAUserCenterRequest userLoginRequestByUsername:self.userName.text password:self.password.text]
//                   onResult:^(MOBAResponse *response) {
//                       if (response.error) {
//                           [self showHudWithText:response.error.userInfo[@"error_message"]];
//                           NSLog(@"%@",response.error);
//                       }else{
//                           NSLog(@"%@",response.responder);
//                       }
//                   }];
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}


@end

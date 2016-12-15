//
//  MobileAddressVC.m
//  Chowder
//
//  Created by YangY on 16/8/9.
//  Copyright © 2016年 YangY. All rights reserved.
//

#import "MobileAddressVC.h"

@interface MobileAddressVC ()<UITextFieldDelegate>

@end

@implementation MobileAddressVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"查询手机号码归属地";
    self.textField.keyboardType = UIKeyboardTypeNumberPad;
    self.infoLable.textColor = APP_Title_Color;
}
- (IBAction)clickSearch:(id)sender {
    [MobAPI sendRequest:[MOBAPhoneRequest addressRequestByPhone:self.textField.text]
               onResult:^(MOBAResponse *response) {
                   [self.textField resignFirstResponder];
                   if (response.error) {
                       [self showHudWithText:response.error.userInfo[@"error_message"]];
                   }else{
                       NSDictionary * info = [NSDictionary dictionaryWithDictionary:response.responder[@"result"]];
                       NSString * str = [NSString stringWithFormat:@"查询手机号码 : %@\n开卡省份 : %@\n开卡城市 : %@\n城市邮编 : %@\n运营商信息 : %@",self.textField.text,info[@"province"],info[@"city"],info[@"zipCode"],info[@"operator"]];
                       NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
                       paragraphStyle.lineSpacing = 12;// 字体的行间距
                       NSDictionary *attributes = @{
                                                    NSFontAttributeName:[UIFont systemFontOfSize:14],
                                                    NSParagraphStyleAttributeName:paragraphStyle
                                                    };
                       self.infoLable.attributedText = [[NSAttributedString alloc] initWithString:str attributes:attributes];
                   }
               }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end

//
//  IDcardVC.m
//  Chowder
//
//  Created by YangY on 16/8/9.
//  Copyright © 2016年 YangY. All rights reserved.
//

#import "IDcardVC.h"

@interface IDcardVC ()

@end

@implementation IDcardVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"身份证号码查询";
    self.textField.keyboardType = UIKeyboardTypeNumberPad;
    self.infoLable.textColor = APP_Title_Color;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (IBAction)clickSearch:(id)sender {
    [self.textField resignFirstResponder];
    [MobAPI sendRequest:[MOBAIdRequest idcardRequestByCardno:self.textField.text]
               onResult:^(MOBAResponse *response) {
                   [self.textField resignFirstResponder];
                   if (response.error) {
                       [self showHudWithText:response.error.userInfo[@"error_message"]];
                   }else{
                       NSDictionary * info = [NSDictionary dictionaryWithDictionary:response.responder[@"result"]];
                       NSString * str = [NSString stringWithFormat:@"查询身份证号码 : %@\n性别 : %@\n生日 : %@\n身份证所属地区 : %@",self.textField.text,info[@"sex"],info[@"birthday"],info[@"area"]];
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
@end

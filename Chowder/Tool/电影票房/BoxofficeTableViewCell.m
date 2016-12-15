//
//  BoxofficeTableViewCell.m
//  Chowder
//
//  Created by YangY on 16/8/9.
//  Copyright © 2016年 YangY. All rights reserved.
//

#import "BoxofficeTableViewCell.h"

@implementation BoxofficeTableViewCell
- (id)init {
    self = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] objectAtIndex:0];
    if (self) {
        
    }
    return self;
}
-(void)setInfo:(NSDictionary *)info{
    self.name.text = info[@"name"];
    self.days.text = [NSString stringWithFormat:@"上映天数 : %@",info[@"days"]];
    NSArray *sum = [[info[@"sum"] stringValue] componentsSeparatedByString:@"."];
    NSArray *cur = [[info[@"cur"] stringValue] componentsSeparatedByString:@"."];
    self.num.text = [NSString stringWithFormat:@"总票房(今日票房) : %@(%@)万元",sum[0],cur[0]];
    self.name.textColor = APP_Title_Color;
    self.days.textColor = APP_Details_Color;
    self.num.textColor = APP_Details_Color;

}
- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end

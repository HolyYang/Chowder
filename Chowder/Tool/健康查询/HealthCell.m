//
//  HealthCell.m
//  Chowder
//
//  Created by YangY on 16/8/17.
//  Copyright © 2016年 YangY. All rights reserved.
//

#import "HealthCell.h"

@implementation HealthCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (id)init {
    self = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] objectAtIndex:0];
    if (self) {
        
    }
    return self;
}
-(void)setInfo:(NSDictionary *)info{
    self.title.text = info[@"title"];
    self.content.text = info[@"content"];
    self.title.textColor = APP_Title_Color;
    self.content.textColor = APP_Details_Color;

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

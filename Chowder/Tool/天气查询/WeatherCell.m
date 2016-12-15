//
//  WeatherCell.m
//  Chowder
//
//  Created by YangY on 16/8/15.
//  Copyright © 2016年 YangY. All rights reserved.
//

#import "WeatherCell.h"

@implementation WeatherCell

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
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setInfo:(NSDictionary *)info{
    self.data.text = info[@"date"];
    self.week.text = info[@"week"];
    self.dayTime.text = [NSString stringWithFormat:@"白天:%@",info[@"dayTime"]];
    self.night.text = [NSString stringWithFormat:@"夜间:%@",info[@"night"]];
    self.temperature.text = info[@"temperature"];
    self.wind.text = info[@"wind"];
}
@end

//
//  WeatherView.m
//  Chowder
//
//  Created by YangY on 16/8/15.
//  Copyright © 2016年 YangY. All rights reserved.
//

#import "WeatherView.h"

@implementation WeatherView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
+(UIView *)setHeaderViewWithInfo:(NSDictionary *)info{
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, 180)];
    view.backgroundColor = APP_ViewBackground_Color;
    UILabel * city = [[UILabel alloc] initWithFrame:CGRectMake(0, 12, kScreen_Width/2, 18)];
    city.text = [NSString stringWithFormat:@"%@",info[@"city"]];
    city.textAlignment = NSTextAlignmentCenter;
    city.font = [UIFont systemFontOfSize:18];
    city.textColor = APP_Details_Color;
    [view addSubview:city];
    
    UILabel * temperature = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(city.frame)+12, kScreen_Width/2, 100)];
    temperature.text = [NSString stringWithFormat:@"%@",info[@"temperature"]];
    temperature.font = [UIFont systemFontOfSize:40];
    temperature.textAlignment = NSTextAlignmentCenter;
    temperature.textColor = APP_Title_Color;
    [view addSubview:temperature];
    
    UILabel * date = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(temperature.frame)+12, kScreen_Width/2, 14)];
    date.text = [NSString stringWithFormat:@"%@    %@",info[@"date"],info[@"week"]];
    date.font = APP_FONT_14;
    date.textAlignment = NSTextAlignmentCenter;
    date.textColor = APP_Details_Color;
    [view addSubview:date];
    
    UILabel * other = [[UILabel alloc] initWithFrame:CGRectMake(kScreen_Width/2, 0, kScreen_Width/2, 180)];
    other.text = [NSString stringWithFormat:@"天气：%@\n风向：%@\n%@\n空气质量：%@\n空气指数：%@\n日出/日落：%@/%@",info[@"weather"],info[@"wind"],info[@"humidity"],info[@"airCondition"],info[@"pollutionIndex"],info[@"sunrise"],info[@"sunset"]];
    other.font = APP_FONT_14;
    other.numberOfLines = 0;
    other.textColor = APP_Details_Color;
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = 12;// 字体的行间距
    NSDictionary *attributes = @{
                                 NSFontAttributeName:[UIFont systemFontOfSize:14],
                                 NSParagraphStyleAttributeName:paragraphStyle
                                 };
    other.attributedText = [[NSAttributedString alloc] initWithString:other.text attributes:attributes];
    [view addSubview:other];

    return view;
}
@end

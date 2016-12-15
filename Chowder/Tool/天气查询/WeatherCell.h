//
//  WeatherCell.h
//  Chowder
//
//  Created by YangY on 16/8/15.
//  Copyright © 2016年 YangY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeatherCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *data;
@property (weak, nonatomic) IBOutlet UILabel *week;
@property (weak, nonatomic) IBOutlet UILabel *dayTime;
@property (weak, nonatomic) IBOutlet UILabel *night;
@property (weak, nonatomic) IBOutlet UILabel *temperature;
@property (weak, nonatomic) IBOutlet UILabel *wind;
@property(nonatomic,strong)NSDictionary * info;
@end

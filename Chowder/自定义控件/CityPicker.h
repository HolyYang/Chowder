//
//  CityPicker.h
//  Chowder
//
//  Created by YangY on 16/8/10.
//  Copyright © 2016年 YangY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CityPicker : UIView

@property (nonatomic,copy) void (^completion)(NSString *provinceName,NSString *cityName,NSString *countyName);

- (void)showPickerWithData:(NSArray *)data;//显示 省 市 县名
@end

//
//  HealthCell.h
//  Chowder
//
//  Created by YangY on 16/8/17.
//  Copyright © 2016年 YangY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HealthCell : UITableViewCell
@property(nonatomic,strong)NSDictionary * info;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *content;

@end

//
//  BoxofficeTableViewCell.h
//  Chowder
//
//  Created by YangY on 16/8/9.
//  Copyright © 2016年 YangY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BoxofficeTableViewCell : UITableViewCell
@property(nonatomic,strong)NSDictionary * info;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *num;
@property (weak, nonatomic) IBOutlet UILabel *days;

@end

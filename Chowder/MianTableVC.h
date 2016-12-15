//
//  MianTableVC.h
//  Chowder
//
//  Created by YangY on 16/8/8.
//  Copyright © 2016年 YangY. All rights reserved.
//

#import "BaseTableViewController.h"
#import "AFNetworking.h"
typedef void(^RequestCallBack)(AFHTTPRequestOperation *operation,id requestObj,NSError *error);
@interface MianTableVC : BaseTableViewController
@property(nonatomic,strong)NSString * urll;

@end

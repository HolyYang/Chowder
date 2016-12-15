//
//  HealthDetailsVC.m
//  Chowder
//
//  Created by YangY on 16/8/17.
//  Copyright © 2016年 YangY. All rights reserved.
//

#import "HealthDetailsVC.h"

@interface HealthDetailsVC ()
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation HealthDetailsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.info[@"title"];
    self.textView.text = self.info[@"content"];
    self.view.backgroundColor = [UIColor whiteColor];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end

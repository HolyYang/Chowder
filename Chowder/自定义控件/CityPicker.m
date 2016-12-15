//
//  CityPicker.m
//  Chowder
//
//  Created by YangY on 16/8/10.
//  Copyright © 2016年 YangY. All rights reserved.
//

#import "CityPicker.h"
#define SHAddressPickerViewHeight 216

@interface CityPicker()<UIPickerViewDelegate,UIPickerViewDataSource>
@property (nonatomic,strong) UIView *backView;
@property (nonatomic,strong) UIView *headView;
@property (strong, nonatomic) UIPickerView *pickView;
@property (strong,nonatomic) NSArray *firstAry;//一级数据源
@property (strong,nonatomic) NSArray *secondAry;//二级数据源
@property (strong,nonatomic) NSArray *thirdAry;//三级数据源
@end
@implementation CityPicker
- (instancetype)initWithFrame:(CGRect)frame {
    self =  [super initWithFrame:frame];
    if (self) {
        [self internalConfig];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self internalConfig];
    }
    return self;
}

- (void)internalConfig {
    _backView = [[UIView alloc] initWithFrame:self.frame];
    _backView.backgroundColor = [UIColor blackColor];
    _backView.alpha = 0.6;
    [self addSubview:_backView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hide)];
    [_backView addGestureRecognizer:tap];
    
    self.backgroundColor = [UIColor clearColor];
    [self addSubview:self.pickView];
    
    _headView = [[UIView alloc] initWithFrame:CGRectMake(0, self.pickView.frame.origin.y - 43.5, self.frame.size.width, 43.5)];
    _headView.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1.0];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(10, 0, 43.5, 43.5);
    button.backgroundColor = [UIColor clearColor];
    [button setTitleColor:APP_Title_Color forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:16];
    [button setTitle:@"取消" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(cancleButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [_headView addSubview:button];
    
    button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(self.frame.size.width - 42, 0, 32, 43.5);
    button.backgroundColor = [UIColor clearColor];
    [button setTitleColor:APP_Title_Color forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:16];
    [button setTitle:@"确定" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(completionButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [_headView addSubview:button];
    
    [self addSubview:_headView];
}

- (void)showPickerWithData:(NSArray *)data{
    _firstAry = [NSArray arrayWithArray:data];
    _secondAry = [NSArray arrayWithArray:_firstAry[0][@"city"]];
    _thirdAry = [NSArray arrayWithArray:_secondAry[0][@"district"]];
    [_pickView reloadAllComponents];
    [self show];
}

- (void)show {
    self.hidden = NO;
    _backView.alpha = 0.6;
    [UIView animateWithDuration:0.5 animations:^{
        self.pickView.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height - SHAddressPickerViewHeight, self.frame.size.width, SHAddressPickerViewHeight);
        _headView.frame = CGRectMake(0, self.pickView.frame.origin.y - 43.5, self.frame.size.width, 43.5);
    }];
}

- (void)hide {
    _backView.alpha = 0;
    [UIView animateWithDuration:0.5 animations:^{
        self.pickView.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height+44, self.frame.size.width, SHAddressPickerViewHeight);
        _headView.frame = CGRectMake(0, self.pickView.frame.origin.y, self.frame.size.width, 43.5);
    } completion:^(BOOL finished) {
        self.hidden = YES;
    }];
}

#pragma mark - UIPickerViewDataSource,UIPickerViewDelegate

//设置列数
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 3;
}

//返回数组总数
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == 0) {
        return _firstAry.count;
    } else if (component == 1) {
        return _secondAry.count;
    } else {
        return _thirdAry.count;
    }
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (component == 0) {
        return _firstAry[row][@"province"];
    } else if (component == 1) {
        return _secondAry[row][@"city"];
    } else {
        return _thirdAry[row][@"district"];
    }
    return @"请选择";
}

//触发事件
- (void)pickerView:(UIPickerView *)thePickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (component == 0) {
        _secondAry = _firstAry[row][@"city"];
        _thirdAry = _secondAry[0][@"district"];
        [_pickView reloadComponent:1];
        [_pickView reloadComponent:2];
    } else if (component == 1) {
        _thirdAry = _secondAry[row][@"district"];
        [_pickView reloadComponent:2];
    }
}

- (void)completionButtonAction:(UIButton *)sender {
    
    NSString *provinceName = _firstAry[[self.pickView selectedRowInComponent:0]][@"province"];
    NSString *cityName = _secondAry[[self.pickView selectedRowInComponent:1]][@"city"];
    NSString *countyName = _thirdAry[[self.pickView selectedRowInComponent:2]][@"district"];
    if (_completion) {
        _completion(provinceName,cityName,countyName);
    }
    [self hide];
}

- (void)cancleButtonAction:(UIButton *)sender {
    [self hide];
}

#pragma mark - 懒加载

- (UIPickerView*)pickView {
    if (!_pickView) {
        _pickView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height + 44, self.frame.size.width, SHAddressPickerViewHeight)];
        _pickView.delegate = self;
        _pickView.dataSource = self;
        _pickView.backgroundColor = [UIColor whiteColor];
    }
    return _pickView;
}
@end

//
//  ExampleVC6.m
//  JCFrameLayout
//
//  Created by abc on 17/4/1.
//  Copyright © 2017年 jackcat. All rights reserved.
//

#import "ExampleVC6.h"

#import "JCFrameLayout.h"

@interface ExampleVC6 ()
/**
 *  <#注释#>
 **/
@property (nonatomic,strong) UIView *yellowView;
/**
 *  <#注释#>
 **/
@property (nonatomic,strong) UIView *redView;
@end

@implementation ExampleVC6

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _yellowView = [[UIView alloc]init];
    _yellowView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:_yellowView];
    
    [_yellowView jc_makeLayout:^(JCFrameMake *make) {
        make.width.height.jc_equalTo(200);
        make.center.equalTo(self.view);
    }];
    
//    _redView = [[UIView alloc]init];
//    _redView.backgroundColor = [UIColor redColor];
//    [_yellowView addSubview:_redView];
//    
//    [_redView jc_makeLayout:^(JCFrameMake *make) {
//        make.center.equalTo(_yellowView);
//        make.size.jc_equalTo(CGSizeMake(100, 100));
//    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [_yellowView jc_makeLayout:^(JCFrameMake *make) {
        make.width.height.jc_equalTo(200);
        make.center.equalTo(self.view).jc_offset(CGPointMake(0, 50));
    }];
//    [_redView jc_updateLayout];
}

@end

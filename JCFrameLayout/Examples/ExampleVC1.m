//
//  ExampleVC1.m
//  JCFrameLayout
//
//  Created by abc on 17/3/31.
//  Copyright © 2017年 jackcat. All rights reserved.
//

#import "ExampleVC1.h"

#import "JCFrameLayout.h"


#define radomColor [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0  blue:arc4random_uniform(256)/255.0  alpha:1]

@interface ExampleVC1 ()

@end

@implementation ExampleVC1

- (void)viewDidLoad {
    [super viewDidLoad];
    
self.view.backgroundColor = [UIColor whiteColor];
    
    UIView *leftView = [[UIView alloc]init];
    leftView.backgroundColor = radomColor;
    [self.view addSubview:leftView];
    leftView.jc_debug_key = @"leftView";
    [leftView jc_makeLayout:^(JCFrameMake *make) {
        make.width.jc_equalTo(50);
        make.top.jc_equalTo(50 + 64);
        make.bottom.jc_equalTo(-50);
        make.left.jc_equalTo(0);
    }];
    
    
    UIView *rightView = [[UIView alloc]init];
    rightView.backgroundColor = radomColor;
    [self.view addSubview:rightView];
    rightView.jc_debug_key = @"rightView";
    [rightView jc_makeLayout:^(JCFrameMake *make) {
        make.width.jc_equalTo(50);
        make.top.jc_equalTo(50 + 64);
        make.bottom.jc_equalTo(-50);
        make.right.jc_equalTo(0);
    }];
    
    UIView *topView = [[UIView alloc]init];
    topView.backgroundColor = radomColor;
    [self.view addSubview:topView];
    topView.jc_debug_key = @"topView";
    [topView jc_makeLayout:^(JCFrameMake *make) {
        make.top.jc_equalTo(64);
        make.height.jc_equalTo(50);
        make.left.jc_equalTo(50);
        make.right.jc_equalTo(-50);
    }];
    
    UIView *bottomView = [[UIView alloc]init];
    bottomView.backgroundColor = radomColor;
    [self.view addSubview:bottomView];
    bottomView.jc_debug_key = @"bottomView";
    [bottomView jc_makeLayout:^(JCFrameMake *make) {
        make.height.jc_equalTo(50);
        make.left.jc_equalTo(50);
        make.right.jc_equalTo(-50);
        make.bottom.jc_equalTo(0);
    }];
    
    
    UIView *centerView = [[UIView alloc]init];
    centerView.backgroundColor = radomColor;
    [self.view addSubview:centerView];
    centerView.jc_debug_key = @"centerView";
    [centerView jc_makeLayout:^(JCFrameMake *make) {
        make.left.equalTo(leftView.jc_right);
        make.top.equalTo(topView.jc_bottom);
        make.right.equalTo(rightView.jc_left);
        make.bottom.equalTo(bottomView.jc_top);
    }];
    NSLog(@"centerView.frame = %@",[NSValue valueWithCGRect:centerView.frame]);
    [self.view sendSubviewToBack:centerView];
    
}

@end

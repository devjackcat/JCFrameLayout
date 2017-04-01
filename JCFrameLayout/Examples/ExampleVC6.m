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

@end

@implementation ExampleVC6

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIView *yellowView = [[UIView alloc]init];
    yellowView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:yellowView];
    
    [yellowView jc_makeLayout:^(JCFrameMake *make) {
        make.width.height.jc_equalTo(200);
        make.center.equalTo(self.view);
    }];
    
    UIView *redView = [[UIView alloc]init];
    redView.backgroundColor = [UIColor redColor];
    [yellowView addSubview:redView];
    
    [redView jc_makeLayout:^(JCFrameMake *make) {
        make.width.height.jc_equalTo(100);
        
//        make.center.equalTo(yellowView);
//        make.centerX.equalTo(yellowView.jc_left);
//        make.centerY.equalTo(yellowView.jc_bottom);
        
//        make.top.equalTo(yellowView.jc_bottom);
//        make.right.equalTo(yellowView.jc_right);
        
        make.left.equalTo(yellowView.jc_right);
        make.bottom.equalTo(yellowView.jc_bottom);
        
    }];
}

@end

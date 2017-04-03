//
//  ExampleVC6.m
//  JCFrameLayout
//
//  Created by abc on 17/4/1.
//  Copyright © 2017年 jackcat. All rights reserved.
//

#import "DevTest.h"

#import "JCFrameLayout.h"

@interface DevTest ()
/**
 *  <#注释#>
 **/
@property (nonatomic,strong) UIView *yellowView;
/**
 *  <#注释#>
 **/
@property (nonatomic,strong) UIView *redView;
@end

@implementation DevTest

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
    
    [_yellowView addObserver:self forKeyPath:@"frame" options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:nil];

    _redView = [[UIView alloc]init];
    _redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:_redView];
    
    [_redView jc_makeLayout:^(JCFrameMake *make) {
        make.center.equalTo(_yellowView);
        make.size.jc_equalTo(CGSizeMake(100, 100));
    }];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    if (object == self.yellowView && [keyPath isEqualToString: @"frame"]) {
        NSLog(@"--change = %@",change);
    }else{
        NSLog(@"--non--change = %@",change);
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    [UIView animateWithDuration:1 animations:^{
//        [_yellowView jc_makeLayout:^(JCFrameMake *make) {
//            make.width.height.jc_equalTo(200);
//            make.center.equalTo(self.view).jc_offset(CGPointMake(0, 50));
//        }];
//        [_redView jc_updateLayout];
//    }];
//    _yellowView.jc_x_value = 110;
//    _yellowView.jc_y_value = 110;
//    _yellowView.jc_width_value = 200;
//    _yellowView.jc_height_value = 200;
//    _yellowView.center = CGPointMake(100, 100);
}

@end

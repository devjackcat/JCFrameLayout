//
//  SecondViewController.m
//  JCFrameLayout
//
//  Created by abc on 17/3/27.
//  Copyright © 2017年 jackcat. All rights reserved.
//

#import "SecondViewController.h"


#import "JCFrameLayout.h"


@interface SecondViewController ()
/**
 *  <#注释#>
 **/
@property (nonatomic,strong) UIView *redView;

/**
 *  <#注释#>
 **/
@property (nonatomic,strong) UIView *greenView;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.redView = [[UIView alloc]init];
    self.redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.redView];
    
    self.greenView = [[UIView alloc]init];
    self.greenView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.greenView];
    
    self.redView.jc_debug_key = @"redView";
    [self.redView jc_makeLayout:^(JCFrameMake *make) {
        make.center.jc_equalTo(CGPointMake(100, 100));
        make.size.jc_equalTo(CGSizeMake(100, 100));
    }];
    
    self.greenView.jc_debug_key = @"greenView";
    [self.greenView jc_makeLayout:^(JCFrameMake *make) {
        make.center.equalTo(self.redView);
        make.size.equalTo(self.redView).multipliedBy(2);
    }];
    
    [self.view bringSubviewToFront:self.redView];
    
    NSLog(@"self.redView.frame = %@",[NSValue valueWithCGRect:self.redView.frame]);
    NSLog(@"self.greenView.frame = %@",[NSValue valueWithCGRect:self.greenView.frame]);
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end

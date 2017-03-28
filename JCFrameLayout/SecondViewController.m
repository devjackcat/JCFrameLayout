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
    
    [self.redView jc_makeLayout:^(JCFrameMake *make) {
//        maker.left.jc_equalTo(@50);
//        maker.right.jc_equalTo(@-50);
        make.width.jc_equalTo(@100);
        make.centerX.jc_equalTo(@200);
        
//        maker.top.jc_equalTo(@50);
//        maker.bottom.jc_equalTo(@-50);
        make.height.jc_equalTo(@100);
        make.centerY.jc_equalTo(@200);
    }];
    
    [self.greenView jc_makeLayout:^(JCFrameMake *make) {
        make.left.jc_equalTo(@50);
        make.width.jc_equalTo(@100);

        make.top.jc_equalTo(@50);
        make.height.jc_equalTo(@100);
    }];
    
    NSLog(@"self.redView.frame = %@",[NSValue valueWithCGRect:self.redView.frame]);
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end

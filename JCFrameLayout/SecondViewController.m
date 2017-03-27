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
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.redView = [[UIView alloc]init];
    self.redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.redView];
    
    [self.redView jc_makeLayout:^(JCFrameMaker *maker) {
        maker.left.jc_equalTo(@150);
        maker.left.jc_equalTo(@50);
        maker.top.jc_equalTo(@150);
        maker.width.jc_equalTo(@100);
        maker.height.jc_equalTo(@100);
        maker.width.jc_equalTo(@50);
    }];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end

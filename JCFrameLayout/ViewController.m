//
//  ViewController.m
//  JCFrameLayout
//
//  Created by abc on 17/3/27.
//  Copyright © 2017年 jackcat. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"

#import "SecondViewController.h"

@interface ViewController ()



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    SecondViewController *vc = [[SecondViewController alloc]init];
    [self presentViewController:vc animated:YES completion:nil];
}


@end

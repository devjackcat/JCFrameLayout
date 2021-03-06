//
//  ExampleVC4.m
//  JCFrameLayout
//
//  Created by abc on 17/3/31.
//  Copyright © 2017年 jackcat. All rights reserved.
//

#import "ExampleVC4.h"

#import "JCFrameLayout.h"

#define radomColor [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0  blue:arc4random_uniform(256)/255.0  alpha:1]


@interface ExampleVC4 ()

@end

@implementation ExampleVC4

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    int column = 50;
    
    CGFloat padding = 2;
    
    CGFloat width = ([UIScreen mainScreen].bounds.size.width - padding * (column + 1))/column;
    CGFloat height = width;
    
    for (int i = 0; i<5000; i++) {
        int row = i / column;
        int col = i % column;
        
        CGFloat x = col * (width + padding) + padding;
        CGFloat y = row * (height + padding) + padding + 64;
        
        UIView *view = [[UIView alloc]init];
        [self.view addSubview:view];
        view.backgroundColor = radomColor;
        [view jc_makeLayout:^(JCFrameMake *make) {
            make.width.jc_equalTo(width);
            make.height.jc_equalTo(height);
            make.left.jc_equalTo(x);
            make.top.jc_equalTo(y);
        }];
    }
}


@end

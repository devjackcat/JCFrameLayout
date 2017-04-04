//
//  ExampleVC2.m
//  JCFrameLayout
//
//  Created by abc on 17/3/31.
//  Copyright © 2017年 jackcat. All rights reserved.
//

#import "ExampleVC2.h"

#import "JCFrameLayout.h"

#define radomColor [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0  blue:arc4random_uniform(256)/255.0  alpha:1]


@interface ExampleVC2 ()

@end

@implementation ExampleVC2

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    //列数
    int column = 3;
    //内间距
    CGFloat padding = 20;
    //每个方块尺寸
    CGFloat width = (JC_SCREEN_WIDTH - padding * (column + 1))/column;
    CGFloat height = width;
    
    for (int i = 0; i< 9; i++) {
        
        //计算X左边
        int col = i % column;
        CGFloat x = col * (width + padding) + padding;
        
        //计算Y左边
        int row = i / column;
        CGFloat y = row * (height + padding) + padding + 64;
        
        UIView *view = [[UIView alloc]init];
        [self.view addSubview:view];
        view.backgroundColor = radomColor;
        
        //使用JCFrameLayout进行布局
        [view jc_makeLayout:^(JCFrameMake *make) {
            make.width.jc_equalTo(width);
            make.height.jc_equalTo(height);
            make.left.jc_equalTo(x);
            make.top.jc_equalTo(y);
        }];
    }
    
}

@end

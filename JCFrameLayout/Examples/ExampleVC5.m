//
//  ExampleVC5.m
//  JCFrameLayout
//
//  Created by abc on 17/3/31.
//  Copyright © 2017年 jackcat. All rights reserved.
//

#import "ExampleVC5.h"

#import "JCFrameLayout.h"

#define radomColor [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0  blue:arc4random_uniform(256)/255.0  alpha:1]


@interface ExampleVC5 ()

@end

@implementation ExampleVC5

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    int column = 50;
    int count = 5000;
    
    CGFloat padding = 2;
    
    CGFloat width = ([UIScreen mainScreen].bounds.size.width - padding * (column + 1))/column;
    CGFloat height = width;
    
    for (int idx = 0; idx<count; idx++) {
        
        int row = idx / column;
        int col = idx % column;
        
        UIView *view = [[UIView alloc]init];
        view.jc_debug_key = [NSString stringWithFormat:@"view_%zd",idx];
        view.backgroundColor = radomColor;
        
        if (row == 0 && col == 0) {
            [view jc_makeLayout:^(JCFrameMake *make) {
                make.left.jc_equalTo(padding);
                make.top.jc_equalTo(padding + 64);
                make.width.jc_equalTo(width);
                make.height.jc_equalTo(height);
            }];
        }else{
            UIView *lastView = [self.view.subviews lastObject];
            
            if (col == 0) { //在新的一行
                [view jc_makeLayout:^(JCFrameMake *make) {
                    make.top.equalTo(lastView.jc_bottom).jc_offset(padding);
                    make.left.jc_equalTo(padding);
                    make.width.jc_equalTo(width);
                    make.height.jc_equalTo(height);
                }];
            }else{ //同一行
                [view jc_makeLayout:^(JCFrameMake *make) {
                    make.left.equalTo(lastView.jc_right).jc_offset(padding);
                    make.top.equalTo(lastView);
                    make.width.jc_equalTo(width);
                    make.height.jc_equalTo(height);
                }];
            }
        }
        [self.view addSubview:view];
    }

}


@end

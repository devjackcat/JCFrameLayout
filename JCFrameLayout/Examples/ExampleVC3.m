//
//  ExampleVC3.m
//  JCFrameLayout
//
//  Created by abc on 17/3/31.
//  Copyright © 2017年 jackcat. All rights reserved.
//

#import "ExampleVC3.h"

#import "JCFrameLayout.h"

#define radomColor [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0  blue:arc4random_uniform(256)/255.0  alpha:1]

@interface ExampleVC3 ()

@end

@implementation ExampleVC3

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
        
    for (int idx = 0; idx < 9; idx++) {
        
        //计算所处行数
        int row = idx / column;
        //计算所处列数
        int col = idx % column;
        
        UIView *view = [[UIView alloc]init];
        view.jc_debug_key = [NSString stringWithFormat:@"view_%zd",idx];
        view.backgroundColor = radomColor;
        
        if (row == 0 && col == 0) {
            //如果是第一行第一个列，则相对屏幕左上角进行布局
            [view jc_makeLayout:^(JCFrameMake *make) {
                make.left.jc_equalTo(padding);
                make.top.jc_equalTo(padding + 64);
                make.width.jc_equalTo(width);
                make.height.jc_equalTo(height);
            }];
        }else{
            //其他方块相对于前一个方块进行布局
            //取出前一个方块
            UIView *lastView = [self.view.subviews lastObject];
            
            if (col == 0) { //和前一个方块在同一行
                [view jc_makeLayout:^(JCFrameMake *make) {
                    make.top.equalTo(lastView.jc_bottom).jc_offset(padding);
                    make.left.jc_equalTo(padding);
                    make.width.jc_equalTo(width);
                    make.height.jc_equalTo(height);
                }];
            }else{ //和前一个方块不再同一行
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

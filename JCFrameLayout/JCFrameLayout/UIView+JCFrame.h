//
//  UIView+JCFrame.h
//  JCFrameLayout
//
//  Created by abc on 17/3/27.
//  Copyright © 2017年 jackcat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (JCFrame)

- (void)setJc_x_value:(CGFloat)value;
- (CGFloat)jc_x_value;

- (void)setJc_y_value:(CGFloat)value;
- (CGFloat)jc_y_value;

- (void)setJc_width_value:(CGFloat)value;
- (CGFloat)jc_width_value;

- (void)setJc_height_value:(CGFloat)value;
- (CGFloat)jc_height_value;

- (void)setJc_centerX_value:(CGFloat)value;
- (CGFloat)jc_centerX_value;

- (void)setJc_centerY_value:(CGFloat)value;
- (CGFloat)jc_centerY_value;

- (void)setJc_center_value:(CGPoint)value;
- (CGPoint)jc_center_value;

- (void)setJc_size_value:(CGSize)value;
- (CGSize)jc_size_value;

- (NSMutableArray *)jc_frames;
@end

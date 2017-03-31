//
//  UIView+JCFrame.h
//  JCFrameLayout
//
//  Created by abc on 17/3/27.
//  Copyright © 2017年 jackcat. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "JCFrameAttribute.h"

@interface UIView (JCFrame)

#pragma mark - getter and setter
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

#pragma mark - getter only
- (CGFloat)jc_right_value;
- (CGFloat)jc_bottom_value;

- (JCFrameAttribute*)jc_left;
- (JCFrameAttribute*)jc_top;
- (JCFrameAttribute*)jc_right;
- (JCFrameAttribute*)jc_bottom;
- (JCFrameAttribute*)jc_width;
- (JCFrameAttribute*)jc_height;
- (JCFrameAttribute*)jc_centerX;
- (JCFrameAttribute*)jc_centerY;
- (JCFrameAttribute*)jc_center;
- (JCFrameAttribute*)jc_size;

//给UIView设置一个key值，用于方便调试
@property (nonatomic,copy) NSString *jc_debug_key;

- (NSMutableArray *)jc_frames;

@end

//
//  UIView+JCFrame.m
//  JCFrameLayout
//
//  Created by abc on 17/3/27.
//  Copyright © 2017年 jackcat. All rights reserved.
//

#import "UIView+JCFrame.h"
#import <objc/runtime.h>

static char debugkey;

@implementation UIView (JCFrame)

#pragma mark - getter and setter
- (void)setJc_x_value:(CGFloat)value{
    CGRect frame = self.frame;
    frame.origin.x = value;
    self.frame = frame;
}
- (CGFloat)jc_x_value{
    return self.frame.origin.x;
}

- (void)setJc_y_value:(CGFloat)value{
    CGRect frame = self.frame;
    frame.origin.y = value;
    self.frame = frame;
}
- (CGFloat)jc_y_value{
    return self.frame.origin.y;
}

- (void)setJc_width_value:(CGFloat)value{
    CGRect frame = self.frame;
    frame.size.width = value;
    self.frame = frame;
}
- (CGFloat)jc_width_value{
    return self.frame.size.width;
}

- (void)setJc_height_value:(CGFloat)value{
    CGRect frame = self.frame;
    frame.size.height = value;
    self.frame = frame;
}
- (CGFloat)jc_height_value{
    return self.frame.size.height;
}

- (void)setJc_centerX_value:(CGFloat)value{
    CGPoint center = self.center;
    center.x = value;
    self.center = center;
}
- (CGFloat)jc_centerX_value{
    return self.center.x;
}

- (void)setJc_centerY_value:(CGFloat)value{
    CGPoint center = self.center;
    center.y = value;
    self.center = center;
}
- (CGFloat)jc_centerY_value{
    return self.center.y;
}

- (void)setJc_center_value:(CGPoint)value{
    self.center = value;
}
- (CGPoint)jc_center_value{
    return self.center;
}

- (void)setJc_size_value:(CGSize)value{
    CGRect frame = self.frame;
    frame.size = value;
    self.frame = frame;
}
- (CGSize)jc_size_value{
    return self.frame.size;
}

#pragma mark - getter only
- (CGFloat)jc_right_value{
    return self.jc_x_value + self.jc_width_value;
}
- (CGFloat)jc_bottom_value{
    return self.jc_y_value + self.jc_height_value;
}



- (JCFrameAttribute*)jc_left{
    return [[JCFrameAttribute alloc]initWithView:self frameType:(JCFrameTypeLeft)];
}
- (JCFrameAttribute*)jc_top{
    return [[JCFrameAttribute alloc]initWithView:self frameType:(JCFrameTypeTop)];
}
- (JCFrameAttribute*)jc_right{
    return [[JCFrameAttribute alloc]initWithView:self frameType:(JCFrameTypeRight)];
}
- (JCFrameAttribute*)jc_bottom{
    return [[JCFrameAttribute alloc]initWithView:self frameType:(JCFrameTypeBottom)];
}
- (JCFrameAttribute*)jc_width{
    return [[JCFrameAttribute alloc]initWithView:self frameType:(JCFrameTypeWidth)];
}
- (JCFrameAttribute*)jc_height{
    return [[JCFrameAttribute alloc]initWithView:self frameType:(JCFrameTypeHeight)];
}
- (JCFrameAttribute*)jc_centerX{
    return [[JCFrameAttribute alloc]initWithView:self frameType:(JCFrameTypeCenterX)];
}
- (JCFrameAttribute*)jc_centerY{
    return [[JCFrameAttribute alloc]initWithView:self frameType:(JCFrameTypeCenterY)];
}
- (JCFrameAttribute*)jc_center{
    return [[JCFrameAttribute alloc]initWithView:self frameType:(JCFrameTypeCenter)];
}
- (JCFrameAttribute*)jc_size{
    return [[JCFrameAttribute alloc]initWithView:self frameType:(JCFrameTypeSize)];
}

- (void)setJc_debug_key:(NSString *)key{
    objc_setAssociatedObject(self, &debugkey, key, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
- (NSString *)jc_debug_key{
    NSString *key = objc_getAssociatedObject(self, &debugkey);
    return key ? key : @"";
}

- (NSMutableArray *)jc_frames{
    static char key;
    NSMutableArray *array = (NSMutableArray*)objc_getAssociatedObject(self, &key);
    if (!array) {
        array = [NSMutableArray array];
        objc_setAssociatedObject(self, &key, array, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return array;
}
@end

//
//  JCFrameExecutor.m
//  JCFrameLayout
//
//  Created by abc on 17/3/29.
//  Copyright © 2017年 jackcat. All rights reserved.
//

#import "JCFrameExecutor.h"

#import "UIView+JCFrame.h"

@implementation JCFrameExecutor

//### 属性优先级设定
//
//  ####属性的分类
//      * 复合属性(Center、Size)
//      * 简单属性(除Center、Size之外的属性)
//      * 中心属性(CenterX、CenterY)
//      * 边界属性(Left、Top、Right、Bottom)
//      * 尺寸属性(With、Height)
//
//  ####优先级
//      1. 复合属性 > 简单属性
//      2. 中心属性 > 尺寸属性 > 边界属性
//      3. Left > Right
//      4. Top > Bottom
//
//  ####可能的情况
//      1. center and size
//      2. center and width and height
//      3. centerX and centerY and size
//      4. centerX and top and size
//      5. centerX and bottom and size
//      6. centerY and left and size
//      7. centerY and right and size
//      8. left and top and size
//      9. left and bottom and size
//      10. right and top and size
//      11. right and bottom and size
//      --------

//      12. centerX and centerY and width and height
//      13. centerX and top and width and height
//      14. centerX and bottom and width and height
//      15. centerY and left and width and height
//      16. centerY and right and width and height

//      含有2条边界值，2个尺寸
//      22. left and top and width and height
//      23. left and bottom and width and height
//      24. right and top and width and height
//      25. right and bottom and width and height

//      含有3条边距值,1个尺寸值
//      18. left and right and top and height
//      19. left and right and bottom and height
//      20. left and top and bottom and width
//      21. right and top and bottom and width

//      含有4条边距值
//      17. left and right and top and bottom

+ (void)executeWithView:(UIView*)view
                 frames:(NSArray<JCFrame*>*)frames
             frameTypes:(JCFrameType)frameTypes{
    
    //      1. center and size
    if ((frameTypes & JCFrameTypeCenter)
        &&(frameTypes & JCFrameTypeSize)) {
        
        JCFrame *center = [self filterFrameIn:frames frameType:(JCFrameTypeCenter)];
        JCFrame *size = [self filterFrameIn:frames frameType:(JCFrameTypeSize)];
        view.jc_size_value = ((NSValue*)size.value).CGSizeValue;
        view.jc_center_value = ((NSValue*)center.value).CGPointValue;
        return;
    }
    
    //      2. center and width and height
    if ((frameTypes & JCFrameTypeCenter)
        &&(frameTypes & JCFrameTypeWidth)
        &&(frameTypes & JCFrameTypeHeight)) {
        
        JCFrame *center = [self filterFrameIn:frames frameType:(JCFrameTypeCenter)];
        JCFrame *width = [self filterFrameIn:frames frameType:(JCFrameTypeWidth)];
        JCFrame *height = [self filterFrameIn:frames frameType:(JCFrameTypeHeight)];
        view.jc_width_value = ((NSNumber*)width.value).doubleValue;
        view.jc_height_value = ((NSNumber*)height.value).doubleValue;
        view.jc_center_value = ((NSValue*)center.value).CGPointValue;
        return;
    }
    
    //      3. centerX and centerY and size
    if ((frameTypes & JCFrameTypeCenterX)
        &&(frameTypes & JCFrameTypeCenterY)
        &&(frameTypes & JCFrameTypeSize)) {
        JCFrame *centerX = [self filterFrameIn:frames frameType:(JCFrameTypeCenterX)];
        JCFrame *centerY = [self filterFrameIn:frames frameType:(JCFrameTypeCenterY)];
        JCFrame *size = [self filterFrameIn:frames frameType:(JCFrameTypeSize)];
        view.jc_centerX_value = ((NSNumber*)centerX.value).doubleValue;
        view.jc_centerY_value = ((NSNumber*)centerY.value).doubleValue;
        view.jc_size_value = ((NSValue*)size.value).CGSizeValue;
        return;
    }
    
    //      4. centerX and top and size
    if ((frameTypes & JCFrameTypeCenterX)
        &&(frameTypes & JCFrameTypeTop)
        &&(frameTypes & JCFrameTypeSize)) {
        
        JCFrame *centerX = [self filterFrameIn:frames frameType:(JCFrameTypeCenterX)];
        JCFrame *top = [self filterFrameIn:frames frameType:(JCFrameTypeTop)];
        JCFrame *size = [self filterFrameIn:frames frameType:(JCFrameTypeSize)];
        
        view.jc_size_value = ((NSValue*)size.value).CGSizeValue;
        view.jc_y_value = ((NSNumber*)top.value).doubleValue;
        view.jc_centerX_value = ((NSNumber*)centerX.value).doubleValue;

        return;
    }
    
    //      5. centerX and bottom and size
    if ((frameTypes & JCFrameTypeCenterX)
        &&(frameTypes & JCFrameTypeBottom)
        &&(frameTypes & JCFrameTypeSize)) {
        
        JCFrame *centerX = [self filterFrameIn:frames frameType:(JCFrameTypeCenterX)];
        JCFrame *bottom = [self filterFrameIn:frames frameType:(JCFrameTypeBottom)];
        JCFrame *size = [self filterFrameIn:frames frameType:(JCFrameTypeSize)];
        
        view.jc_size_value = ((NSValue*)size.value).CGSizeValue;
        view.jc_centerX_value = ((NSNumber*)centerX.value).doubleValue;
        view.jc_y_value = view.superview.jc_height_value/*父容器高度*/ - view.jc_height_value/*高度*/ + ((NSNumber*)bottom.value).doubleValue/*距离父容器底边距，一般为负数*/;
        
        return;
    }
    
    //      6. centerY and left and size
    if ((frameTypes & JCFrameTypeCenterY)
        &&(frameTypes & JCFrameTypeLeft)
        &&(frameTypes & JCFrameTypeSize)) {
        
        JCFrame *centerY = [self filterFrameIn:frames frameType:(JCFrameTypeCenterY)];
        JCFrame *left = [self filterFrameIn:frames frameType:(JCFrameTypeLeft)];
        JCFrame *size = [self filterFrameIn:frames frameType:(JCFrameTypeSize)];
        
        view.jc_size_value = ((NSValue*)size.value).CGSizeValue;
        view.jc_x_value = ((NSNumber*)left.value).doubleValue;
        view.jc_y_value = ((NSNumber*)centerY.value).doubleValue - view.jc_height_value/2;
        
        return;
    }
    
    //      7. centerY and right and size
    if ((frameTypes & JCFrameTypeCenterY)
        &&(frameTypes & JCFrameTypeRight)
        &&(frameTypes & JCFrameTypeSize)) {
        
        JCFrame *centerY = [self filterFrameIn:frames frameType:(JCFrameTypeCenterY)];
        JCFrame *right = [self filterFrameIn:frames frameType:(JCFrameTypeRight)];
        JCFrame *size = [self filterFrameIn:frames frameType:(JCFrameTypeSize)];
        
        view.jc_size_value = ((NSValue*)size.value).CGSizeValue;
        view.jc_y_value = ((NSNumber*)centerY.value).doubleValue - view.jc_height_value/2;
        view.jc_x_value = view.superview.jc_width_value/*父容器宽度*/-view.jc_width_value/*宽度*/+((NSNumber*)right.value).doubleValue/*右边距，负数*/;
        
        return;
    }
    
    //      8. left and top and size
    if ((frameTypes & JCFrameTypeLeft)
        &&(frameTypes & JCFrameTypeTop)
        &&(frameTypes & JCFrameTypeSize)) {
        
        JCFrame *left = [self filterFrameIn:frames frameType:(JCFrameTypeLeft)];
        JCFrame *top = [self filterFrameIn:frames frameType:(JCFrameTypeTop)];
        JCFrame *size = [self filterFrameIn:frames frameType:(JCFrameTypeSize)];
        
        view.jc_size_value = ((NSValue*)size.value).CGSizeValue;
        view.jc_y_value = ((NSNumber*)top.value).doubleValue;
        view.jc_x_value = ((NSNumber*)left.value).doubleValue;
        
        return;
    }
    
    //      9. left and bottom and size
    if ((frameTypes & JCFrameTypeLeft)
        &&(frameTypes & JCFrameTypeBottom)
        &&(frameTypes & JCFrameTypeSize)) {
        
        JCFrame *left = [self filterFrameIn:frames frameType:(JCFrameTypeLeft)];
        JCFrame *bottom = [self filterFrameIn:frames frameType:(JCFrameTypeBottom)];
        JCFrame *size = [self filterFrameIn:frames frameType:(JCFrameTypeSize)];
        
        view.jc_size_value = ((NSValue*)size.value).CGSizeValue;
        view.jc_x_value = ((NSNumber*)left.value).doubleValue;
        view.jc_y_value = view.superview.jc_height_value/*父容器高度*/ - view.jc_height_value/*高度*/ + ((NSNumber*)bottom.value).doubleValue/*距离父容器底边距，一般为负数*/;
        
        return;
    }
    
    //      10. right and top and size
    if ((frameTypes & JCFrameTypeRight)
        &&(frameTypes & JCFrameTypeTop)
        &&(frameTypes & JCFrameTypeSize)) {
        
        JCFrame *right = [self filterFrameIn:frames frameType:(JCFrameTypeRight)];
        JCFrame *top = [self filterFrameIn:frames frameType:(JCFrameTypeTop)];
        JCFrame *size = [self filterFrameIn:frames frameType:(JCFrameTypeSize)];
        
        view.jc_size_value = ((NSValue*)size.value).CGSizeValue;
        view.jc_y_value = ((NSNumber*)top.value).doubleValue;
        view.jc_x_value = view.superview.jc_width_value/*父容器宽度*/-view.jc_width_value/*宽度*/+((NSNumber*)right.value).doubleValue/*右边距，负数*/;
        
        return;
    }
    
    //      11. right and bottom and size
    if ((frameTypes & JCFrameTypeRight)
        &&(frameTypes & JCFrameTypeBottom)
        &&(frameTypes & JCFrameTypeSize)) {
        
        JCFrame *right = [self filterFrameIn:frames frameType:(JCFrameTypeRight)];
        JCFrame *bottom = [self filterFrameIn:frames frameType:(JCFrameTypeBottom)];
        JCFrame *size = [self filterFrameIn:frames frameType:(JCFrameTypeSize)];
        
        view.jc_size_value = ((NSValue*)size.value).CGSizeValue;
        view.jc_x_value = view.superview.jc_width_value/*父容器宽度*/-view.jc_width_value/*宽度*/+((NSNumber*)right.value).doubleValue/*右边距，负数*/;
        view.jc_y_value = view.superview.jc_height_value/*父容器高度*/ - view.jc_height_value/*高度*/ + ((NSNumber*)bottom.value).doubleValue/*距离父容器底边距，一般为负数*/;
        
        return;
    }
    
    //      12. centerX and centerY and width and height
    if ((frameTypes & JCFrameTypeCenterX)
        &&(frameTypes & JCFrameTypeCenterY)
        &&(frameTypes & JCFrameTypeWidth)
        &&(frameTypes & JCFrameTypeHeight)) {
        
        JCFrame *centerX = [self filterFrameIn:frames frameType:(JCFrameTypeCenterX)];
        JCFrame *centerY = [self filterFrameIn:frames frameType:(JCFrameTypeCenterY)];
        JCFrame *width = [self filterFrameIn:frames frameType:(JCFrameTypeWidth)];
        JCFrame *height = [self filterFrameIn:frames frameType:(JCFrameTypeHeight)];
        
        view.jc_width_value = ((NSNumber*)width.value).doubleValue;
        view.jc_height_value = ((NSNumber*)height.value).doubleValue;
        view.jc_centerX_value = ((NSNumber*)centerX.value).doubleValue;
        view.jc_centerY_value = ((NSNumber*)centerY.value).doubleValue;
        
        return;
    }
    
    //      13. centerX and top and width and height
    if ((frameTypes & JCFrameTypeCenterX)
        &&(frameTypes & JCFrameTypeTop)
        &&(frameTypes & JCFrameTypeWidth)
        &&(frameTypes & JCFrameTypeHeight)) {
        
        JCFrame *centerX = [self filterFrameIn:frames frameType:(JCFrameTypeCenterX)];
        JCFrame *top = [self filterFrameIn:frames frameType:(JCFrameTypeTop)];
        JCFrame *width = [self filterFrameIn:frames frameType:(JCFrameTypeWidth)];
        JCFrame *height = [self filterFrameIn:frames frameType:(JCFrameTypeHeight)];
        
        view.jc_width_value = ((NSNumber*)width.value).doubleValue;
        view.jc_height_value = ((NSNumber*)height.value).doubleValue;
        view.jc_centerX_value = ((NSNumber*)centerX.value).doubleValue;
        view.jc_y_value = ((NSNumber*)top.value).doubleValue;
        
        return;
    }
    //      14. centerX and bottom and width and height
    if ((frameTypes & JCFrameTypeCenterX)
        &&(frameTypes & JCFrameTypeBottom)
        &&(frameTypes & JCFrameTypeWidth)
        &&(frameTypes & JCFrameTypeHeight)) {
        
        JCFrame *centerX = [self filterFrameIn:frames frameType:(JCFrameTypeCenterX)];
        JCFrame *bottom = [self filterFrameIn:frames frameType:(JCFrameTypeBottom)];
        JCFrame *width = [self filterFrameIn:frames frameType:(JCFrameTypeWidth)];
        JCFrame *height = [self filterFrameIn:frames frameType:(JCFrameTypeHeight)];
        
        view.jc_width_value = ((NSNumber*)width.value).doubleValue;
        view.jc_height_value = ((NSNumber*)height.value).doubleValue;
        view.jc_centerX_value = ((NSNumber*)centerX.value).doubleValue;
        view.jc_y_value = view.superview.jc_height_value/*父容器高度*/ - view.jc_height_value/*高度*/ + ((NSNumber*)bottom.value).doubleValue/*距离父容器底边距，一般为负数*/;
        
        return;
    }
    //      15. centerY and left and width and height
    if ((frameTypes & JCFrameTypeCenterY)
        &&(frameTypes & JCFrameTypeLeft)
        &&(frameTypes & JCFrameTypeWidth)
        &&(frameTypes & JCFrameTypeHeight)) {
        
        JCFrame *centerY = [self filterFrameIn:frames frameType:(JCFrameTypeCenterY)];
        JCFrame *left = [self filterFrameIn:frames frameType:(JCFrameTypeLeft)];
        JCFrame *width = [self filterFrameIn:frames frameType:(JCFrameTypeWidth)];
        JCFrame *height = [self filterFrameIn:frames frameType:(JCFrameTypeHeight)];
        
        view.jc_width_value = ((NSNumber*)width.value).doubleValue;
        view.jc_height_value = ((NSNumber*)height.value).doubleValue;
        view.jc_centerY_value = ((NSNumber*)centerY.value).doubleValue;
        view.jc_x_value = ((NSNumber*)left.value).doubleValue;
        
        return;
    }
    //      16. centerY and right and width and height
    if ((frameTypes & JCFrameTypeCenterY)
        &&(frameTypes & JCFrameTypeRight)
        &&(frameTypes & JCFrameTypeWidth)
        &&(frameTypes & JCFrameTypeHeight)) {
        
        JCFrame *centerY = [self filterFrameIn:frames frameType:(JCFrameTypeCenterY)];
        JCFrame *right = [self filterFrameIn:frames frameType:(JCFrameTypeRight)];
        JCFrame *width = [self filterFrameIn:frames frameType:(JCFrameTypeWidth)];
        JCFrame *height = [self filterFrameIn:frames frameType:(JCFrameTypeHeight)];
        
        view.jc_width_value = ((NSNumber*)width.value).doubleValue;
        view.jc_height_value = ((NSNumber*)height.value).doubleValue;
        view.jc_centerY_value = ((NSNumber*)centerY.value).doubleValue;
        view.jc_x_value = view.superview.jc_width_value/*父容器宽度*/-view.jc_width_value/*宽度*/+((NSNumber*)right.value).doubleValue/*右边距，负数*/;
        
        return;
    }
    
    //      含有2条边界值，2个尺寸
    //      17. left and top and width and height
    if ((frameTypes & JCFrameTypeLeft)
        &&(frameTypes & JCFrameTypeTop)
        &&(frameTypes & JCFrameTypeWidth)
        &&(frameTypes & JCFrameTypeHeight)) {
        
        JCFrame *left = [self filterFrameIn:frames frameType:(JCFrameTypeLeft)];
        JCFrame *top = [self filterFrameIn:frames frameType:(JCFrameTypeTop)];
        JCFrame *width = [self filterFrameIn:frames frameType:(JCFrameTypeWidth)];
        JCFrame *height = [self filterFrameIn:frames frameType:(JCFrameTypeHeight)];
        
        view.jc_x_value = ((NSNumber*)left.value).doubleValue;
        view.jc_y_value = ((NSNumber*)top.value).doubleValue;
        view.jc_width_value = ((NSNumber*)width.value).doubleValue;
        view.jc_height_value = ((NSNumber*)height.value).doubleValue;
        
        return;
    }
    
    //      18. left and bottom and width and height
    if ((frameTypes & JCFrameTypeLeft)
        &&(frameTypes & JCFrameTypeBottom)
        &&(frameTypes & JCFrameTypeWidth)
        &&(frameTypes & JCFrameTypeHeight)) {
        
        JCFrame *left = [self filterFrameIn:frames frameType:(JCFrameTypeLeft)];
        JCFrame *bottom = [self filterFrameIn:frames frameType:(JCFrameTypeBottom)];
        JCFrame *width = [self filterFrameIn:frames frameType:(JCFrameTypeWidth)];
        JCFrame *height = [self filterFrameIn:frames frameType:(JCFrameTypeHeight)];
        
        view.jc_x_value = ((NSNumber*)left.value).doubleValue;
        view.jc_width_value = ((NSNumber*)width.value).doubleValue;
        view.jc_height_value = ((NSNumber*)height.value).doubleValue;
        view.jc_y_value = view.superview.jc_height_value/*父容器高度*/ - view.jc_height_value/*高度*/ + ((NSNumber*)bottom.value).doubleValue/*底部边距*/;
        
        return;
    }
    
    //      19. right and top and width and height
    if ((frameTypes & JCFrameTypeRight)
        &&(frameTypes & JCFrameTypeTop)
        &&(frameTypes & JCFrameTypeWidth)
        &&(frameTypes & JCFrameTypeHeight)) {
        
        JCFrame *right = [self filterFrameIn:frames frameType:(JCFrameTypeRight)];
        JCFrame *top = [self filterFrameIn:frames frameType:(JCFrameTypeTop)];
        JCFrame *width = [self filterFrameIn:frames frameType:(JCFrameTypeWidth)];
        JCFrame *height = [self filterFrameIn:frames frameType:(JCFrameTypeHeight)];
        
        view.jc_width_value = ((NSNumber*)width.value).doubleValue;
        view.jc_height_value = ((NSNumber*)height.value).doubleValue;
        view.jc_x_value = view.superview.jc_width_value/*父容器宽度*/ - view.jc_width_value/*宽度*/ + ((NSNumber*)right.value).doubleValue/*右边距*/;
        view.jc_y_value = ((NSNumber*)top.value).doubleValue;
        
        return;
    }
    
    //      20. right and bottom and width and height
    if ((frameTypes & JCFrameTypeRight)
        &&(frameTypes & JCFrameTypeBottom)
        &&(frameTypes & JCFrameTypeWidth)
        &&(frameTypes & JCFrameTypeHeight)) {
        
        JCFrame *right = [self filterFrameIn:frames frameType:(JCFrameTypeRight)];
        JCFrame *bottom = [self filterFrameIn:frames frameType:(JCFrameTypeBottom)];
        JCFrame *width = [self filterFrameIn:frames frameType:(JCFrameTypeWidth)];
        JCFrame *height = [self filterFrameIn:frames frameType:(JCFrameTypeHeight)];
        
        view.jc_width_value = ((NSNumber*)width.value).doubleValue;
        view.jc_height_value = ((NSNumber*)height.value).doubleValue;
        view.jc_x_value = view.superview.jc_width_value/*父容器宽度*/ - view.jc_width_value/*宽度*/ + ((NSNumber*)right.value).doubleValue/*右边距*/;
        view.jc_y_value = view.superview.jc_height_value/*父容器高度*/ - view.jc_height_value/*高度*/ + ((NSNumber*)bottom.value).doubleValue/*底部边距*/;
        
        return;
    }

    //      含有3条边距值,1个尺寸值
    //      21. left and right and top and height
    if ((frameTypes & JCFrameTypeLeft)
        &&(frameTypes & JCFrameTypeRight)
        &&(frameTypes & JCFrameTypeTop)
        &&(frameTypes & JCFrameTypeHeight)) {
        
        JCFrame *left = [self filterFrameIn:frames frameType:(JCFrameTypeLeft)];
        JCFrame *right = [self filterFrameIn:frames frameType:(JCFrameTypeRight)];
        JCFrame *top = [self filterFrameIn:frames frameType:(JCFrameTypeTop)];
        JCFrame *height = [self filterFrameIn:frames frameType:(JCFrameTypeHeight)];
        
        view.jc_x_value = ((NSNumber*)left.value).doubleValue;
        view.jc_y_value = ((NSNumber*)top.value).doubleValue;
        view.jc_width_value = view.superview.jc_width_value/*父容器宽度*/-view.jc_x_value/*左边距*/+((NSNumber*)right.value).doubleValue/*右边距，负数*/;
        view.jc_height_value = ((NSNumber*)height.value).doubleValue;
        
        return;
    }

    
    //      22. left and right and bottom and height
    if ((frameTypes & JCFrameTypeLeft)
        &&(frameTypes & JCFrameTypeRight)
        &&(frameTypes & JCFrameTypeBottom)
        &&(frameTypes & JCFrameTypeHeight)) {
        
        JCFrame *left = [self filterFrameIn:frames frameType:(JCFrameTypeLeft)];
        JCFrame *right = [self filterFrameIn:frames frameType:(JCFrameTypeRight)];
        JCFrame *bottom = [self filterFrameIn:frames frameType:(JCFrameTypeBottom)];
        JCFrame *height = [self filterFrameIn:frames frameType:(JCFrameTypeHeight)];
        
        view.jc_x_value = ((NSNumber*)left.value).doubleValue;
        view.jc_height_value = ((NSNumber*)height.value).doubleValue;
        view.jc_width_value = view.superview.jc_width_value/*父容器宽度*/-view.jc_x_value/*左边距*/+((NSNumber*)right.value).doubleValue/*右边距，负数*/;
        view.jc_y_value = view.superview.jc_height_value/*父容器高度*/-view.jc_height_value/*高度*/+((NSNumber*)bottom.value).doubleValue/*底边距，负数*/;
        
        return;
    }
    
    //      23. left and top and bottom and width
    if ((frameTypes & JCFrameTypeLeft)
        &&(frameTypes & JCFrameTypeTop)
        &&(frameTypes & JCFrameTypeBottom)
        &&(frameTypes & JCFrameTypeWidth)) {
        
        JCFrame *left = [self filterFrameIn:frames frameType:(JCFrameTypeLeft)];
        JCFrame *top = [self filterFrameIn:frames frameType:(JCFrameTypeTop)];
        JCFrame *bottom = [self filterFrameIn:frames frameType:(JCFrameTypeBottom)];
        JCFrame *width = [self filterFrameIn:frames frameType:(JCFrameTypeWidth)];
        
        view.jc_x_value = ((NSNumber*)left.value).doubleValue;
        view.jc_y_value = ((NSNumber*)top.value).doubleValue;
        view.jc_width_value = ((NSNumber*)width.value).doubleValue;
        view.jc_height_value = view.superview.jc_height_value/*父容器高度*/ - view.jc_y_value/*顶边距*/ + ((NSNumber*)bottom.value).doubleValue/*底边距*/;
        
        return;
    }

    
    //      24. right and top and bottom and width
    if ((frameTypes & JCFrameTypeRight)
        &&(frameTypes & JCFrameTypeTop)
        &&(frameTypes & JCFrameTypeBottom)
        &&(frameTypes & JCFrameTypeWidth)) {
        
        JCFrame *right = [self filterFrameIn:frames frameType:(JCFrameTypeRight)];
        JCFrame *top = [self filterFrameIn:frames frameType:(JCFrameTypeTop)];
        JCFrame *bottom = [self filterFrameIn:frames frameType:(JCFrameTypeBottom)];
        JCFrame *width = [self filterFrameIn:frames frameType:(JCFrameTypeWidth)];
        
        view.jc_y_value = ((NSNumber*)top.value).doubleValue;
        view.jc_width_value = ((NSNumber*)width.value).doubleValue;
        view.jc_height_value = view.superview.jc_height_value/*父容器高度*/ - view.jc_y_value/*顶边距*/ + ((NSNumber*)bottom.value).doubleValue/*底边距*/;
        view.jc_x_value = view.superview.jc_width_value/*父容器宽度*/ - view.jc_width_value/*宽度*/ + ((NSNumber*)right.value).doubleValue/*右边距*/;
        
        return;
    }
    
    
    
    //      含有4条边距值
    //      25. left and right and top and bottom
    if ((frameTypes & JCFrameTypeLeft)
        &&(frameTypes & JCFrameTypeRight)
        &&(frameTypes & JCFrameTypeTop)
        &&(frameTypes & JCFrameTypeBottom)) {
        
        JCFrame *left = [self filterFrameIn:frames frameType:(JCFrameTypeLeft)];
        JCFrame *right = [self filterFrameIn:frames frameType:(JCFrameTypeRight)];
        JCFrame *top = [self filterFrameIn:frames frameType:(JCFrameTypeTop)];
        JCFrame *bottom = [self filterFrameIn:frames frameType:(JCFrameTypeBottom)];
        
        view.jc_x_value = ((NSNumber*)left.value).doubleValue;
        view.jc_y_value = ((NSNumber*)top.value).doubleValue;
        view.jc_width_value = view.superview.jc_width_value/*父容器宽度*/-view.jc_x_value/*左边距*/+((NSNumber*)right.value).doubleValue/*右边距，负数*/;
        view.jc_height_value = view.superview.jc_height_value/*父容器高度*/-view.jc_y_value/*顶边距*/+((NSNumber*)bottom.value).doubleValue/*右边距，负数*/;
        
        return;
    }
    
}

+ (JCFrame*)filterFrameIn:(NSArray*)collection frameType:(JCFrameType)frameType{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:[NSString stringWithFormat:@"frameType=%zd",frameType]];
    NSArray *result = [collection filteredArrayUsingPredicate:predicate];
    return (result && result.count > 0) ? result.firstObject : nil;
}

@end

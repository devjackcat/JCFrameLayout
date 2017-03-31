//
//  JCFrameExecutor.m
//  JCFrameLayout
//
//  Created by abc on 17/3/29.
//  Copyright © 2017年 jackcat. All rights reserved.
//

#import "JCFrameExecutor.h"

#import "UIView+JCFrame.h"


/**
 根据relateCenter、multiplier、offset计算新的CGPoint
 */
CGPoint transToNewCenter(CGPoint relateCenter,CGFloat multiplier,id offset){
    CGFloat offsetX = [offset CGPointValue].x;
    CGFloat offsetY = [offset CGPointValue].y;
    CGFloat newCenterX = relateCenter.x * multiplier + offsetX;
    CGFloat newCenterY = relateCenter.y * multiplier + offsetY;
    return CGPointMake(newCenterX, newCenterY);
}

/**
 根据relateCenter、multiplier、offset计算新的CGSize
 */
CGSize transToNewSize(CGSize relateSize,CGFloat multiplier,id offset){
    CGFloat offsetWidth = [offset CGSizeValue].width;
    CGFloat offsetHeight = [offset CGSizeValue].height;
    CGFloat newWidth = relateSize.width * multiplier + offsetWidth;
    CGFloat newHeight = relateSize.height * multiplier + offsetHeight;
    return CGSizeMake(newWidth, newHeight);
}

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
//      含有 center 和 size
//      1. center and size
//
//      只有 center
//      2. center and width and height
//
//      只有 size 和 (centerX 或 centerY)
//      3. centerX and centerY and size
//      4. centerX and top and size
//      5. centerX and bottom and size
//      6. centerY and left and size
//      7. centerY and right and size
//
//      只有 size
//      8. left and top and size
//      9. left and bottom and size
//      10. right and top and size
//      11. right and bottom and size

//      含有centerX 或 centerY
//      12. centerX and centerY and width and height
//      13. centerX and top and width and height
//      14. centerX and bottom and width and height
//      15. centerY and left and width and height
//      16. centerY and right and width and height

//      含有2条边界值，2个尺寸
//      17. left and top and width and height
//      18. left and bottom and width and height
//      19. right and top and width and height
//      20. right and bottom and width and height

//      含有3条边距值,1个尺寸值
//      21. left and right and top and height
//      22. left and right and bottom and height
//      23. left and top and bottom and width
//      24. right and top and bottom and width

//      含有4条边距值
//      25. left and right and top and bottom

+ (void)executeWithView:(UIView*)view frameTypes:(JCFrameType)frameTypes{
    
    //      1. center and size
    if ([self layoutByCenterAndSize:view frameTypes:frameTypes]) {
        return;
    }
    
    //      2. center and width and height
    if ([self layoutByCenterAndWidthAndHeight:view frameTypes:frameTypes]) {
        return;
    }
    
    //      3. centerX and centerY and size
    if ([self layoutByCenterXAndCenterYAndSize:view frameTypes:frameTypes]) {
        return;
    }
    
    //      4. centerX and top and size
    if ([self layoutByCenterXAndTopAndSize:view frameTypes:frameTypes]) {
        return;
    }
    
    //      5. centerX and bottom and size
    if ([self layoutByCenterXAndBottomAndSize:view frameTypes:frameTypes]) {
        return;
    }
    
    //      6. centerY and left and size
    if ([self layoutByCenterYAndLeftAndSize:view frameTypes:frameTypes]) {
        return;
    }
    
    
    //      7. centerY and right and size
    if ([self layoutByCenterYAndRightAndSize:view frameTypes:frameTypes]) {
        return;
    }
    
    //      8. left and top and size
    if ([self layoutByLeftAndTopAndSize:view frameTypes:frameTypes]) {
        return;
    }
    
    
    //      9. left and bottom and size
    if ([self layoutByLeftAndBottomAndSize:view frameTypes:frameTypes]) {
        return;
    }
    
    //      10. right and top and size
    if ([self layoutByRightAndTopAndSize:view frameTypes:frameTypes]) {
        return;
    }
    
    
    //      11. right and bottom and size
    if ([self layoutByRightAndBottomAndSize:view frameTypes:frameTypes]) {
        return;
    }
    
    //      12. centerX and centerY and width and height
    if ([self layoutByCenterXAndCenterYAndWidthAndHeight:view frameTypes:frameTypes]) {
        return;
    }
    
    //      13. centerX and top and width and height
    if ([self layoutByCenterXAndTopAndWidthAndHeight:view frameTypes:frameTypes]) {
        return;
    }
    
    //      14. centerX and bottom and width and height
    if ([self layoutByCenterXAndBottomAndWidthAndHeight:view frameTypes:frameTypes]) {
        return;
    }
    
    //      15. centerY and left and width and height
    if ([self layoutByCenterYAndLeftAndWidthAndHeight:view frameTypes:frameTypes]) {
        return;
    }
    
    //      16. centerY and right and width and height
    if ([self layoutByCenterYAndRightAndWidthAndHeight:view frameTypes:frameTypes]) {
        return;
    }
    
    //      含有2条边界值，2个尺寸
    //      17. left and top and width and height
    if ([self layoutByLeftAndTopAndWidthAndHeight:view frameTypes:frameTypes]) {
        return;
    }
    
    //      18. left and bottom and width and height
    if ([self layoutByLeftAndBottomAndWidthAndHeight:view frameTypes:frameTypes ]) {
        return;
    }
    
    //      19. right and top and width and height
    if ([self layoutByRightAndTopAndWidthAndHeight:view frameTypes:frameTypes]) {
        return;
    }
    
    //      20. right and bottom and width and height
    if ([self layoutByRightAndBottomAndWidthAndHeight:view frameTypes:frameTypes]) {
        return;
    }
    
    //      含有3条边距值,1个尺寸值
    //      21. left and right and top and height
    if ([self layoutByLeftAndRightAndTopAndHeight:view frameTypes:frameTypes]) {
        return;
    }
    
    //      22. left and right and bottom and height
    if ([self layoutByLeftAndRightAndBottomAndHeight:view frameTypes:frameTypes]) {
        return;
    }
    
    //      23. left and top and bottom and width
    if ([self layoutByLeftAndTopAndBottomAndWidth:view frameTypes:frameTypes]) {
        return;
    }
    
    //      24. right and top and bottom and width
    if ([self layoutByRightAndTopAndBottomAndWidth:view frameTypes:frameTypes]) {
        
        return;
    }
    
    //      含有4条边距值
    //      25. left and right and top and bottom
    if ([self layoutByLeftAndRightAndTopAndBottom:view frameTypes:frameTypes]) {
        
        return;
    }
}

#pragma mark - 含有 center 和 size
//      1. center and size
+ (BOOL)layoutByCenterAndSize:(UIView*)view frameTypes:(JCFrameType)frameTypes{

    if ((frameTypes & JCFrameTypeCenter)
        &&(frameTypes & JCFrameTypeSize)) {
        
        NSArray<JCFrame*>*frames = view.jc_frames;
        
        JCLog(@"--view = %@",view.jc_debug_key);
        
        JCFrame *center = [self filterFrameIn:frames frameType:(JCFrameTypeCenter)];
        JCFrame *size = [self filterFrameIn:frames frameType:(JCFrameTypeSize)];
        
        //1. 先size
        if (size.hasRelateAttr) {
            //size的相对值只能是size
            if (size.frameAttr.relateFrameType == JCFrameTypeSize) {
                //1.1 计算新的size
                CGSize newSize = transToNewSize(size.frameAttr.relateView.jc_size_value,size.multiplier,size.offset);
                //2. 新值回填
                view.jc_size_value = newSize;
                //3. 设置新值
                size.jc_equalTo(newSize);
            }
        }else{
            view.jc_size_value = ((NSValue*)size.value).CGSizeValue;
        }
        
        //2. 后Center
        if (center.hasRelateAttr) {
            //center的相对值只能是center
            if(center.frameAttr.relateFrameType == JCFrameTypeCenter){
                //1. 根据multiplier和offset获取新的center
                CGPoint newCenter = transToNewCenter(center.frameAttr.relateView.jc_center_value,center.multiplier,center.offset);
                //2. 将新的值回填回去，因为center的value属性赋值
                center.jc_equalTo(newCenter);
                //3. 设置新值
                view.jc_center_value = newCenter;
                
            }
        }else{
            view.jc_center_value = ((NSValue*)center.value).CGPointValue;
        }
        
        return YES;
    }
    
    return NO;
}

#pragma mark - 只有 center
//      2. center and width and height
+ (BOOL)layoutByCenterAndWidthAndHeight:(UIView*)view frameTypes:(JCFrameType)frameTypes{

    if ((frameTypes & JCFrameTypeCenter)
        &&(frameTypes & JCFrameTypeWidth)
        &&(frameTypes & JCFrameTypeHeight)) {
        
        NSArray<JCFrame*>*frames = view.jc_frames;
        
        //1. 设置宽度
        JCFrame *width = [self filterFrameIn:frames frameType:(JCFrameTypeWidth)];
        if (width.hasRelateAttr) {
            if(width.frameAttr.relateFrameType == JCFrameTypeWidth){
                //view2.width * 倍数 + 偏移量
                CGFloat newWidth = width.frameAttr.relateView.jc_width_value * width.multiplier + ((NSNumber*)width.offset).doubleValue;
                //回填
                width.jc_equalTo(newWidth);
                //设置
                view.jc_width_value = newWidth;
            }
        }else{
            view.jc_width_value = ((NSNumber*)width.value).doubleValue;
        }
        
        //2. 设置高度
        JCFrame *height = [self filterFrameIn:frames frameType:(JCFrameTypeHeight)];
        if (height.hasRelateAttr) {
            //height只能相对height
            if(height.frameAttr.relateFrameType == JCFrameTypeHeight){
                //计算新值
                CGFloat newHeight = height.frameAttr.relateView.jc_height_value * height.multiplier + ((NSNumber*)height.offset).doubleValue;
                //回填
                height.jc_equalTo(newHeight);
                //设置
                view.jc_height_value = newHeight;
            }
        }else{
            view.jc_height_value = ((NSNumber*)height.value).doubleValue;
        }
        
        //3. 设置center
        JCFrame *center = [self filterFrameIn:frames frameType:(JCFrameTypeCenter)];
        if (center.hasRelateAttr) {
            if (center.frameAttr.relateFrameType == JCFrameTypeCenter) {
                //计算新值
                CGPoint newCenter = transToNewCenter(center.frameAttr.relateView.jc_center_value, center.multiplier, center.offset);
                //回填
                center.jc_equalTo(newCenter);
                //设置
                view.jc_center_value = newCenter;
            }
        }else{
            view.jc_center_value = ((NSValue*)center.value).CGPointValue;
        }
        
        return YES;
    }
    return NO;
    
}

#pragma mark - 只有 size 和 (centerX 或 centerY)
//      3. centerX and centerY and size
+ (BOOL)layoutByCenterXAndCenterYAndSize:(UIView*)view frameTypes:(JCFrameType)frameTypes{
    
    if ((frameTypes & JCFrameTypeCenterX)
        &&(frameTypes & JCFrameTypeCenterY)
        &&(frameTypes & JCFrameTypeSize)) {
        
        NSArray<JCFrame*>*frames = view.jc_frames;
        
        JCFrame *centerX = [self filterFrameIn:frames frameType:(JCFrameTypeCenterX)];
        JCFrame *centerY = [self filterFrameIn:frames frameType:(JCFrameTypeCenterY)];
        JCFrame *size = [self filterFrameIn:frames frameType:(JCFrameTypeSize)];
        view.jc_centerX_value = ((NSNumber*)centerX.value).doubleValue;
        view.jc_centerY_value = ((NSNumber*)centerY.value).doubleValue;
        view.jc_size_value = ((NSValue*)size.value).CGSizeValue;
        return YES;
    }
    
    return NO;
}

//      4. centerX and top and size
+ (BOOL)layoutByCenterXAndTopAndSize:(UIView*)view frameTypes:(JCFrameType)frameTypes{
    if ((frameTypes & JCFrameTypeCenterX)
        &&(frameTypes & JCFrameTypeTop)
        &&(frameTypes & JCFrameTypeSize)) {
        
        NSArray<JCFrame*>*frames = view.jc_frames;
        
        JCFrame *centerX = [self filterFrameIn:frames frameType:(JCFrameTypeCenterX)];
        JCFrame *top = [self filterFrameIn:frames frameType:(JCFrameTypeTop)];
        JCFrame *size = [self filterFrameIn:frames frameType:(JCFrameTypeSize)];
        
        view.jc_size_value = ((NSValue*)size.value).CGSizeValue;
        view.jc_y_value = ((NSNumber*)top.value).doubleValue;
        view.jc_centerX_value = ((NSNumber*)centerX.value).doubleValue;
        
        return YES;
    }

    return NO;
}

//      5. centerX and bottom and size
+ (BOOL)layoutByCenterXAndBottomAndSize:(UIView*)view frameTypes:(JCFrameType)frameTypes{NSArray<JCFrame*>*frames = view.jc_frames;
    if ((frameTypes & JCFrameTypeCenterX)
        &&(frameTypes & JCFrameTypeBottom)
        &&(frameTypes & JCFrameTypeSize)) {
        
        JCFrame *centerX = [self filterFrameIn:frames frameType:(JCFrameTypeCenterX)];
        JCFrame *bottom = [self filterFrameIn:frames frameType:(JCFrameTypeBottom)];
        JCFrame *size = [self filterFrameIn:frames frameType:(JCFrameTypeSize)];
        
        view.jc_size_value = ((NSValue*)size.value).CGSizeValue;
        view.jc_centerX_value = ((NSNumber*)centerX.value).doubleValue;
        view.jc_y_value = view.superview.jc_height_value/*父容器高度*/ - view.jc_height_value/*高度*/ + ((NSNumber*)bottom.value).doubleValue/*距离父容器底边距，一般为负数*/;
        
        return NO;
    }
    return NO;
}

//      6. centerY and left and size
+ (BOOL)layoutByCenterYAndLeftAndSize:(UIView*)view frameTypes:(JCFrameType)frameTypes{NSArray<JCFrame*>*frames = view.jc_frames;
    if ((frameTypes & JCFrameTypeCenterY)
        &&(frameTypes & JCFrameTypeLeft)
        &&(frameTypes & JCFrameTypeSize)) {
        
        JCFrame *centerY = [self filterFrameIn:frames frameType:(JCFrameTypeCenterY)];
        JCFrame *left = [self filterFrameIn:frames frameType:(JCFrameTypeLeft)];
        JCFrame *size = [self filterFrameIn:frames frameType:(JCFrameTypeSize)];
        
        view.jc_size_value = ((NSValue*)size.value).CGSizeValue;
        view.jc_x_value = ((NSNumber*)left.value).doubleValue;
        view.jc_y_value = ((NSNumber*)centerY.value).doubleValue - view.jc_height_value/2;
        
        return YES;
    }
    return NO;
}

//      7. centerY and right and size
+ (BOOL)layoutByCenterYAndRightAndSize:(UIView*)view frameTypes:(JCFrameType)frameTypes{NSArray<JCFrame*>*frames = view.jc_frames;
    
    if ((frameTypes & JCFrameTypeCenterY)
        &&(frameTypes & JCFrameTypeRight)
        &&(frameTypes & JCFrameTypeSize)) {
        
        JCFrame *centerY = [self filterFrameIn:frames frameType:(JCFrameTypeCenterY)];
        JCFrame *right = [self filterFrameIn:frames frameType:(JCFrameTypeRight)];
        JCFrame *size = [self filterFrameIn:frames frameType:(JCFrameTypeSize)];
        
        view.jc_size_value = ((NSValue*)size.value).CGSizeValue;
        view.jc_y_value = ((NSNumber*)centerY.value).doubleValue - view.jc_height_value/2;
        view.jc_x_value = view.superview.jc_width_value/*父容器宽度*/-view.jc_width_value/*宽度*/+((NSNumber*)right.value).doubleValue/*右边距，负数*/;
        
        return YES;
    }
    
    return NO;
}

#pragma mark - 只有 size
//      8. left and top and size
+ (BOOL)layoutByLeftAndTopAndSize:(UIView*)view frameTypes:(JCFrameType)frameTypes{NSArray<JCFrame*>*frames = view.jc_frames;
    if ((frameTypes & JCFrameTypeLeft)
        &&(frameTypes & JCFrameTypeTop)
        &&(frameTypes & JCFrameTypeSize)) {
        
        JCFrame *left = [self filterFrameIn:frames frameType:(JCFrameTypeLeft)];
        JCFrame *top = [self filterFrameIn:frames frameType:(JCFrameTypeTop)];
        JCFrame *size = [self filterFrameIn:frames frameType:(JCFrameTypeSize)];
        
        view.jc_size_value = ((NSValue*)size.value).CGSizeValue;
        view.jc_y_value = ((NSNumber*)top.value).doubleValue;
        view.jc_x_value = ((NSNumber*)left.value).doubleValue;
        
        return YES;
    }
    return NO;
}

//      9. left and bottom and size
+ (BOOL)layoutByLeftAndBottomAndSize:(UIView*)view frameTypes:(JCFrameType)frameTypes{NSArray<JCFrame*>*frames = view.jc_frames;
    
    if ((frameTypes & JCFrameTypeLeft)
        &&(frameTypes & JCFrameTypeBottom)
        &&(frameTypes & JCFrameTypeSize)) {
        
        JCFrame *left = [self filterFrameIn:frames frameType:(JCFrameTypeLeft)];
        JCFrame *bottom = [self filterFrameIn:frames frameType:(JCFrameTypeBottom)];
        JCFrame *size = [self filterFrameIn:frames frameType:(JCFrameTypeSize)];
        
        view.jc_size_value = ((NSValue*)size.value).CGSizeValue;
        view.jc_x_value = ((NSNumber*)left.value).doubleValue;
        view.jc_y_value = view.superview.jc_height_value/*父容器高度*/ - view.jc_height_value/*高度*/ + ((NSNumber*)bottom.value).doubleValue/*距离父容器底边距，一般为负数*/;
        
        return YES;
    }
    return NO;
}

//      10. right and top and size
+ (BOOL)layoutByRightAndTopAndSize:(UIView*)view frameTypes:(JCFrameType)frameTypes{
    
    NSArray<JCFrame*>*frames = view.jc_frames;
    
    if ((frameTypes & JCFrameTypeRight)
        &&(frameTypes & JCFrameTypeTop)
        &&(frameTypes & JCFrameTypeSize)) {
        
        JCFrame *right = [self filterFrameIn:frames frameType:(JCFrameTypeRight)];
        JCFrame *top = [self filterFrameIn:frames frameType:(JCFrameTypeTop)];
        JCFrame *size = [self filterFrameIn:frames frameType:(JCFrameTypeSize)];
        
        view.jc_size_value = ((NSValue*)size.value).CGSizeValue;
        view.jc_y_value = ((NSNumber*)top.value).doubleValue;
        view.jc_x_value = view.superview.jc_width_value/*父容器宽度*/-view.jc_width_value/*宽度*/+((NSNumber*)right.value).doubleValue/*右边距，负数*/;
        
        return YES;
    }
    
    return NO;
}

//      11. right and bottom and size
+ (BOOL)layoutByRightAndBottomAndSize:(UIView*)view frameTypes:(JCFrameType)frameTypes{NSArray<JCFrame*>*frames = view.jc_frames;
    
    if ((frameTypes & JCFrameTypeRight)
        &&(frameTypes & JCFrameTypeBottom)
        &&(frameTypes & JCFrameTypeSize)) {
        
        JCFrame *right = [self filterFrameIn:frames frameType:(JCFrameTypeRight)];
        JCFrame *bottom = [self filterFrameIn:frames frameType:(JCFrameTypeBottom)];
        JCFrame *size = [self filterFrameIn:frames frameType:(JCFrameTypeSize)];
        
        view.jc_size_value = ((NSValue*)size.value).CGSizeValue;
        view.jc_x_value = view.superview.jc_width_value/*父容器宽度*/-view.jc_width_value/*宽度*/+((NSNumber*)right.value).doubleValue/*右边距，负数*/;
        view.jc_y_value = view.superview.jc_height_value/*父容器高度*/ - view.jc_height_value/*高度*/ + ((NSNumber*)bottom.value).doubleValue/*距离父容器底边距，一般为负数*/;
        
        return YES;
    }
    
    return NO;
}

#pragma mark - 含有centerX 或 centerY
//      12. centerX and centerY and width and height
+ (BOOL)layoutByCenterXAndCenterYAndWidthAndHeight:(UIView*)view frameTypes:(JCFrameType)frameTypes{
    NSArray<JCFrame*>*frames = view.jc_frames;
    
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
        
        return YES;
    }

    
    return NO;
}

//      13. centerX and top and width and height
+ (BOOL)layoutByCenterXAndTopAndWidthAndHeight:(UIView*)view frameTypes:(JCFrameType)frameTypes{
    NSArray<JCFrame*>*frames = view.jc_frames;
    
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
        
        return YES;
    }
    
    return NO;
}

//      14. centerX and bottom and width and height
+ (BOOL)layoutByCenterXAndBottomAndWidthAndHeight:(UIView*)view frameTypes:(JCFrameType)frameTypes{
    
    NSArray<JCFrame*>*frames = view.jc_frames;
    
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
        
        return YES;
    }
    
    return NO;
}

//      15. centerY and left and width and height
+ (BOOL)layoutByCenterYAndLeftAndWidthAndHeight:(UIView*)view frameTypes:(JCFrameType)frameTypes{
    
    NSArray<JCFrame*>*frames = view.jc_frames;
    
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
        
        return YES;
    }
    
    return NO;
}

//      16. centerY and right and width and height
+ (BOOL)layoutByCenterYAndRightAndWidthAndHeight:(UIView*)view frameTypes:(JCFrameType)frameTypes{
    
    NSArray<JCFrame*>*frames = view.jc_frames;
    
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
        
        return YES;
    }
    
    return NO;
}

#pragma mark - 含有2条边界值，2个尺寸的组合
//      17. left and top and width and height
+ (BOOL)layoutByLeftAndTopAndWidthAndHeight:(UIView*)view frameTypes:(JCFrameType)frameTypes{
    
    NSArray<JCFrame*>*frames = view.jc_frames;
    
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
        
        return YES;
    }
    
    return NO;
}

//      18. left and bottom and width and height
+ (BOOL)layoutByLeftAndBottomAndWidthAndHeight:(UIView*)view frameTypes:(JCFrameType)frameTypes{
    NSArray<JCFrame*>*frames = view.jc_frames;
    
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
        
        return YES;
    }
    
    return NO;
}

//      19. right and top and width and height
+ (BOOL)layoutByRightAndTopAndWidthAndHeight:(UIView*)view frameTypes:(JCFrameType)frameTypes{
    
    NSArray<JCFrame*>*frames = view.jc_frames;
    
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
        
        return YES;
    }
    
    return NO;
}

//      20. right and bottom and width and height
+ (BOOL)layoutByRightAndBottomAndWidthAndHeight:(UIView*)view frameTypes:(JCFrameType)frameTypes{
    NSArray<JCFrame*>*frames = view.jc_frames;
    
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
        
        return YES;
    }
    
    return NO;

}

#pragma mark - 含有3条边距值,1个尺寸值的组合
//      21. left and right and top and height
+ (BOOL)layoutByLeftAndRightAndTopAndHeight:(UIView*)view frameTypes:(JCFrameType)frameTypes{
    
    NSArray<JCFrame*>*frames = view.jc_frames;
    
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
        
        return YES;
    }
    
    return NO;

}

//      22. left and right and bottom and height
+ (BOOL)layoutByLeftAndRightAndBottomAndHeight:(UIView*)view frameTypes:(JCFrameType)frameTypes{
    
    NSArray<JCFrame*>*frames = view.jc_frames;
    
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
        
        return YES;
    }
    
    return NO;

}

//      23. left and top and bottom and width
+ (BOOL)layoutByLeftAndTopAndBottomAndWidth:(UIView*)view frameTypes:(JCFrameType)frameTypes{
    
    NSArray<JCFrame*>*frames = view.jc_frames;
    
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
        
        return YES;
    }
    
    return NO;

}

//      24. right and top and bottom and width
+ (BOOL)layoutByRightAndTopAndBottomAndWidth:(UIView*)view frameTypes:(JCFrameType)frameTypes{
    NSArray<JCFrame*>*frames = view.jc_frames;
    
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
        
        return YES;
    }

    
    return NO;

}

#pragma mark - 含有4条边距值
//      25. left and right and top and bottom
+ (BOOL)layoutByLeftAndRightAndTopAndBottom:(UIView*)view frameTypes:(JCFrameType)frameTypes{
    NSArray<JCFrame*>*frames = view.jc_frames;
    
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
        
        return YES;
    }

    
    return NO;

}

#pragma mark - 过滤的公共方法
+ (JCFrame*)filterFrameIn:(NSArray*)collection frameType:(JCFrameType)frameType{
    NSPredicate *predicate = [NSPredicate predicateWithBlock:^BOOL(JCFrame *frame, id obj) {
        return frame.frameAttr.currentFrameType == frameType;
    }];
    NSArray *result = [collection filteredArrayUsingPredicate:predicate];
    JCFrame *frame = (result && result.count > 0) ? result.firstObject : nil;
    //将Frame的actived标记为YES
    frame.actived = YES;
    return frame;
}

@end

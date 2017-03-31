//
//  JCFrameExecutorMethods.h
//  JCFrameLayout
//
//  Created by abc on 17/3/31.
//  Copyright © 2017年 jackcat. All rights reserved.
//

#ifndef JCFrameExecutorMethods_h
#define JCFrameExecutorMethods_h

#import <Foundation/Foundation.h>

#pragma mark - center 或 size 新值得计算
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

#pragma mark - 设置布局属性
void setLeftByLeftFrame(UIView*view,JCFrame*frame){
    if (frame.hasRelateAttr) {
        //Left可以相对Left ,CenterX ,Right
        CGFloat x = 0;
        if (frame.frameAttr.relateFrameType == JCFrameTypeLeft) {
            x = frame.frameAttr.relateView.jc_x_value;
        }else if (frame.frameAttr.relateFrameType == JCFrameTypeCenterX) {
            x = frame.frameAttr.relateView.jc_centerX_value;
        }else if (frame.frameAttr.relateFrameType == JCFrameTypeRight) {
            x = frame.frameAttr.relateView.jc_right_value;
        }
        x = x * frame.multiplier + ((NSNumber*)frame.offset).doubleValue;
        frame.jc_equalTo(x);
        view.jc_x_value = x;
    }else{
        view.jc_x_value = ((NSNumber*)frame.value).doubleValue;
    }
}

void setRightByRightFrame(UIView*view,JCFrame*frame){
    if (frame.hasRelateAttr) {
        //right可以相对left,centerX,right
        CGFloat x = 0;
        if (frame.frameAttr.relateFrameType == JCFrameTypeLeft) {
            x = frame.frameAttr.relateView.jc_x_value;
        }else if (frame.frameAttr.relateFrameType == JCFrameTypeCenterX) {
            x = frame.frameAttr.relateView.jc_centerX_value;
        }else if (frame.frameAttr.relateFrameType == JCFrameTypeRight) {
            x = frame.frameAttr.relateView.jc_right_value;
        }
        x = (x - view.jc_width_value) * frame.multiplier + ((NSNumber*)frame.offset).doubleValue;
        frame.jc_equalTo(x);
        view.jc_x_value = x;
    }else{
        view.jc_x_value = view.superview.jc_width_value/*父容器宽度*/-view.jc_width_value/*宽度*/+((NSNumber*)frame.value).doubleValue/*右边距，负数*/;
    }
    
}

void setSizeBySizeFrame(UIView*view,JCFrame*frame){
    if (frame.hasRelateAttr) {
        //size只能相对size
        if (frame.frameAttr.relateFrameType == JCFrameTypeSize) {
            CGSize newSize = transToNewSize(frame.frameAttr.relateView.jc_size_value, frame.multiplier, frame.offset);
            frame.jc_equalTo(newSize);
            view.jc_size_value = newSize;
        }
    }
    else{
        view.jc_size_value = ((NSValue*)frame.value).CGSizeValue;
    }
}

void setCenterByCenterFrame(UIView*view,JCFrame*frame){
    if (frame.hasRelateAttr) {
        //center的相对值只能是center
        if(frame.frameAttr.relateFrameType == JCFrameTypeCenter){
            //1. 根据multiplier和offset获取新的center
            CGPoint newCenter = transToNewCenter(frame.frameAttr.relateView.jc_center_value,frame.multiplier,frame.offset);
            //2. 将新的值回填回去，因为center的value属性赋值
            frame.jc_equalTo(newCenter);
            //3. 设置新值
            view.jc_center_value = newCenter;
            
        }
    }else{
        view.jc_center_value = ((NSValue*)frame.value).CGPointValue;
    }
}

void setWidthByWidthFrame(UIView*view,JCFrame*frame){
    if (frame.hasRelateAttr) {
        if(frame.frameAttr.relateFrameType == JCFrameTypeWidth){
            //view2.width * 倍数 + 偏移量
            CGFloat newWidth = frame.frameAttr.relateView.jc_width_value * frame.multiplier + ((NSNumber*)frame.offset).doubleValue;
            //回填
            frame.jc_equalTo(newWidth);
            //设置
            view.jc_width_value = newWidth;
        }
    }else{
        view.jc_width_value = ((NSNumber*)frame.value).doubleValue;
    }
}

void setHeightByHeightFrame(UIView*view,JCFrame*frame){
    if (frame.hasRelateAttr) {
        //height只能相对height
        if(frame.frameAttr.relateFrameType == JCFrameTypeHeight){
            //计算新值
            CGFloat newHeight = frame.frameAttr.relateView.jc_height_value * frame.multiplier + ((NSNumber*)frame.offset).doubleValue;
            //回填
            frame.jc_equalTo(newHeight);
            //设置
            view.jc_height_value = newHeight;
        }
    }else{
        view.jc_height_value = ((NSNumber*)frame.value).doubleValue;
    }
}

void setCenterXByCenterXFrame(UIView*view,JCFrame*frame){
    if (frame.hasRelateAttr) {
        /**
         centerX相对值可以有left,centerX,right三个
         */
        CGFloat newCenterX = 0;
        if (frame.frameAttr.relateFrameType == JCFrameTypeLeft) {//Left
            newCenterX = frame.frameAttr.relateView.jc_x_value;
            
        }else if (frame.frameAttr.relateFrameType == JCFrameTypeCenterX) {//CenterX
            newCenterX = frame.frameAttr.relateView.jc_centerX_value;
            
        }else if (frame.frameAttr.relateFrameType == JCFrameTypeRight) {//Right
            newCenterX = frame.frameAttr.relateView.jc_right_value;
            
        }
        
        newCenterX = newCenterX * frame.multiplier + ((NSNumber*)frame.offset).doubleValue;
        frame.jc_equalTo(newCenterX);
        view.jc_centerX_value = newCenterX;
    }else{
        view.jc_centerX_value = ((NSNumber*)frame.value).doubleValue;
    }
}

void setCenterYByCenterYFrame(UIView*view,JCFrame*frame){
    if (frame.hasRelateAttr) {
        /**
         centerY相对值可以有top,centerY,bottom三个
         */
        CGFloat newCenterY = 0;
        if (frame.frameAttr.relateFrameType == JCFrameTypeTop) {//top
            newCenterY = frame.frameAttr.relateView.jc_y_value;
            
        }else if (frame.frameAttr.relateFrameType == JCFrameTypeCenterY) {//CenterY
            newCenterY = frame.frameAttr.relateView.jc_centerY_value;
            
        }else if (frame.frameAttr.relateFrameType == JCFrameTypeBottom) {//bottom
            newCenterY = frame.frameAttr.relateView.jc_bottom_value;
        }
        
        newCenterY = newCenterY * frame.multiplier + ((NSNumber*)frame.offset).doubleValue;
        
        frame.jc_equalTo(newCenterY);
        view.jc_centerY_value = newCenterY;
    }else{
        view.jc_centerY_value = ((NSNumber*)frame.value).doubleValue;
    }
}

void setTopByTopFrame(UIView*view,JCFrame*frame){
    if (frame.hasRelateAttr) {
        //top 可以相对 top,centerY,bottom
        CGFloat newTop = 0;
        if (frame.frameAttr.relateFrameType == JCFrameTypeTop) {
            newTop = frame.frameAttr.relateView.jc_y_value;
        }else if (frame.frameAttr.relateFrameType == JCFrameTypeCenterY) {
            newTop = frame.frameAttr.relateView.jc_centerY_value;
        }else if (frame.frameAttr.relateFrameType == JCFrameTypeBottom) {
            newTop = frame.frameAttr.relateView.jc_bottom_value;
        }
        newTop = newTop * frame.multiplier + ((NSNumber*)frame.offset).doubleValue;
        //回填
        frame.jc_equalTo(newTop);
        //设置
        view.jc_y_value = newTop;
    }else{
        view.jc_y_value = ((NSNumber*)frame.value).doubleValue;
    }
}

void setBottomByBottomFrame(UIView*view,JCFrame*frame){
    if (frame.hasRelateAttr) {
        //bottom可以相对top,centerY,bottom
        CGFloat y = 0;
        if (frame.frameAttr.relateFrameType == JCFrameTypeTop) { //Top
            y = frame.frameAttr.relateView.jc_y_value;
        }else if (frame.frameAttr.relateFrameType == JCFrameTypeCenterY) { //CenterY
            y = frame.frameAttr.relateView.jc_centerY_value;
        }else if (frame.frameAttr.relateFrameType == JCFrameTypeBottom) { //Bottom
            y = frame.frameAttr.relateView.jc_bottom_value;
        }
        y = (y - view.jc_height_value) * frame.multiplier + ((NSNumber*)frame.offset).doubleValue;
        frame.jc_equalTo(y);
        view.jc_y_value = y;
    }else{
        view.jc_y_value = view.superview.jc_height_value/*父容器高度*/ - view.jc_height_value/*高度*/ + ((NSNumber*)frame.value).doubleValue/*距离父容器底边距，一般为负数*/;
    }
}

#endif /* JCFrameExecutorMethods_h */

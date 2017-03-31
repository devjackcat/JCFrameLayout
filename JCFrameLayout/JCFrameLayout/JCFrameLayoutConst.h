//
//  JCFrameLayoutConst.h
//  JCFrameLayout
//
//  Created by abc on 17/3/28.
//  Copyright © 2017年 jackcat. All rights reserved.
//

#ifndef JCFrameLayoutConst_h
#define JCFrameLayoutConst_h

#define NOLOG 1

#ifdef NOLOG
#define JCLog( s,...)
#else
// #define NSLog( s, ...) NSLog(@"\nfunction:%s,line:%d %@",__FUNCTION__,__LINE__,[NSString stringWithFormat:(s), ##__VA_ARGS__]);
#define JCLog(format, ...) printf("\n%s,line:%d %s ",__FUNCTION__,__LINE__,[[NSString stringWithFormat:(format), ##__VA_ARGS__] UTF8String])
#endif


/**
 水平布局组合类型

 - HorizontalFrameGroupTypeCenterXAndWidth: CenterX 和 Width
 - HorizontalFrameGroupTypeLeftAndRight: Left 和 Right
 - HorizontalFrameGroupTypeLeftAndWidth: Left 和 Width
 - HorizontalFrameGroupTypeWidthAndRight: Width 和 Right
 - HorizontalFrameGroupTypeUnAssigned: 未设置
 */
typedef NS_ENUM(NSUInteger, HorizontalFrameGroupType) {
    HorizontalFrameGroupTypeCenterXAndWidth = 1,
    HorizontalFrameGroupTypeLeftAndRight = 2,
    HorizontalFrameGroupTypeLeftAndWidth = 3,
    HorizontalFrameGroupTypeWidthAndRight = 4,
    HorizontalFrameGroupTypeUnAssigned = 0
};


/**
 垂直布局组合类型

 - VerticalFrameGroupTypeCenterYAndHeight: CenterY 和 Height
 - VerticalFrameGroupTypeTopAndBottom: Top 和 Bottom
 - VerticalFrameGroupTypeTopAndHeight: Top 和 Height
 - VerticalFrameGroupTypeHeightAndBottom: Height 和 Bottom
 - VerticalFrameGroupTypeUnAssigned: 未设置
 */
typedef NS_ENUM(NSUInteger, VerticalFrameGroupType) {
    VerticalFrameGroupTypeCenterYAndHeight = 1,
    VerticalFrameGroupTypeTopAndBottom = 2,
    VerticalFrameGroupTypeTopAndHeight = 3,
    VerticalFrameGroupTypeHeightAndBottom = 4,
    VerticalFrameGroupTypeUnAssigned = 0
};


/**
 布局类型
 */
typedef NS_OPTIONS(NSUInteger, JCFrameType) {
    JCFrameTypeLeft = 1 << 0,
    JCFrameTypeRight = 1 << 1,
    JCFrameTypeTop = 1 << 2,
    JCFrameTypeBottom = 1 << 3,
    JCFrameTypeWidth = 1 << 4,
    JCFrameTypeHeight = 1 << 5,
    JCFrameTypeCenterX = 1 << 6,
    JCFrameTypeCenterY = 1 << 7,
    JCFrameTypeCenter = 1 << 8,
    JCFrameTypeSize = 1 << 9
};

#endif /* JCFrameLayoutConst_h */

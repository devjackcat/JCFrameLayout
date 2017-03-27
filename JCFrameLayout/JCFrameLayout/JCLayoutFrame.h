//
//  JCLayoutFrame.h
//  JCFrameLayout
//
//  Created by abc on 17/3/27.
//  Copyright © 2017年 jackcat. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, JCLayoutFrameType) {
    JCLayoutFrameTypeLeft,
    JCLayoutFrameTypeRight,
    JCLayoutFrameTypeTop,
    JCLayoutFrameTypeWidth,
    JCLayoutFrameTypeHeight
};

@interface JCLayoutFrame : NSObject

/**
 *  <#注释#>
 **/
@property (nonatomic,assign,readonly) JCLayoutFrameType frameType;

/**
 *  <#注释#>
 **/
@property (nonatomic,weak,readonly) UIView *view;

- (instancetype)initWithFrameType:(JCLayoutFrameType)frameType view:(UIView*)view;

- (JCLayoutFrame*(^)(id))jc_equalTo;

- (BOOL)executeLayout;

@end

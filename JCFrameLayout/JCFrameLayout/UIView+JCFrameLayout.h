//
//  UIView+JCFrameLayout.h
//  JCFrameLayout
//
//  Created by abc on 17/3/27.
//  Copyright © 2017年 jackcat. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "JCFrameMake.h"

#define JC_SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define JC_SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

@interface UIView (JCFrameLayout)

- (void)jc_makeLayout:(void(^)(JCFrameMake *make))block;

/**
 重新布局
 */
- (void)jc_updateLayout;

@end

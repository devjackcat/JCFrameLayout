//
//  UIView+JCFrameLayout.h
//  JCFrameLayout
//
//  Created by abc on 17/3/27.
//  Copyright © 2017年 jackcat. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "JCFrameMake.h"

@interface UIView (JCFrameLayout)

- (void)jc_makeLayout:(void(^)(JCFrameMake *make))block;

@end

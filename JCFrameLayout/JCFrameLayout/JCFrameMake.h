//
//  JCLayoutMaker.h
//  JCFrameLayout
//
//  Created by abc on 17/3/27.
//  Copyright © 2017年 jackcat. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "JCFrame.h"
#import "JCFrameLayoutConst.h"

@interface JCFrameMake : NSObject

- (instancetype)initWithView:(UIView*)view;

- (JCFrame*)left;
- (JCFrame*)right;
- (JCFrame*)top;
- (JCFrame*)bottom;
- (JCFrame*)width;
- (JCFrame*)height;
- (JCFrame*)centerX;
- (JCFrame*)centerY;
- (JCFrame*)center;
- (JCFrame*)size;

- (void)executeLayout;

@end

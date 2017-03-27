//
//  JCLayoutMaker.h
//  JCFrameLayout
//
//  Created by abc on 17/3/27.
//  Copyright © 2017年 jackcat. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "JCLayoutFrame.h"

@interface JCFrameMaker : NSObject

- (instancetype)initWithView:(UIView*)view;

- (JCLayoutFrame*)left;
- (JCLayoutFrame*)top;
- (JCLayoutFrame*)width;
- (JCLayoutFrame*)height;

- (void)executeLayout;

@end

//
//  JCFrameExecutor.h
//  JCFrameLayout
//
//  Created by abc on 17/3/29.
//  Copyright © 2017年 jackcat. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "JCFrameLayoutConst.h"
#import "JCFrame.h"

@interface JCFrameExecutor : NSObject

+ (void)executeWithView:(UIView*)view
             frameTypes:(JCFrameType)frameTypes;

@end

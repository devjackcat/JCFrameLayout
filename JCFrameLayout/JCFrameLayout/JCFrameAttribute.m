//
//  JCFrameAttribute.m
//  JCFrameLayout
//
//  Created by abc on 17/3/30.
//  Copyright © 2017年 jackcat. All rights reserved.
//

#import "JCFrameAttribute.h"

@implementation JCFrameAttribute

- (instancetype)initWithView:(UIView*)currentView frameType:(JCFrameType)currentFrameType{
    self = [super init];
    if (self) {
        self.currentView = currentView;
        self.currentFrameType = currentFrameType;
    }
    return self;
    
}


- (NSString*)currentTypeString{
    
    switch (self.currentFrameType) {
        case JCFrameTypeLeft:return @"Left"; break;
        case JCFrameTypeRight:return @"Right"; break;
        case JCFrameTypeTop:return @"Top"; break;
        case JCFrameTypeBottom:return @"Bottom"; break;
        case JCFrameTypeWidth:return @"Width"; break;
        case JCFrameTypeHeight:return @"Height"; break;
        case JCFrameTypeCenterX:return @"CenterX"; break;
        case JCFrameTypeCenterY:return @"CenterY"; break;
        case JCFrameTypeCenter:return @"Center"; break;
        case JCFrameTypeSize:return @"Size"; break;
            
        default:return @"UnKnow";break;
    }
}

@end

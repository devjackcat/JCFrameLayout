//
//  JCFrame.m
//  JCFrameLayout
//
//  Created by abc on 17/3/27.
//  Copyright © 2017年 jackcat. All rights reserved.
//

#import "JCFrame.h"

#import "UIView+JCFrame.h"

@interface JCFrame ()

@end

@implementation JCFrame

- (instancetype)initWithView:(UIView*)view frameType:(JCFrameType)frameType{
    self = [super init];
    if (self) {
        self->_frameType = frameType;
        self->_view = view;
        [self.view.jc_frames addObject:self];
    }
    return self;
}


- (JCFrame*(^)(id))jc_equalTo{
    return ^id(id value){
        self->_value = value;
        return self;
    };
}

- (NSString *)description{
    
    return [NSString stringWithFormat:@"[JCFrame: type=%@]",self. typeString];
    
}

- (void)dealloc{
    JCLog(@"---JCFrame dealloc %@ , %@",self.typeString,self.value);
}

- (NSString*)typeString{
    switch (self.frameType) {
            case JCFrameTypeLeft:return @"Left"; break;
            case JCFrameTypeRight:return @"Right"; break;
            case JCFrameTypeTop:return @"Top"; break;
            case JCFrameTypeBottom:return @"Bottom"; break;
            case JCFrameTypeWidth:return @"Width"; break;
            case JCFrameTypeHeight:return @"Height"; break;
            case JCFrameTypeCenterX:return @"CenterX"; break;
            case JCFrameTypeCenterY:return @"CenterY"; break;
        default:return @"UnKnow";break;
    }
}


@end

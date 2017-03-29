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

/**
 *  <#注释#>
 **/
@property (nonatomic,weak) JCFrame *chainParentFrame;

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

- (JCFrame*(^)(id))equalTo{
    return ^id(id value){
        self->_value = value;
        JCFrame *currentFrame = self;
        while (currentFrame.chainParentFrame) {
            currentFrame.chainParentFrame->_value = value;
            currentFrame = currentFrame.chainParentFrame;
        }
        return self;
    };
}

- (JCFrame*(^)(id))jc_equalTo{
    return self.equalTo;
}

#pragma mark - support chainable syntax
- (JCFrame *)left{
    return [self createJCLayoutFrame:JCFrameTypeLeft];
}
- (JCFrame *)right{
    return [self createJCLayoutFrame:JCFrameTypeRight];
}
- (JCFrame *)top{
    return [self createJCLayoutFrame:JCFrameTypeTop];
}
- (JCFrame *)bottom{
    return [self createJCLayoutFrame:JCFrameTypeBottom];
}
- (JCFrame *)width{
    return [self createJCLayoutFrame:JCFrameTypeWidth];
}
- (JCFrame *)height{
    return [self createJCLayoutFrame:JCFrameTypeHeight];
}
- (JCFrame *)centerX{
    return [self createJCLayoutFrame:JCFrameTypeCenterX];
}
- (JCFrame *)centerY{
    return [self createJCLayoutFrame:JCFrameTypeCenterY];
}
- (JCFrame *)center{
    return [self createJCLayoutFrame:JCFrameTypeCenter];
}
- (JCFrame*)size{
    return [self createJCLayoutFrame:JCFrameTypeSize];
}

- (JCFrame *)createJCLayoutFrame:(JCFrameType)frameType{
    if (self.delegate && [self.delegate respondsToSelector:@selector(jcFrame:createFrameWithframeType:)]) {
        JCFrame *frame = [self.delegate jcFrame:self createFrameWithframeType:frameType];
        
        frame.chainParentFrame = self;
        
        return frame;
    }
    return nil;
}

- (NSString *)description{
    
    return [NSString stringWithFormat:@"[JCFrame: %p type=%@]",self,self. typeString];
    
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
        case JCFrameTypeCenter:return @"Center"; break;
        case JCFrameTypeSize:return @"Size"; break;
            
        default:return @"UnKnow";break;
    }
}

@end

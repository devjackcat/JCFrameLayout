//
//  JCLayoutFrame.m
//  JCFrameLayout
//
//  Created by abc on 17/3/27.
//  Copyright © 2017年 jackcat. All rights reserved.
//

#import "JCLayoutFrame.h"

#import "UIView+JCFrame.h"

@interface JCLayoutFrame ()
/**
 *  <#注释#>
 **/
@property (nonatomic,strong) id value;
@end

@implementation JCLayoutFrame

- (instancetype)initWithFrameType:(JCLayoutFrameType)frameType  view:(UIView*)view{
    self = [super init];
    if (self) {
        self->_frameType = frameType;
        self->_view = view;
        [self.view.jc_frames addObject:self];
    }
    return self;
}

- (JCLayoutFrame*(^)(id))jc_equalTo{
    return ^id(id value){
        self.value = value;
        return self;
    };
}

- (BOOL)executeLayout{
    switch (self.frameType) {
        case JCLayoutFrameTypeLeft:{
            self.view.jc_x_value = ((NSNumber*)self.value).floatValue;
            return YES;
        }
            break;
        case JCLayoutFrameTypeRight:{
            //需要计算 SuperView.width - self.view.width - left
            self.view.jc_x_value = ((NSNumber*)self.value).floatValue;
            return YES;
        }
            break;
        case JCLayoutFrameTypeTop:{
            self.view.jc_y_value = ((NSNumber*)self.value).floatValue;
            return YES;
        }
            break;
        case JCLayoutFrameTypeWidth:{
            self.view.jc_width_value = ((NSNumber*)self.value).floatValue;
            return YES;
        }
            break;
        case JCLayoutFrameTypeHeight:{
            self.view.jc_height_value = ((NSNumber*)self.value).floatValue;
            return YES;
        }
            break;
        default:
            //此处须给出错误提示
            return NO;
            break;
    }
    NSLog(@"self.view.frame = %@",[NSValue valueWithCGRect:self.view.frame]);
}

- (void)dealloc{
    NSLog(@"---JCLayoutFrame dealloc %p,%zd",self.view,self.frameType);
}

@end

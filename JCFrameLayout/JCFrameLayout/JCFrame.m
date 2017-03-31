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
 *  链表前驱
 *  e.g.
 *      make.left.top.jc_equal(100);
 *      当前对象为top时，chainPreviousFrame为left
 **/
@property (nonatomic,weak) JCFrame *chainPreviousFrame;

/**
 *  给UIView设置一个key值，用于方便调试
 *  UIView+JCFrame中已经定义了一个，这里的冗余是因为在delloc中获取不到UIView.jc_debug_key,UIView已经被释放
 **/
@property (nonatomic,copy) NSString *jc_debug_key;

@end

@implementation JCFrame

- (instancetype)initWithFrameAttribute:(JCFrameAttribute*)frameAttribute{
    self = [super init];
    if (self) {
        self->_frameAttr = frameAttribute;
        self->_multiplier = 1;
        self.jc_debug_key = frameAttribute.currentView.jc_debug_key;
    }
    return self;
}

- (JCFrame*(^)(id))equalTo{
    return ^id(id value){
        
        //NSValue(CGFloat\CGSize\CGPoint)
        //UIView
        //JCFrame
        
        /*
         make.left.equal(redView);
         
         */
        if([value isKindOfClass:NSNumber.class] //CGFloat
           || [value isKindOfClass:NSValue.class]) { //CGSize,CGPoint
            
            self->_value = value;
            
        }else if([value isKindOfClass:UIView.class]){
            self->_hasRelateAttr = YES;
            //如果传入UIView，则相对布局属性采用与本类相同的属性
            self.frameAttr.relateView = (UIView*)value;
            self.frameAttr.relateFrameType = self.frameAttr.currentFrameType;
            
        }else if([value isKindOfClass:JCFrameAttribute.class]){
            self->_hasRelateAttr = YES;
            //如果传入JCFrame，则相对布局属性采用与本类相同的属性
            self.frameAttr.relateView = ((JCFrameAttribute*)value).currentView;
            self.frameAttr.relateFrameType = ((JCFrameAttribute*)value).currentFrameType;
            
        }
        
        JCFrame *currentFrame = self;
        while (currentFrame.chainPreviousFrame) {
            currentFrame = currentFrame.chainPreviousFrame;
            currentFrame.equalTo(value);
        }
        return self;
    };
}
- (JCFrame*(^)(id))jc_equalTo{
    return self.equalTo;
}
- (JCFrame*(^)(id))jc_offset{
    return ^id(id value){
        self->_offset = value;
        
        JCFrame *currentFrame = self;
        while (currentFrame.chainPreviousFrame) {
            currentFrame = currentFrame.chainPreviousFrame;
            currentFrame->_offset=value;
        }
        return self;
    };
}
- (JCFrame*(^)(CGFloat))multipliedBy{
    return ^id(CGFloat value){
        self->_multiplier = value;
        
        JCFrame *currentFrame = self;
        while (currentFrame.chainPreviousFrame) {
            currentFrame = currentFrame.chainPreviousFrame;
            currentFrame->_multiplier = value;
        }
        return self;
    };
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

#pragma mark - private Method
/**
 通过代理(即JCFrameMake)创建JCFrame对象
 */
- (JCFrame *)createJCLayoutFrame:(JCFrameType)frameType{
    if (self.delegate && [self.delegate respondsToSelector:@selector(jcFrame:createFrameWithframeType:)]) {
        JCFrame *frame = [self.delegate jcFrame:self createFrameWithframeType:frameType];
        //把self设为链表前驱
        frame.chainPreviousFrame = self;
        return frame;
    }
    return nil;
}

- (NSString *)description{
    return [NSString stringWithFormat:@"[JCFrame: %@,%@,%@,%@]",self.jc_debug_key,self.frameAttr.currentTypeString,self.value,(self.actived?@"actived":@"ignored")];
}
- (void)dealloc{
    JCLog(@"---JCFrame dealloc %@,%@,%@,%@",self.jc_debug_key,self.frameAttr.currentTypeString,self.value,(self.actived?@"actived":@"ignored"));
}

@end

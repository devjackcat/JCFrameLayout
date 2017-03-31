//
//  JCLayoutMaker.m
//  JCFrameLayout
//
//  Created by abc on 17/3/27.
//  Copyright © 2017年 jackcat. All rights reserved.
//

#import "JCFrameMake.h"
#import "UIView+JCFrame.h"

#import "JCFrameExecutor.h"

@interface JCFrameMake ()<JCFrameDelegate>

/**
 *  <#注释#>
 **/
@property (nonatomic,weak) UIView *view;

/**
 *  <#注释#>
 **/
@property (nonatomic,assign) JCFrameType frameTypes;

@end

@implementation JCFrameMake

#pragma mark - init
- (instancetype)initWithView:(UIView *)view{
    self = [super init];
    if (self) {
        self.view = view;
    }
    return self;
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

#pragma mark - JCFrameDelegate
- (JCFrame*)jcFrame:(JCFrame *)jcFrame createFrameWithframeType:(JCFrameType)frameType{
    return [self createJCLayoutFrame:frameType];
}

- (JCFrame *)createJCLayoutFrame:(JCFrameType)frameType{

    if (self.frameTypes & frameType) {
        /**
         如果这个frameType已存在，则直接返回，反之创建
         */
        NSPredicate *predicate = [NSPredicate predicateWithBlock:^BOOL(JCFrame *frame, id obj) {
            return frame.frameAttr.currentFrameType == frameType;
        }];
        NSArray *filterResult = [self.view.jc_frames filteredArrayUsingPredicate:predicate];
        return filterResult.firstObject;
        
    }else{
        
        //1.将frameType标记为已存在
        self.frameTypes |= frameType;
        
        //2.创建JCFrameAttribute
        JCFrameAttribute *frameAttribute = [[JCFrameAttribute alloc]initWithView:self.view frameType:frameType];
        
        //3.创建JCFrame
        JCFrame *frame = [[JCFrame alloc]initWithFrameAttribute:frameAttribute];
        
        //4.设置JCFrame代理
        frame.delegate = self;
        
        //5.将JCFrame添加至UIView的jc_frames集合中
        [self.view.jc_frames addObject:frame];
        
        return frame;
    }
}

- (void)executeLayout{
    [JCFrameExecutor executeWithView:self.view
                          frameTypes:self.frameTypes];
    JCLog(@"--frames = %@",self.view.jc_frames);

}

- (void)dealloc{
    JCLog(@"---JCFrameMake dealloc");
}

@end

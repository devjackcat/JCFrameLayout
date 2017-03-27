//
//  JCLayoutMaker.m
//  JCFrameLayout
//
//  Created by abc on 17/3/27.
//  Copyright © 2017年 jackcat. All rights reserved.
//

#import "JCFrameMaker.h"
#import "UIView+JCFrame.h"

@interface JCFrameMaker ()

/**
 *  <#注释#>
 **/
@property (nonatomic,weak) UIView *view;

/**
 *  <#注释#>
 **/
@property (nonatomic,strong) NSMutableArray *failedFrames;

@end

@implementation JCFrameMaker

- (instancetype)initWithView:(UIView *)view{
    self = [super init];
    if (self) {
        self.view = view;
    }
    return self;
}

- (JCLayoutFrame *)left{
    return [self getJCLayoutFrame:JCLayoutFrameTypeLeft];
}
- (JCLayoutFrame *)top{
    return [self getJCLayoutFrame:JCLayoutFrameTypeTop];
}
- (JCLayoutFrame *)width{
    return [self getJCLayoutFrame:JCLayoutFrameTypeWidth];
}
- (JCLayoutFrame *)height{
    return [self getJCLayoutFrame:JCLayoutFrameTypeHeight];
}

- (JCLayoutFrame *)getJCLayoutFrame:(JCLayoutFrameType)frameType{
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"frameType=%d",frameType];
    NSArray *filterResult = [self.view.jc_frames filteredArrayUsingPredicate:predicate];
    if (filterResult && filterResult.count > 0) {
        return filterResult.firstObject;
    }else{
        return [[JCLayoutFrame alloc]initWithFrameType:frameType view:self.view];
    }
    
}

- (NSMutableArray *)failedFrames{
    if (!_failedFrames) {
        _failedFrames = [NSMutableArray array];
    }
    return _failedFrames;
}

- (void)executeLayout{
    for (JCLayoutFrame *frame in self.view.jc_frames) {
        [frame executeLayout];
    }
}

- (void)dealloc{
    NSLog(@"---JCFrameMaker dealloc");
}

@end

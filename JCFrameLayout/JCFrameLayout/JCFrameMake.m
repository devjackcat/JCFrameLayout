//
//  JCLayoutMaker.m
//  JCFrameLayout
//
//  Created by abc on 17/3/27.
//  Copyright © 2017年 jackcat. All rights reserved.
//

#import "JCFrameMake.h"
#import "UIView+JCFrame.h"



@interface JCFrameMake ()

/**
 *  <#注释#>
 **/
@property (nonatomic,weak) UIView *view;

/**
 *  水平布局组合类型
 **/
@property (nonatomic,assign) HorizontalFrameGroupType horizontalFrameGroupType;
/**
 *  垂直布局组合类型
 **/
@property (nonatomic,assign) VerticalFrameGroupType verticalFrameGroupType;

/**
 *  <#注释#>
 **/
@property (nonatomic,strong) NSArray<JCFrame*> *horizontalFrameGroup;
/**
 *  <#注释#>
 **/
@property (nonatomic,strong) NSArray<JCFrame*> *verticalFrameGroup;
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

/**
 group the frames which in self.view.jc_frames
 */
- (void)groudFrames{
    
    //1. horizontal group block
    void(^horizontalGroupBlock)() = ^{
        //1.1 centerX and width
        {
            JCFrame *centerXFrame = [self filterFrameWithFrameType:(JCFrameTypeCenterX)];
            JCFrame *widthFrame = [self filterFrameWithFrameType:(JCFrameTypeWidth)];
            
            if (centerXFrame && widthFrame) {
                self.horizontalFrameGroupType = HorizontalFrameGroupTypeCenterXAndWidth;
                self.horizontalFrameGroup = @[centerXFrame,widthFrame];
                return ;
            }
        }
        
        //1.2 left and right
        {
            JCFrame *leftFrame = [self filterFrameWithFrameType:(JCFrameTypeLeft)];
            JCFrame *rightFrame = [self filterFrameWithFrameType:(JCFrameTypeRight)];
            
            if (leftFrame && rightFrame) {
                self.horizontalFrameGroupType = HorizontalFrameGroupTypeLeftAndRight;
                self.horizontalFrameGroup = @[leftFrame,rightFrame];
                return ;
            }
        }
        
        //1.3 left and width
        {
            JCFrame *leftFrame = [self filterFrameWithFrameType:(JCFrameTypeLeft)];
            JCFrame *widthFrame = [self filterFrameWithFrameType:(JCFrameTypeWidth)];
            
            if (leftFrame && widthFrame) {
                self.horizontalFrameGroupType = HorizontalFrameGroupTypeLeftAndWidth;
                self.horizontalFrameGroup = @[leftFrame,widthFrame];
                return ;
            }
        }
        
        //1.4 width and right
        {
        
            JCFrame *widthFrame = [self filterFrameWithFrameType:(JCFrameTypeWidth)];
            JCFrame *rightFrame = [self filterFrameWithFrameType:(JCFrameTypeRight)];
            
            if (rightFrame && widthFrame) {
                self.horizontalFrameGroupType = HorizontalFrameGroupTypeWidthAndRight;
                self.horizontalFrameGroup = @[widthFrame,rightFrame];
                return ;
            }
        }
    };
    
    //2. vertical group block
    void(^verticalGroupBlock)() = ^{
        //2.1 centerY and height
        {
            JCFrame *centerYFrame = [self filterFrameWithFrameType:(JCFrameTypeCenterY)];
            JCFrame *heightFrame = [self filterFrameWithFrameType:(JCFrameTypeHeight)];
            
            if (centerYFrame && heightFrame) {
                self.verticalFrameGroupType = VerticalFrameGroupTypeCenterYAndHeight;
                self.verticalFrameGroup = @[centerYFrame,heightFrame];
                return ;
            }
        }

        //2.2 top and bottom
        {
            JCFrame *topFrame = [self filterFrameWithFrameType:(JCFrameTypeTop)];
            JCFrame *bottomFrame = [self filterFrameWithFrameType:(JCFrameTypeBottom)];
            
            if (topFrame && bottomFrame) {
                self.verticalFrameGroupType = VerticalFrameGroupTypeTopAndBottom;
                self.verticalFrameGroup = @[topFrame,bottomFrame];
                return ;
            }
        }
        
        //2.3 top and height
        {
            JCFrame *topFrame = [self filterFrameWithFrameType:(JCFrameTypeTop)];
            JCFrame *heightFrame = [self filterFrameWithFrameType:(JCFrameTypeHeight)];
            
            if (topFrame && heightFrame) {
                self.verticalFrameGroupType = VerticalFrameGroupTypeTopAndHeight;
                self.verticalFrameGroup = @[topFrame,heightFrame];
                return ;
            }
        }
        
        //2.4 height and bottom
        {
            JCFrame *heightFrame = [self filterFrameWithFrameType:(JCFrameTypeHeight)];
            JCFrame *bottomFrame = [self filterFrameWithFrameType:(JCFrameTypeBottom)];
            
            if (heightFrame && bottomFrame) {
                self.verticalFrameGroupType = VerticalFrameGroupTypeHeightAndBottom;
                self.verticalFrameGroup = @[heightFrame,bottomFrame];
                return ;
            }
        }
    };
    
    horizontalGroupBlock();
    verticalGroupBlock();
}

- (JCFrame *)createJCLayoutFrame:(JCFrameType)frameType{
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"frameType=%d",frameType];
    NSArray *filterResult = [self.view.jc_frames filteredArrayUsingPredicate:predicate];
    if (filterResult && filterResult.count > 0) {
        return filterResult.firstObject;
    }else{
        return [[JCFrame alloc]initWithView:self.view frameType:frameType];
    }
    
}

- (JCFrame*)filterFrameWithFrameType:(JCFrameType)frameType{
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:[NSString stringWithFormat:@"frameType=%zd",frameType]];
    
    NSArray *result = [self.view.jc_frames filteredArrayUsingPredicate:predicate];

    return (result && result.count > 0) ? result.firstObject : nil;
    
}

- (void)executeLayout{
    
    //1. groudFrames
    [self groudFrames];
    
    JCLog(@"horizontal = %@,%@",self.horizontalFrameGroupTypeString,self.horizontalFrameGroup );
    JCLog(@"vertical = %@,%@",self.verticalFrameGroupTypeString,self.verticalFrameGroup );
    
    //2.执行水平布局
    [self executeHorizontalLayout];
    
    //3.执行垂直布局
    [self executeVerticalLayout];
}

- (void)executeHorizontalLayout{
    switch (self.horizontalFrameGroupType) {
        case HorizontalFrameGroupTypeCenterXAndWidth:{
            JCFrame *centerXFrame = self.horizontalFrameGroup[0];
            JCFrame *widthFrame = self.horizontalFrameGroup[1];
            self.view.jc_width_value = ((NSNumber*)widthFrame.value).doubleValue;
            self.view.jc_centerX_value = ((NSNumber*)centerXFrame.value).doubleValue;
        }
            break;
        case HorizontalFrameGroupTypeLeftAndRight:{
            
            JCFrame *leftFrame = self.horizontalFrameGroup[0];
            JCFrame *rightFrame = self.horizontalFrameGroup[1];
            
            self.view.jc_x_value = ((NSNumber*)leftFrame.value).doubleValue;
            self.view.jc_width_value = self.view.superview.jc_width_value/*父容器宽度*/ - self.view.jc_x_value/*当前容器x坐标*/ + ((NSNumber*)rightFrame.value).doubleValue;/*距离父容器右边距，一般为负数*/;
        }
            break;
        case HorizontalFrameGroupTypeLeftAndWidth:{
            JCFrame *leftFrame = self.horizontalFrameGroup[0];
            JCFrame *widthFrame = self.horizontalFrameGroup[1];
            
            self.view.jc_x_value = ((NSNumber*)leftFrame.value).doubleValue;
            self.view.jc_width_value = ((NSNumber*)widthFrame.value).doubleValue;
        }
            break;
        case HorizontalFrameGroupTypeWidthAndRight:{
            JCFrame *widthFrame = self.horizontalFrameGroup[0];
            JCFrame *rightFrame = self.horizontalFrameGroup[1];
            
            self.view.jc_x_value = self.view.superview.jc_width_value/*父容器宽度*/ - ((NSNumber*)widthFrame.value).doubleValue/*宽度*/ + ((NSNumber*)rightFrame.value).doubleValue/*距离父容器右边距，一般为负数*/;
            self.view.jc_width_value = ((NSNumber*)widthFrame.value).doubleValue;
        }
            break;
        default:
            break;
    }
}
- (void)executeVerticalLayout{
    switch (self.verticalFrameGroupType) {
        case VerticalFrameGroupTypeCenterYAndHeight:{
            JCFrame *centerYFrame = self.verticalFrameGroup[0];
            JCFrame *heightFrame = self.verticalFrameGroup[1];
            self.view.jc_height_value = ((NSNumber*)heightFrame.value).doubleValue;
            self.view.jc_centerY_value = ((NSNumber*)centerYFrame.value).doubleValue;
        }
            break;
        case VerticalFrameGroupTypeTopAndBottom:{
            
            JCFrame *topFrame = self.verticalFrameGroup[0];
            JCFrame *bottomFrame = self.verticalFrameGroup[1];
            
            self.view.jc_y_value = ((NSNumber*)topFrame.value).doubleValue;
            self.view.jc_height_value = self.view.superview.jc_height_value/*父容器高度*/ - self.view.jc_y_value/*当前容器y坐标*/ + ((NSNumber*)bottomFrame.value).doubleValue;/*距离父容器底边距，一般为负数*/;
        }
            break;
        case VerticalFrameGroupTypeTopAndHeight:{
            JCFrame *topFrame = self.verticalFrameGroup[0];
            JCFrame *heightFrame = self.verticalFrameGroup[1];
            
            self.view.jc_y_value = ((NSNumber*)topFrame.value).doubleValue;
            self.view.jc_height_value = ((NSNumber*)heightFrame.value).doubleValue;
        }
            break;
        case VerticalFrameGroupTypeHeightAndBottom:{
            JCFrame *heightFrame = self.verticalFrameGroup[0];
            JCFrame *bottomFrame = self.verticalFrameGroup[1];
            
            self.view.jc_y_value = self.view.superview.jc_height_value/*父容器高度*/ - ((NSNumber*)heightFrame.value).doubleValue/*高度*/ + ((NSNumber*)bottomFrame.value).doubleValue/*距离父容器底边距，一般为负数*/;
            self.view.jc_height_value = ((NSNumber*)heightFrame.value).doubleValue;
        }
            break;
        default:
            break;
    }
}

- (NSString*)horizontalFrameGroupTypeString{
    switch (self.horizontalFrameGroupType) {
        case HorizontalFrameGroupTypeCenterXAndWidth:return @"CenterXAndWidth"; break;
        case HorizontalFrameGroupTypeLeftAndRight:return @"LeftAndRight"; break;
        case HorizontalFrameGroupTypeLeftAndWidth:return @"LeftAndWidth"; break;
        case HorizontalFrameGroupTypeWidthAndRight:return @"WidthAndRight"; break;
        default:return @"UnKnow";break;
    }
}
- (NSString*)verticalFrameGroupTypeString{
    switch (self.verticalFrameGroupType) {
        case VerticalFrameGroupTypeCenterYAndHeight:return @"CenterYAndHeight"; break;
        case VerticalFrameGroupTypeTopAndBottom:return @"TopAndBottom"; break;
        case VerticalFrameGroupTypeTopAndHeight:return @"TopAndHeight"; break;
        case VerticalFrameGroupTypeHeightAndBottom:return @"HeightAndBottom"; break;
        default:return @"UnKnow";break;
    }
}

- (void)dealloc{
    JCLog(@"---JCFrameMake dealloc");
}

@end

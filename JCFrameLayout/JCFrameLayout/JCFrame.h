//
//  JCFrame.h
//  JCFrameLayout
//
//  Created by abc on 17/3/27.
//  Copyright © 2017年 jackcat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JCFrameLayoutConst.h"


@interface JCFrame : NSObject

/**
 *  布局类型
 **/
@property (nonatomic,assign,readonly) JCFrameType frameType;
/**
 *  <#注释#>
 **/
@property (nonatomic,strong,readonly) id value;

/**
 *  布局的对象UIView
 **/
@property (nonatomic,weak,readonly) UIView *view;

- (instancetype)initWithView:(UIView*)view frameType:(JCFrameType)frameType;

- (JCFrame*(^)(id))jc_equalTo;

@end

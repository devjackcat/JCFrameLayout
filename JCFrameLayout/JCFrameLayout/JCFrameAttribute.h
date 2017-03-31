//
//  JCFrameAttribute.h
//  JCFrameLayout
//
//  Created by abc on 17/3/30.
//  Copyright © 2017年 jackcat. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "JCFrameLayoutConst.h"

@interface JCFrameAttribute : NSObject

/**
 *  当前需要布局的UIView
 **/
@property (nonatomic,weak) UIView *currentView;
/**
 *  当前需要布局的属性
 **/
@property (nonatomic,assign) JCFrameType currentFrameType;
/**
 *  相对于哪个UIView进行布局
 **/
@property (nonatomic,weak) UIView *relateView;
/**
 *  相对于哪个UIView的哪个属性进行布局
 **/
@property (nonatomic,assign) JCFrameType relateFrameType;

- (instancetype)initWithView:(UIView*)currentView frameType:(JCFrameType)currentFrameType;

- (NSString*)currentTypeString;
@end

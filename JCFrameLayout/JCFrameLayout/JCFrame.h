//
//  JCFrame.h
//  JCFrameLayout
//
//  Created by abc on 17/3/27.
//  Copyright © 2017年 jackcat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JCFrameLayoutConst.h"
#import "JCFrameUtilities.h"
#import "JCFrameAttribute.h"

@class JCFrame;

@protocol JCFrameDelegate <NSObject>

- (JCFrame*)jcFrame:(JCFrame*)jcFrame createFrameWithframeType:(JCFrameType)frameType;

@end

@interface JCFrame : NSObject

@property (nonatomic,weak) id<JCFrameDelegate> delegate;

/**
 *  当前属性的值
 **/
@property (nonatomic,strong,readonly) id value;
/**
 *  当前属性的偏移值，只在相对布局的时候生效
 **/
@property (nonatomic,strong,readonly) id offset;
/**
 *  当前属性的倍数，只在相对布局的时候生效
 **/
@property (nonatomic,assign,readonly) CGFloat multiplier;

/**
 *  是否生效，便于调试，没其他用处
 **/
@property (nonatomic,assign) BOOL actived;
/**
 *  是否有相对属性
 **/
@property (nonatomic,assign,readonly) BOOL hasRelateAttr;

/**
 *  布局属性
 **/
@property (nonatomic,strong,strong) JCFrameAttribute *frameAttr;


- (instancetype)initWithFrameAttribute:(JCFrameAttribute*)frameAttribute;


- (JCFrame*)left;
- (JCFrame*)right;
- (JCFrame*)top;
- (JCFrame*)bottom;
- (JCFrame*)width;
- (JCFrame*)height;
- (JCFrame*)centerX;
- (JCFrame*)centerY;
- (JCFrame*)center;
- (JCFrame*)size;

#define jc_equalTo(...)                 equalTo(JCBoxValue((__VA_ARGS__)))
#define jc_offset(...)                 jc_offset(JCBoxValue((__VA_ARGS__)))

- (JCFrame*(^)(id))jc_equalTo;
- (JCFrame*(^)(id))equalTo;
- (JCFrame*(^)(CGFloat))multipliedBy;
- (JCFrame*(^)(id))jc_offset;

@end

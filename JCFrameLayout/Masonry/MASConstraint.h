//
//  MASConstraint.h
//  Masonry
//
//  Created by Jonas Budelmann on 22/07/13.
//  Copyright (c) 2013 cloudling. All rights reserved.
//

#import "MASUtilities.h"

/**
 *	Enables Constraints to be created with chainable syntax
 *  Constraint can represent single NSLayoutConstraint (MASViewConstraint) 
 *  or a group of NSLayoutConstraints (MASComposisteConstraint)
 */
@interface MASConstraint : NSObject

#pragma mark - NSLayoutConstraint constant proxies
- (MASConstraint * (^)(MASEdgeInsets insets))insets;
- (MASConstraint * (^)(CGSize offset))sizeOffset;
- (MASConstraint * (^)(CGPoint offset))centerOffset;
- (MASConstraint * (^)(CGFloat offset))offset;
- (MASConstraint * (^)(NSValue *value))valueOffset;
- (MASConstraint * (^)(CGFloat multiplier))multipliedBy;
- (MASConstraint * (^)(CGFloat divider))dividedBy;

#pragma mark - MASLayoutPriority proxies
- (MASConstraint * (^)(MASLayoutPriority priority))priority;
- (MASConstraint * (^)())priorityLow;
- (MASConstraint * (^)())priorityMedium;
- (MASConstraint * (^)())priorityHigh;

#pragma mark - NSLayoutRelation proxies
- (MASConstraint * (^)(id attr))equalTo;
- (MASConstraint * (^)(id attr))greaterThanOrEqualTo;
- (MASConstraint * (^)(id attr))lessThanOrEqualTo;

#pragma mark - Semantic properties
- (MASConstraint *)with;
- (MASConstraint *)and;

#pragma mark - Chaining
- (MASConstraint *)left;
- (MASConstraint *)top;
- (MASConstraint *)right;
- (MASConstraint *)bottom;
- (MASConstraint *)leading;
- (MASConstraint *)trailing;
- (MASConstraint *)width;
- (MASConstraint *)height;
- (MASConstraint *)centerX;
- (MASConstraint *)centerY;
- (MASConstraint *)baseline;
- (MASConstraint *)leftMargin;
- (MASConstraint *)rightMargin;
- (MASConstraint *)topMargin;
- (MASConstraint *)bottomMargin;
- (MASConstraint *)leadingMargin;
- (MASConstraint *)trailingMargin;
- (MASConstraint *)centerXWithinMargins;
- (MASConstraint *)centerYWithinMargins;


#pragma mark - Abstract
- (MASConstraint * (^)(id key))key;
- (void)setInsets:(MASEdgeInsets)insets;
- (void)setSizeOffset:(CGSize)sizeOffset;
- (void)setCenterOffset:(CGPoint)centerOffset;
- (void)setOffset:(CGFloat)offset;

- (void)activate;
- (void)deactivate;
- (void)install;
- (void)uninstall;

@end


/**
 *  Convenience auto-boxing macros for MASConstraint methods.
 *
 *  Defining MAS_SHORTHAND_GLOBALS will turn on auto-boxing for default syntax.
 *  A potential drawback of this is that the unprefixed macros will appear in global scope.
 */
#define mas_equalTo(...)                 equalTo(MASBoxValue((__VA_ARGS__)))
#define mas_greaterThanOrEqualTo(...)    greaterThanOrEqualTo(MASBoxValue((__VA_ARGS__)))
#define mas_lessThanOrEqualTo(...)       lessThanOrEqualTo(MASBoxValue((__VA_ARGS__)))

#define mas_offset(...)                  valueOffset(MASBoxValue((__VA_ARGS__)))


#ifdef MAS_SHORTHAND_GLOBALS

#define equalTo(...)                     mas_equalTo(__VA_ARGS__)
#define greaterThanOrEqualTo(...)        mas_greaterThanOrEqualTo(__VA_ARGS__)
#define lessThanOrEqualTo(...)           mas_lessThanOrEqualTo(__VA_ARGS__)

#define offset(...)                      mas_offset(__VA_ARGS__)

#endif


@interface MASConstraint (AutoboxingSupport)

/**
 *  Aliases to corresponding relation methods (for shorthand macros)
 *  Also needed to aid autocompletion
 */
- (MASConstraint * (^)(id attr))mas_equalTo;
- (MASConstraint * (^)(id attr))mas_greaterThanOrEqualTo;
- (MASConstraint * (^)(id attr))mas_lessThanOrEqualTo;

/**
 *  A dummy method to aid autocompletion
 */
- (MASConstraint * (^)(id offset))mas_offset;

@end

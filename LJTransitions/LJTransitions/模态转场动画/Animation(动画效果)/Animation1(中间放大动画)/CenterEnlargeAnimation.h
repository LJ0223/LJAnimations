//
//  CenterEnlargeAnimation.h
//  LJTransitions
//
//  Created by 罗金 on 16/4/8.
//  Copyright © 2016年 EasyFlower. All rights reserved.
//

#import "HYBBaseTransition.h"

@interface CenterEnlargeAnimation : HYBBaseTransition

/**
 * The color of the bubble. It should be the destination controller's
 * background color, so that it could look much better.
 */
@property (nonatomic, strong) UIColor *bubbleColor;

/**
 * The start point for the beginning of a bubble and it will shrink
 * to this point when dismiss.
 *
 * Default value is {toView.size.width / 2, toView.size.height}
 *
 * Though here supports default value, you should set a starting point
 * so that it can bubble from your settring point.
 */
@property (nonatomic, assign) CGPoint bubbleStartPoint;

@property (nonatomic, assign) CGRect bubbleStartFrame;

@end

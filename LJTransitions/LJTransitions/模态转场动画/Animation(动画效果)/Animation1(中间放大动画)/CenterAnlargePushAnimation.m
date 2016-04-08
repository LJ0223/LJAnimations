//
//  CenterAnlargePushAnimation.m
//  LJTransitions
//
//  Created by 罗金 on 16/4/8.
//  Copyright © 2016年 EasyFlower. All rights reserved.
//

#import "CenterAnlargePushAnimation.h"

@interface CenterAnlargePushAnimation ()

@property (nonatomic, strong) UIView *bubbleView;

@end

@implementation CenterAnlargePushAnimation

- (instancetype)initWithPushed:(HYBTransitionPush)pushCallback poped:(HYBTransitionPop)popCallback
{
    self = [super initWithPushed:pushCallback poped:popCallback];
    if (self) {
        self.bubbleStartPoint = (CGPoint){NSNotFound, NSNotFound};
    }
    return self;
}

#pragma mark - UIViewControllerContextTransitioning
- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    CGFloat scale = 1.0 / 7.0;
    UIView *containerView = [transitionContext containerView];
    
    if (containerView == nil) {
        return;
    }
    
    /*
     *  先判断跳转类型
     *  kHYBTransitionDismiss, // Dismiss
     *  kHYBTransitionPresent, // Present
     *  kHYBTransitionPush,    // Push
     *  kHYBTransitionPop      // Pop
     */
    if (self.transitionMode == kHYBTransitionPush) {
        UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
        CGPoint toViewDestinationCenter = toView.center;
        self.bubbleView = [[UIView alloc] init];
        self.bubbleView.backgroundColor = self.bubbleColor;
        self.bubbleView.frame = toView.frame;
        self.bubbleView.transform = CGAffineTransformMakeScale(1, scale);
        self.bubbleView.center = self.bubbleStartPoint;
        
        toView.transform = CGAffineTransformMakeScale(1, scale);
        toView.center = self.bubbleStartPoint;
        
        [containerView addSubview:toView];
        [containerView addSubview:self.bubbleView];
        
        [UIView animateWithDuration:self.duration animations:^{
            toView.transform = CGAffineTransformIdentity;
            toView.center = toViewDestinationCenter;
            self.bubbleView.transform = CGAffineTransformIdentity;
            self.bubbleView.alpha = 0;
        } completion:^(BOOL finished) {
            [self.bubbleView removeFromSuperview];
            [transitionContext completeTransition:finished];
        }];
        
    } else if (self.transitionMode == kHYBTransitionPop) {
        UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
        CGPoint fromViewCenter = fromView.center;
        CGPoint startPoint = self.bubbleStartPoint;
        self.bubbleView.frame = self.bubbleStartFrame;
        self.bubbleView.layer.cornerRadius = self.bubbleView.frame.size.height / 2;
        self.bubbleView.center = startPoint;
        
        [UIView animateWithDuration:self.duration animations:^{
            self.bubbleView.transform = CGAffineTransformMakeScale(1, 0.001);
            fromView.transform = CGAffineTransformMakeScale(1, 0.001);
            fromView.alpha = 0.0;
            fromView.center = startPoint;
        } completion:^(BOOL finished) {
            fromView.center = fromViewCenter;
            [fromView removeFromSuperview];
            [self.bubbleView removeFromSuperview];
            [transitionContext completeTransition:finished];
        }];
        
    }

}

@end

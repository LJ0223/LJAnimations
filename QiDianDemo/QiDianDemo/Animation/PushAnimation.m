//
//  PushAnimation.m
//  QiDianDemo
//
//  Created by iShareme on 15/10/13.
//  Copyright © 2015年 iShareme. All rights reserved.
//

#import "PushAnimation.h"
#import "ViewController.h"
#import "MainViewController.h"
#import "MainCell.h"
#import "MainCollectionViewCell.h"

@implementation PushAnimation

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.4f;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    // 1.获取动画的源控制器和目标控制器
    MainViewController *toVC = (MainViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    ViewController *formVC = (ViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIView *containerView = [transitionContext containerView];
    
    // 创建一些变量
    UIView *snapshotView = [formVC.selectedCell.mainImageV snapshotViewAfterScreenUpdates:false];
    snapshotView.frame = [containerView convertRect:formVC.selectedCell.mainImageV.frame fromView:formVC.selectedCell];
    
    formVC.selectedCell.mainImageV.hidden = YES;
    
    //3.设置目标控制器的位置，并把透明度设为0，在后面的动画中慢慢显示出来变为1
    toVC.view.frame = [transitionContext finalFrameForViewController:toVC];
    toVC.view.alpha = 0;
    
    [containerView addSubview:toVC.view];
    [containerView addSubview:snapshotView];
    
    // 3.push
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
//        snapshotView.frame = toVC.avatarImageView.frame;
        snapshotView.frame = toVC.mainSelectedCell.videoImageV.frame;
        snapshotView.frame = CGRectMake(snapshotView.frame.origin.x, 32, snapshotView.frame.size.width, snapshotView.frame.size.height);
        toVC.view.alpha = 1;
    } completion:^(BOOL finished) {
        formVC.selectedCell.mainImageV.hidden = false;
        toVC.mainSelectedCell.videoImageV.image = toVC.image;
        [snapshotView removeFromSuperview];
        
        //一定要记得动画完成后执行此方法，让系统管理 navigation
        [transitionContext completeTransition:YES];
    }];
    
    
    
}
@end

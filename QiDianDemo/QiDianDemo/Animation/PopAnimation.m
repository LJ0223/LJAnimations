//
//  PopAnimation.m
//  QiDianDemo
//
//  Created by iShareme on 15/10/13.
//  Copyright © 2015年 iShareme. All rights reserved.
//

#import "PopAnimation.h"
#import "ViewController.h"
#import "MainViewController.h"
#import "MainCell.h"
#import "MainCollectionViewCell.h"
@implementation PopAnimation
- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.4f;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    // 1.获取动画的源控制器和目标控制器
    ViewController *toVC = (ViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    MainViewController *formVC = (MainViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIView *containerView = [transitionContext containerView];
    
    // 创建一些变量
    UIView *snapshotView = [formVC.mainSelectedCell.videoImageV snapshotViewAfterScreenUpdates:false];
    snapshotView.frame = [containerView convertRect:formVC.mainSelectedCell.videoImageV.frame fromView:formVC.mainSelectedCell];
    
    //根据选取的frame的不同又不同的效果
//    snapshotView.frame = CGRectMake(0, formVC.mainSelectedCell.frame.origin.y, formVC.mainSelectedCell.frame.size.width, formVC.mainSelectedCell.frame.size.height);
    formVC.mainSelectedCell.hidden = YES;
    
    //3.设置目标控制器的位置，并把透明度设为0，在后面的动画中慢慢显示出来变为1
    toVC.view.frame = [transitionContext finalFrameForViewController:toVC];
    toVC.selectedCell.mainImageV.hidden = true;
    formVC.view.alpha = 0;
    // 3.pop
    [containerView insertSubview:toVC.view belowSubview:formVC.view];
    [containerView addSubview:snapshotView];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        snapshotView.frame = [containerView convertRect:toVC.selectedCell.mainImageV.frame fromView:toVC.selectedCell];
        
//        formVC.view.alpha = 0;
//        toVC.view.alpha = 1;
        
    } completion:^(BOOL finished) {
        
       
        [snapshotView removeFromSuperview];
        formVC.mainSelectedCell.hidden = false;
        toVC.selectedCell.mainImageV.hidden = false;
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        
    }];
    
    
 
    
    
}
@end

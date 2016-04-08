//
//  ViewAnimationVC1.m
//  LJTransitions
//
//  Created by 罗金 on 16/4/8.
//  Copyright © 2016年 EasyFlower. All rights reserved.
//

#import "ViewAnimationVC1.h"

@interface ViewAnimationVC1 ()

{
    BOOL _isTop;
}

@property (nonatomic, strong) UIImageView *aniImg;
@property (nonatomic, strong) UIImageView *aniImg2;
@property (nonatomic, strong) UIImageView *aniImg3;

@property (weak, nonatomic) IBOutlet UIButton *moveBtn;
@property (weak, nonatomic) IBOutlet UIButton *keyBtn;


@end

@implementation ViewAnimationVC1


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _isTop = YES;
    
    [self aniImg];
    [self aniImg2];
    [self aniImg3];
    
}

#pragma mark - 常规动画属性设置，可以同时选择多个，用或运算组合
/*< 动画过程中保证子视图跟随运动 
 * UIViewAnimationOptionLayoutSubviews
 */

/*< 动画过程中允许用户交互 
 * UIViewAnimationOptionAllowUserInteraction
 */

/*< 所有视图从当前状态开始运行 
 * UIViewAnimationOptionBeginFromCurrentState
 */

/*< 重复运行动画 
 * UIViewAnimationOptionRepeat
 */

/*< 动画运行结束后回到起始点 
 * UIViewAnimationOptionAutoreverse
 */

/*< 忽略嵌套动画时间设置 
 * UIViewAnimationOptionOverrideInheritedDuration
 */

/*< 忽略嵌套动画速度设置 
 * UIViewAnimationOptionOverrideInheritedCurve
 */

/*< 动画过程中重绘视图，只适合转场动画 
 * UIViewAnimationOptionAllowAnimatedContent
 */

/*< 视图切换直接隐藏旧视图、显示新视图，只适合转场动画 
 * UIViewAnimationOptionShowHideTransitionViews
 */

/*< 不继承父动画设置或动画类型 
 * UIViewAnimationOptionOverrideInheritedOptions
 */

#pragma mark - 动画速度变化控制，其中选一个进行设置
/*< 动画先缓慢，后逐渐加速，默认值
 * UIViewAnimationOptionCurveEaseInOut
 */

/*< 动画逐渐变慢 
 * UIViewAnimationOptionCurveEaseIn
 */

/*< 动画逐渐加速
 * UIViewAnimationOptionCurveEaseOut
 */

/* < 动画匀速执行
 * UIViewAnimationOptionCurveLinear
 */


#pragma mark - 动画模式选择，选择一个
/*< 连续运算模式 
 * UIViewKeyframeAnimationOptionCalculationModeLinear
 */

/*< 离散运算模式 
 * UIViewKeyframeAnimationOptionCalculationModeDiscreter
 */

/*< 均匀执行运算模式 
 * UIViewKeyframeAnimationOptionCalculationModePacedr
 */

/*< 平滑运算模式 
 * UIViewKeyframeAnimationOptionCalculationModeCubicr
 */

/*< 平滑均匀运算模式 
 * UIViewKeyframeAnimationOptionCalculationModeCubicPacedr
 */

- (IBAction)keyBtnAction:(id)sender {
    [self keyAnimation];

}

#pragma mark - 关键帧动画
- (void)keyAnimation {

    [UIView animateKeyframesWithDuration:5.0 delay:0 options:UIViewAnimationOptionCurveLinear | UIViewAnimationOptionCurveLinear animations:^{
        //第一个关键帧:从0秒开始持续25%的时间，也就是5.0*0.25=1.25秒
        [UIView addKeyframeWithRelativeStartTime:0.0 relativeDuration:0.25 animations:^{
            _aniImg3.center = CGPointMake(10, 300);
        }];
        //第二个关键帧:从50%时间开始持续25%的时间，也就是5.0*0.25=1.25秒
        [UIView addKeyframeWithRelativeStartTime:0.25 relativeDuration:0.25 animations:^{
            _aniImg3.center = CGPointMake(300, 80);
        }];
        //第三个关键帧:从75%时间开始持续25%的时间，也就是5.0*0.25=1.25秒
        [UIView addKeyframeWithRelativeStartTime:0.5 relativeDuration:0.25 animations:^{
            _aniImg3.center = CGPointMake(180, 600);
        }];
        
        [UIView addKeyframeWithRelativeStartTime:0.75 relativeDuration:0.25 animations:^{
            _aniImg3.center = CGPointMake(175, 175);
        }];

    } completion:^(BOOL finished) {
        NSLog(@"Animation end.");
    }];
}


#pragma mark - 弹性动画
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInView:self.view];
    
    /*
     创建弹性动画
     damping:阻尼，范围0-1，阻尼越接近于0，弹性效果越明显
     springVelocity:弹性复位的速度
     */
    [UIView animateWithDuration:5.0 delay:0 usingSpringWithDamping:0.15 initialSpringVelocity:1.0 options:UIViewAnimationOptionCurveLinear animations:^{
        _aniImg2.frame = CGRectMake(touchPoint.x, touchPoint.y, 50, 50);
    } completion:^(BOOL finished) {
        NSLog(@"Animation end.");
    }];
}

#pragma mark - 移动动画
- (IBAction)moveBtnAction:(id)sender {
    /*
     开始动画，UIView的动画方法执行完后动画会停留在终点位置，而不需要进行任何特殊处理
     duration:执行时间
     delay:延迟时间
     options:动画设置，例如自动恢复、匀速运动等
     completion:动画完成回调方法
     */
    
    if (_aniImg.center.x != self.view.center.x) {
        [UIView animateKeyframesWithDuration:5.0 delay:0.0 options:UIViewAnimationOptionCurveLinear animations:^{
            _aniImg.center = self.view.center;
            self.moveBtn.userInteractionEnabled = NO;
        } completion:^(BOOL finished) {
            NSLog(@"动画结束");
            self.moveBtn.userInteractionEnabled = YES;
        }];
    } else {
        [UIView animateKeyframesWithDuration:5.0 delay:0.0 options:UIViewAnimationOptionCurveLinear animations:^{
            _aniImg.frame = CGRectMake(10, 84, 50, 50);
            self.moveBtn.userInteractionEnabled = NO;
        } completion:^(BOOL finished) {
            NSLog(@"动画结束");
            self.moveBtn.userInteractionEnabled = YES;
        }];
    }
    
}

//#pragma mark - 移动动画
//- (void)moveAnimation {
//    }
//
//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [self moveAnimation];
//}

- (UIImageView *)aniImg {
    if (!_aniImg) {
        _aniImg = [[UIImageView alloc] initWithFrame:CGRectMake(10, 84, 50, 50)];
        _aniImg.backgroundColor = [UIColor redColor];
        _aniImg.layer.masksToBounds = YES;
        _aniImg.layer.cornerRadius = 25;
        _aniImg.layer.borderColor = [UIColor blackColor].CGColor;
        _aniImg.layer.borderWidth = 1;
        [self.view addSubview:_aniImg];
    }
    return _aniImg;
}

- (UIImageView *)aniImg2 {
    if (!_aniImg2) {
        _aniImg2 = [[UIImageView alloc] initWithFrame:CGRectMake(150, 84, 50, 50)];
        _aniImg2.backgroundColor = [UIColor greenColor];
        _aniImg2.layer.masksToBounds = YES;
        _aniImg2.layer.cornerRadius = 25;
        _aniImg2.layer.borderColor = [UIColor blackColor].CGColor;
        _aniImg2.layer.borderWidth = 1;
        [self.view addSubview:_aniImg2];
    }
    return _aniImg2;
}

- (UIImageView *)aniImg3 {
    if (!_aniImg3) {
        _aniImg3 = [[UIImageView alloc] initWithFrame:CGRectMake(150, 150, 50, 50)];
        _aniImg3.backgroundColor = [UIColor yellowColor];
        _aniImg3.layer.masksToBounds = YES;
        _aniImg3.layer.cornerRadius = 25;
        _aniImg3.layer.borderColor = [UIColor blackColor].CGColor;
        _aniImg3.layer.borderWidth = 1;
        [self.view addSubview:_aniImg3];
    }
    return _aniImg3;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

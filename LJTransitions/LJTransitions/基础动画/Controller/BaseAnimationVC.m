//
//  BaseAnimationVC.m
//  LJTransitions
//
//  Created by 罗金 on 16/4/5.
//  Copyright © 2016年 EasyFlower. All rights reserved.
//

#import "BaseAnimationVC.h"

@interface BaseAnimationVC ()

@property (nonatomic, strong) UILabel *rocket;        // 火箭🚀
@property (nonatomic, strong) UILabel *rocket2;

@property (nonatomic, strong) UILabel *passwordAnima; // 密码错误

@property (nonatomic, strong) UILabel *circlePath;    // 路径动画

@end

@implementation BaseAnimationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self LayoutUIs];
}

- (void)LayoutUIs {
    self.rocket = [self setLabltWithFrame:CGRectMake(15, 84, 50, 30) andTitle:@"🚀" andBackGroundColor:[UIColor redColor] andSelector:@selector(reocketMoveAnimation)];
    self.rocket2 = [self setLabltWithFrame:CGRectMake(15, 84+40, 50, 30) andTitle:@"🚀🚀" andBackGroundColor:[UIColor orangeColor] andSelector:nil];

    self.passwordAnima = [self setLabltWithFrame:CGRectMake(15, CGRectGetMaxY(self.rocket2.frame)+20, 100, 20) andTitle:@"🙅密码错误🙅" andBackGroundColor:[UIColor darkGrayColor] andSelector:@selector(passwordAnimation)];
 
    UIView *cirView = [[UIView alloc] initWithFrame:CGRectMake(10, 10, 240, 240)];
    cirView.center = self.view.center;
    cirView.backgroundColor = [UIColor yellowColor];
    cirView.layer.cornerRadius = 120;
    cirView.layer.masksToBounds = YES;
    [self.view addSubview:cirView];
    self.circlePath = [self setLabltWithFrame:CGRectMake(CGRectGetMaxX(cirView.frame), CGRectGetMaxY(self.rocket2.frame)+40, 30, 30) andTitle:@"✈️" andBackGroundColor:[UIColor cyanColor] andSelector:@selector(circlrPathAnimation)];
    self.circlePath.center = self.view.center;
}

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [self reocketMoveAnimation];
//    
//    [self passwordAnimation];
//    [self circlrPathAnimation];
//}

#pragma mark - 沿路径动画
- (void)circlrPathAnimation {
    CGRect boundingRect = CGRectMake(-150, -150, 300, 300);
    
    CAKeyframeAnimation *orbit = [CAKeyframeAnimation animation];
    orbit.keyPath = @"position";
    orbit.path = CFAutorelease(CGPathCreateWithEllipseInRect(boundingRect, NULL));
    orbit.duration = 4;
    orbit.additive = YES;
    orbit.repeatCount = HUGE_VALF;
    orbit.calculationMode = kCAAnimationPaced;
    orbit.rotationMode = kCAAnimationRotateAuto;
    
    [_circlePath.layer addAnimation:orbit forKey:@"orbit"];
}

#pragma mark - 多步动画（输入错误密码抖动效果） 
- (void)passwordAnimation {
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position.x";
    animation.values = @[ @0, @10, @-10, @10, @0 ];
    animation.keyTimes = @[ @0, @(1 / 6.0), @(3 / 6.0), @(5 / 6.0), @1 ];
    animation.duration = 0.4;
    animation.additive = YES;
    
    [_passwordAnima.layer addAnimation:animation forKey:@"shake"];
}

#pragma mark- 火箭发射动画（即实时改变位移）
#pragma mark- 移动动画
- (void)reocketMoveAnimation {
    // 创建核心动画
    CABasicAnimation *animation = [CABasicAnimation animation];
    
    //1.1告诉系统要执行什么样的动画
    animation.keyPath = @"position.x";
    // 设置通过动画，将layer从哪移动到哪
//    animation.fromValue = @15;
//    animation.toValue = @350;
    animation.byValue = @100;
    animation.duration = 1;
//    //1.2设置动画执行完毕之后不删除动画
//    animation.removedOnCompletion = NO;
//    //1.3设置保存动画的最新状态
//    animation.fillMode = kCAFillModeForwards;
    
    //2.添加核心动画到layer
    [self.rocket.layer addAnimation:animation forKey:@"basic"];
    _rocket.layer.position = CGPointMake(350, 84);
    
    /*
     * 我们想要第二个火箭在第一个火箭起飞不久后起飞
     */
    animation.beginTime = CACurrentMediaTime() + 0.5;
    [_rocket2.layer addAnimation:animation forKey:@"basic"];
    _rocket2.layer.position = CGPointMake(350, 84+40);

}

- (UILabel *)setLabltWithFrame:(CGRect)frame andTitle:(NSString *)title andBackGroundColor:(UIColor *)backgroundColor andSelector:(nullable SEL)action{
    UILabel *baseLab = [[UILabel alloc] initWithFrame:frame];
    baseLab.text = title;
    baseLab.font = [UIFont systemFontOfSize:12];
    baseLab.textAlignment = NSTextAlignmentCenter;
    baseLab.textColor = [UIColor whiteColor];
    baseLab.backgroundColor = backgroundColor;
    [self.view addSubview:baseLab];
    baseLab.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:action];
    [baseLab addGestureRecognizer:tap];
    return baseLab;
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

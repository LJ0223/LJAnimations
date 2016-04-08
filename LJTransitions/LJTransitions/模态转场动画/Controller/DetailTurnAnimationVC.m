//
//  DetailTurnAnimationVC.m
//  LJTransitions
//
//  Created by 罗金 on 16/4/8.
//  Copyright © 2016年 EasyFlower. All rights reserved.
//

#import "DetailTurnAnimationVC.h"

@interface DetailTurnAnimationVC ()

@end

@implementation DetailTurnAnimationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor yellowColor];
    
    UIButton *exitButton = [[UIButton alloc] initWithFrame:CGRectMake(50, 50, 30, 30)];
    exitButton.backgroundColor = [UIColor blueColor];
    [exitButton addTarget:self action:@selector(exitButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:exitButton];
}

#pragma mark - 返回上一页
- (void)exitButtonAction
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
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

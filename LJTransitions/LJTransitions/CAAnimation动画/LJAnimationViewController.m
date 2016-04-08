//
//  LJAnimationViewController.m
//  LJTransitions
//
//  Created by 罗金 on 16/4/8.
//  Copyright © 2016年 EasyFlower. All rights reserved.
//

#import "LJAnimationViewController.h"
#import "LJAnimation.h"

@interface LJAnimationViewController ()

@end

@implementation LJAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableArray *arrSubLayer = [[NSMutableArray alloc] init];
    [arrSubLayer addObject:[LJAnimation replicatorLayer_Circle]];
    [arrSubLayer addObject:[LJAnimation replicatorLayer_Wave]];
    [arrSubLayer addObject:[LJAnimation replicatorLayer_Triangle]];
    [arrSubLayer addObject:[LJAnimation replicatorLayer_Grid]];
    
    CGFloat redius = self.view.frame.size.width / 2;
    
    for (NSInteger loop = 0; loop < arrSubLayer.count; loop++) {
        NSInteger col = loop % 2;
        NSInteger row = loop / 2;
        
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(redius*col, redius*row+84, 100, 100)];
        view.backgroundColor = [UIColor whiteColor];
        [view.layer addSublayer:[arrSubLayer objectAtIndex:loop]];
        [self.view addSubview:view];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end



//
//  TurnControAnimationVC.m
//  LJTransitions
//
//  Created by 罗金 on 16/4/8.
//  Copyright © 2016年 EasyFlower. All rights reserved.
//

#import "TurnControAnimationVC.h"
#import "DetailTurnAnimationVC.h"
#import "PushDetailAnimationVC.h"

#import "CenterEnlargeAnimation.h"
#import "CenterAnlargePushAnimation.h"

@interface TurnControAnimationVC ()<UITableViewDataSource, UITableViewDelegate, UINavigationControllerDelegate>

@property (nonatomic, strong) CenterEnlargeAnimation *centerAnimation;
@property (nonatomic, strong) CenterAnlargePushAnimation *pushCenterAnima;

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation TurnControAnimationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self loadDataSource];
    [self tableView];
}

#pragma mark - tableView Delegate && DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataSource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellIdentify"];
    
    cell.textLabel.text = [_dataSource objectAtIndex:indexPath.row];
    cell.selectionStyle = NO;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:nil];
    self.selectedCell = [tableView cellForRowAtIndexPath:indexPath];
    
    if ([[_dataSource objectAtIndex:indexPath.row] isEqualToString:@"模态"]) {
        [self onPresent];
    } else {
        [self onPush];
    }
    
    
}

#pragma mark - 跳转动画
- (void)onPresent {
    DetailTurnAnimationVC *detailVC = [[DetailTurnAnimationVC alloc] init];
    detailVC.modalPresentationStyle = UIModalPresentationCustom;
    
    self.centerAnimation = [[CenterEnlargeAnimation alloc] initWithPresented:^(UIViewController *presented, UIViewController *presenting, UIViewController *source, HYBBaseTransition *transition) {
        CenterEnlargeAnimation *bubble = (CenterEnlargeAnimation *)transition;
        bubble.bubbleColor = presented.view.backgroundColor;
        // 转换选中的Cell在当前View上的坐标
        CGRect frame = [self.selectedCell convertRect:self.selectedCell.frame toView:self.tableView];
        bubble.bubbleStartFrame = frame;
        CGPoint center = [self.tableView convertPoint:self.selectedCell.center toView:self.tableView.superview];
        bubble.bubbleStartPoint = center;
        
    } dismissed:^(UIViewController *dismissed, HYBBaseTransition *transition) {
        // Do nothing and it is ok here.
        // If you really want to do something, here you can set the mode.
        // But inside the super class, it is set to be automally.
        // So you do this has no meaning.
        transition.transitionMode = kHYBTransitionDismiss;
    }];
    
    // 这句必须加，不加的话不会调用自定义转场动画
    detailVC.transitioningDelegate = self.centerAnimation;
    
    detailVC.title = @"哈哈哈";
    [self presentViewController:detailVC animated:YES completion:NULL];
}

- (void)onPush {
    PushDetailAnimationVC *pushDetailVC = [[PushDetailAnimationVC alloc] init];
    self.pushCenterAnima = [[CenterAnlargePushAnimation alloc] initWithPushed:^(UIViewController *fromVC, UIViewController *toVC, HYBBaseTransition *transition) {
        CenterAnlargePushAnimation *bubble = (CenterAnlargePushAnimation *)transition;
        self.pushCenterAnima.bubbleColor = fromVC.view.backgroundColor;
        // 转换选中的Cell在当前View上的坐标
        CGRect frame = [self.selectedCell convertRect:self.selectedCell.frame toView:self.tableView];
        bubble.bubbleStartFrame = frame;
        CGPoint center = [self.tableView convertPoint:self.selectedCell.center toView:self.tableView.superview];
        bubble.bubbleStartPoint = center;
    } poped:^(UIViewController *fromVC, UIViewController *toVC, HYBBaseTransition *transition) {
        transition.transitionMode = kHYBTransitionPop;
    }];
    
    [self.navigationController pushViewController:pushDetailVC animated:YES];
    
}

#pragma mark - LAyoutUI

- (UITableView *)tableView
{
    if (!_tableView) {
        self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellIdentify"];
        _tableView.tableFooterView = [[UIView alloc] init];
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

- (void)loadDataSource {

    self.dataSource = [[NSMutableArray alloc] init];
    
    for (int i = 0 ; i < 30; i++) {
        if (i % 2 == 0) {
            [_dataSource addObject:@"模态"];
        } else {
            [_dataSource addObject:@"push"];
        }
    }
    
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

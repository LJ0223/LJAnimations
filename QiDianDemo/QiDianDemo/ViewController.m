//
//  ViewController.m
//  QiDianDemo
//
//  Created by iShareme on 15/10/13.
//  Copyright © 2015年 iShareme. All rights reserved.
//

#import "ViewController.h"
#import "MainCell.h"
#import "MainViewController.h"
#import "PushAnimation.h"
#import "PopAnimation.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate,UINavigationControllerDelegate>

@property (nonatomic, strong)UITableView *tableView;

@property (nonatomic, strong)NSMutableArray *tableArray;

@property (nonatomic, strong)PushAnimation *pushAnimation;

@property (nonatomic, strong)PopAnimation *popAnimation;

@end

@implementation ViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.tableArray = [NSMutableArray arrayWithCapacity:0];
        for (int i = 1 ; i < 8; i++) {
            NSString *str = [NSString stringWithFormat:@"%d", i];
            [self.tableArray addObject:str];
        }
        self.navigationController.delegate = self;
        self.pushAnimation = [[PushAnimation alloc] init];
        self.popAnimation = [[PopAnimation alloc] init];
    }
    return self;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    self.navigationController.navigationBar.translucent = NO;
    self.automaticallyAdjustsScrollViewInsets = NO;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _tableArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellName = @"cellName";
    MainCell *cell = [tableView dequeueReusableCellWithIdentifier:cellName];
    if (!cell) {
        cell = [[MainCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellName];
    }
    NSString *str = [self.tableArray objectAtIndex:indexPath.row];
    cell.mainImageV.image = [UIImage imageNamed:str];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    MainViewController *mainVC = [[MainViewController alloc] init];
    mainVC.selectIndex = indexPath.row;
    mainVC.tableArray = self.tableArray;
    self.selectedCell = [tableView cellForRowAtIndexPath:indexPath];
    mainVC.image = self.selectedCell.mainImageV.image;
    self.navigationController.delegate = self;
    [self.navigationController pushViewController:mainVC animated:YES];
}

-(id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
{
    if (operation == UINavigationControllerOperationPush) {
        
        return self.pushAnimation;
        
    }else{
        
        return self.popAnimation;
        
    }
}



#pragma 懒加载

-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, QDSCREENW, QDSCREENH - 64) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [[UIView alloc] init];
        
    }
    return _tableView;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

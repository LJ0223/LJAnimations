//
//  ViewController.m
//  LJTransitions
//
//  Created by 罗金 on 16/4/5.
//  Copyright © 2016年 EasyFlower. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"动画";
    [self loadDataSource];
    [self tableView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}


#pragma mark - tableView Delegate && DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataSource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellIdentify"];
    
    NSDictionary *dic = [_dataSource objectAtIndex:indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld. %@", indexPath.row+1, [dic objectForKey:@"title"]];
    cell.selectionStyle = NO;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *dic = [_dataSource objectAtIndex:indexPath.row];
    
    Class typeVC = NSClassFromString([dic objectForKey:@"controller"]);
    UIViewController *typeController = [[typeVC alloc] init];
    typeController.title = [dic objectForKey:@"title"];
    
    [self.navigationController pushViewController:typeController animated:YES];
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
    
    NSDictionary *dic1 = [NSDictionary dictionaryWithObjectsAndKeys:@"基础动画", @"title", @"BaseAnimationVC", @"controller", nil];
    [_dataSource addObject:dic1];
    
    NSDictionary *dic2 = [NSDictionary dictionaryWithObjectsAndKeys:@"UIView动画", @"title", @"ViewAnimationVC1", @"controller", nil];
    [_dataSource addObject:dic2];
    
    NSDictionary *dic4 = [NSDictionary dictionaryWithObjectsAndKeys:@"四种小动画", @"title", @"LJAnimationViewController", @"controller", nil];
    [_dataSource addObject:dic4];
    
    NSDictionary *dic3 = [NSDictionary dictionaryWithObjectsAndKeys:@"模态转场动画", @"title", @"TurnControAnimationVC", @"controller", nil];
    [_dataSource addObject:dic3];
    
    
    NSDictionary *dic5 = [NSDictionary dictionaryWithObjectsAndKeys:@"各种自定义布局", @"title", @"CustomCollectionVC", @"controller", nil];
    [_dataSource addObject:dic5];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

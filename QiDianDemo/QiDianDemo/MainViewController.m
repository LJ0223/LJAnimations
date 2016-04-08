//
//  MainViewController.m
//  QiDianDemo
//
//  Created by iShareme on 15/10/13.
//  Copyright © 2015年 iShareme. All rights reserved.
//

#import "MainViewController.h"
#import "MainDetailCell.h"
#import "PopAnimation.h"
#import "MainCollectionViewCell.h"

@interface MainViewController ()<UICollectionViewDataSource, UICollectionViewDelegate,UIScrollViewDelegate>


@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong)UITableView *tableView;




@end

@implementation MainViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.selectIndex = 0;
        self.navigationController.navigationBar.translucent = NO;
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:self.collectionView];
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.tableArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MainCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];

    switch (indexPath.item) {
        case 0:
            cell.backgroundColor = [UIColor colorWithRed:231/255.0 green:15.0 blue:251/255.0 alpha:1.0];
            break;
        case 1:
            cell.backgroundColor = [UIColor colorWithRed:123/255.0 green:24/255.0 blue:125/255.0 alpha:1.0];
            break;
        case 2:
            cell.backgroundColor = [UIColor colorWithRed:123/255.0 green:124/255.0 blue:25/255.0 alpha:1.0];
            break;
        case 3:
            cell.backgroundColor = [UIColor colorWithRed:163/255.0 green:24/255.0 blue:95/255.0 alpha:1.0];
            break;
        case 4:
            cell.backgroundColor = [UIColor colorWithRed:213/255.0 green:94/255.0 blue:65/255.0 alpha:1.0];
            break;
        case 5:
            cell.backgroundColor = [UIColor colorWithRed:193/255.0 green:247/255.0 blue:65/255.0 alpha:1.0];
            break;
        case 6:
            cell.backgroundColor = [UIColor colorWithRed:123/255.0 green:64/255.0 blue:25/255.0 alpha:1.0];
            break;
        case 7:
            cell.backgroundColor = [UIColor colorWithRed:223/255.0 green:46/255.0 blue:75/255.0 alpha:1.0];
            break;
        case 8:
            cell.backgroundColor = [UIColor colorWithRed:243/255.0 green:243/255.0 blue:215/255.0 alpha:1.0];
            break;
        case 9:
            cell.backgroundColor = [UIColor colorWithRed:223/255.0 green:124/255.0 blue:225/255.0 alpha:1.0];
            break;
            
        default:
            break;
    }
    NSString *str = [self.tableArray objectAtIndex:indexPath.row];
    cell.videoImageV.image = [UIImage imageNamed:str];
    self.mainSelectedCell = cell;
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma 懒加载

-(UIImageView *)avatarImageView
{
    if (!_avatarImageView) {
        _avatarImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, QDSCREENW, 300)];
    }
    return _avatarImageView;
}




//-(NSMutableArray *)tableArray
//{
//    if (!_tableArray) {
//        _tableArray = [NSMutableArray arrayWithCapacity:0];
//        
//        NSMutableDictionary *dic = [NSMutableDictionary dictionary];
//        [dic setObject:@"2.png" forKey:@"icon"];
//        [dic setObject:@"演唱会" forKey:@"name"];
//        [dic setObject:@"演唱会（Concert）是指在观众前的现场表演，通常是音乐的表演。音乐可以是由单独的音乐人所表演或是音乐的集体演出，歌手通常是在舞台上表演。何况还有非常可观的门票收入（当然，也有不少大型演出是免费入场的）。演唱会对于歌迷来说则是一个狂欢的节日。" forKey:@"desc"];
//        for (int i = 0; i < 10; i ++) {
//            [_tableArray addObject:dic];
//        }
//    }
//    return _tableArray;
//}

- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumInteritemSpacing = 0;
        layout.minimumLineSpacing = 0;
        layout.itemSize = self.view.bounds.size;
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, QDSCREENW, QDSCREENH - 64) collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.pagingEnabled = YES;
        [_collectionView registerClass:[MainCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        [self.view addSubview:_collectionView];
        [_collectionView setContentOffset:CGPointMake(self.selectIndex * QDSCREENW, 0)];
        self.navigationItem.title = [NSString stringWithFormat:@"第 === %ld === 张", (long)self.selectIndex + 1];
        self.mainSelectedCell = [_collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:[NSIndexPath indexPathForItem:self.selectIndex inSection:0]];

    }
    return _collectionView;
}

@end

//
//  MainViewController.h
//  QiDianDemo
//
//  Created by iShareme on 15/10/13.
//  Copyright © 2015年 iShareme. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MainCollectionViewCell;
@interface MainViewController : UIViewController

@property(nonatomic, strong)UIImageView *avatarImageView;

@property(nonatomic, strong)MainCollectionViewCell *mainSelectedCell;

@property(nonatomic, strong)UIImage *image;

@property(nonatomic, assign)NSInteger selectIndex;

@property (nonatomic, strong)NSMutableArray *tableArray;

@end

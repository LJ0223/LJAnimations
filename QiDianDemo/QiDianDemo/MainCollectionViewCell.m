//
//  MainCollectionViewCell.m
//  QiDianDemo
//
//  Created by iShareme on 15/10/13.
//  Copyright © 2015年 iShareme. All rights reserved.
//

#import "MainCollectionViewCell.h"

@implementation MainCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.videoImageV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, QDSCREENW, 300)];
        
        [self.contentView addSubview:self.videoImageV];
        
        self.infoLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        
        
        
    }
    return self;
}



@end

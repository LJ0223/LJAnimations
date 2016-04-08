//
//  MainDetailCell.m
//  QiDianDemo
//
//  Created by iShareme on 15/10/13.
//  Copyright © 2015年 iShareme. All rights reserved.
//

#import "MainDetailCell.h"

@implementation MainDetailCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self =[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.iconV = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 40, 40)];
        self.iconV.layer.cornerRadius = 20;
        self.iconV.layer.masksToBounds = YES;
        [self.contentView addSubview:self.iconV];
        
        self.nameL = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.iconV.frame) + 10,  23, 200, 14)];
        self.nameL.font = QD_Default_Font;
        self.nameL.textColor = [UIColor blackColor];
        [self.contentView addSubview:self.nameL];
        
        self.descL = [[UILabel alloc] initWithFrame:CGRectMake(20, 60, QDSCREENW - 40, 40)];
        self.descL.font = QD_Default_Font;
        self.descL.textColor = [UIColor grayColor];
        [self.contentView addSubview:self.descL];
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

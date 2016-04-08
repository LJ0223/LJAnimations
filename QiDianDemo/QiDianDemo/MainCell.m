//
//  MainCell.m
//  QiDianDemo
//
//  Created by iShareme on 15/10/13.
//  Copyright © 2015年 iShareme. All rights reserved.
//

#import "MainCell.h"

@interface MainCell ()




@end


@implementation MainCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.mainImageV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, QDSCREENW, 200)];
        self.mainImageV.userInteractionEnabled = YES;
        [self.contentView addSubview:self.mainImageV];

    }
    return self;
}







- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

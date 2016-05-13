//
//  BannerCell.m
//  zh
//
//  Created by jianfeng on 15/3/12.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "BannerCell.h"
#import "UIKit+AFNetworking.h"
#import "StoryListModel.h"

@interface BannerCell()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation BannerCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setModel:(StoryListModel *)model
{
    _model = model;
    [self.imageView setImageWithURL:[NSURL URLWithString:_model.imageUrlString]];
    self.titleLabel.text = _model.title;
}

@end

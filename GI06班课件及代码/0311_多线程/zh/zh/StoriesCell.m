//
//  StoriesCell.m
//  zh
//
//  Created by jianfeng on 15/3/11.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "StoriesCell.h"
#import "StoryListModel.h"
#import "UIKit+AFNetworking.h"

#define kNibName @"StoriesCell"

@interface StoriesCell()

@property (weak, nonatomic) IBOutlet UILabel *storiesLable;
@property (weak, nonatomic) IBOutlet UIImageView *storiesImageView;

@end

@implementation StoriesCell

- (void)awakeFromNib
{
    self.storiesImageView.clipsToBounds = YES;
}

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    StoriesCell *cell = [tableView dequeueReusableCellWithIdentifier:kNibName];
    if (!cell) {
        cell = [[NSBundle mainBundle]loadNibNamed:kNibName owner:nil options:nil][0];
    }
    return cell;
}

- (void)setModel:(StoryListModel *)model
{
    _model = model;
    self.storiesLable.text = _model.title;
    [self.storiesLable sizeToFit];
    [self.storiesImageView setImageWithURL:[NSURL URLWithString:_model.imageUrlString]];
}

+ (CGFloat)cellHeight
{
    return 95.0f;
}

@end





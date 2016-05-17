//
//  StoriesCell.h
//  zh
//
//  Created by jianfeng on 15/3/11.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@class StoryListModel;

@interface StoriesCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView;
+ (CGFloat)cellHeight;

@property (nonatomic, strong)StoryListModel *model;

@end

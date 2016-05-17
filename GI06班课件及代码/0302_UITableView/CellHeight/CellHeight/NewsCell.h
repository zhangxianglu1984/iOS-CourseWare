//
//  NewsCell.h
//  CellHeight
//
//  Created by jianfeng on 15/3/2.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "News.h"

@interface NewsCell : UITableViewCell

@property (nonatomic, strong) News *model;

+ (CGFloat)cellHeight;

@end

//
//  NewsCell.m
//  CellHeight
//
//  Created by jianfeng on 15/3/2.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "NewsCell.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kMargin 20

@interface NewsCell()
{
    UILabel *titleLabel;
    UILabel *label;
}

@end

@implementation NewsCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        titleLabel  = [[UILabel alloc]initWithFrame:CGRectMake(kMargin, kMargin, 50, 30)];
        titleLabel.font = [UIFont systemFontOfSize:17.0f];
        titleLabel.textColor = [UIColor grayColor];
        [self.contentView addSubview:titleLabel];
        
        label = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(titleLabel.frame), 20, kScreenWidth - 20 *2 - 50, 50)];
        label.numberOfLines = 0;
        label.font = [UIFont systemFontOfSize:17.0];
        [self.contentView addSubview:label];
    }
    return self;
}

- (void)setModel:(News *)model
{
    _model = model;
    titleLabel.text = _model.title;
    label.text = _model.content;
    [label sizeToFit];
    [titleLabel sizeToFit];
    
    CGFloat cellHeight = [self heightForNews:_model];
    CGRect frame = self.frame;
    frame.size.height = cellHeight;
    self.frame = frame;
}

- (CGFloat)heightForNews:(News *)news
{
    NSString *str = news.content;
    CGFloat height = [str boundingRectWithSize:CGSizeMake(kScreenWidth - 20 *2 - 50, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName :[UIFont systemFontOfSize:17.0]} context:nil].size.height;
    return height + 40;
}

@end

//
//  IMCIconTableViewCell.m
//  Demo_九宫格布局
//
//  Created by xiangluzhang on 15/12/22.
//  Copyright © 2015年 xiangluzhang. All rights reserved.
//

#import "IMCIconTableViewCell.h"

#import "IMCIconModel.h"

#import "IMCIconButton.h"

@interface IMCIconTableViewCell ()

@property(nonatomic,strong) NSMutableArray *iconButtons;

- (void)p_clearSubViews;

@end

@implementation IMCIconTableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *cellIdentifier = @"IMCIconTableViewCell";
    
    IMCIconTableViewCell *tableViewCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (tableViewCell == nil) {
        tableViewCell = [[IMCIconTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    return tableViewCell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //self.translatesAutoresizingMaskIntoConstraints = NO;
        self.iconButtons = [NSMutableArray array];
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)setIconModels:(NSArray *)iconModels {
    _iconModels = iconModels;
    
    [self p_clearSubViews];
    
    [iconModels enumerateObjectsUsingBlock:^(IMCIconModel *iconModel, NSUInteger idx, BOOL * _Nonnull stop) {
        IMCIconButton *iconButton = [IMCIconButton buttonWithType:UIButtonTypeCustom];
        
        iconButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        iconButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
        
        [iconButton setTitle:iconModel.title forState:UIControlStateNormal];
        [iconButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        iconButton.titleLabel.font = [UIFont systemFontOfSize:14.0];
        
        [iconButton setImage:iconModel.iconImage forState:UIControlStateNormal];
        
        [self.contentView addSubview:iconButton];
        
        [_iconButtons addObject:iconButton];
    }];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat horizontalSpace = (self.contentView.bounds.size.width - _iconButtons.count * 75.0) / (_iconButtons.count - 1.0);
    
    
    CGFloat verticalSpace = (self.contentView.bounds.size.height - 75.0) * 0.5;
    
    [_iconButtons enumerateObjectsUsingBlock:^(IMCIconButton *iconButton, NSUInteger idx, BOOL * _Nonnull stop) {
        
        CGFloat iconButtonX = (75.0 + horizontalSpace) * idx;
        CGFloat iconButtonY = verticalSpace;
        
        iconButton.frame = CGRectMake(iconButtonX,iconButtonY, 75.0,75.0);
    }];
}

- (void)p_clearSubViews {
    NSArray *subViews = self.contentView.subviews;
    [subViews enumerateObjectsUsingBlock:^(UIView *subView, NSUInteger idx, BOOL * _Nonnull stop) {
        //将子视图添加到父视图 addSubView
        //将子视图从父视图移除
        [subView removeFromSuperview];
    }];
    
    [_iconButtons removeAllObjects];
}

@end

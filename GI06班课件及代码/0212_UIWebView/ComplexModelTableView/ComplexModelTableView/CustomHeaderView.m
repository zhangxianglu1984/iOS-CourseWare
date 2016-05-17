//
//  CustomHeaderView.m
//  ComplexModelTableView
//
//  Created by jianfeng on 15/2/12.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "CustomHeaderView.h"

@interface CustomHeaderView()
{
    UIButton *button;
}

@end

@implementation CustomHeaderView

+ (CustomHeaderView *)headerViewWithTableView:(UITableView *)tableView
{
    static NSString *identifier = @"header";
    CustomHeaderView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:identifier];
    if (!header) {
        header = [[CustomHeaderView alloc]initWithReuseIdentifier:identifier];
    }
    return header;
}

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.backgroundColor = [UIColor orangeColor];
        [button setBackgroundImage:[UIImage imageNamed:@"button_bg"] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:@"button_bg_highlighted"] forState:UIControlStateHighlighted];
        
        // button显示靠哪边对齐
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;

        // 修改button内部整体的位置
        button.contentEdgeInsets = UIEdgeInsetsMake(0, 15, 0, 0);
        
        // 可以修改title或者图片的位置
//        button.titleEdgeInsets;
//        button.imageEdgeInsets;
        
        // 在初始化方法里面 bounds(frame)是没有值的
//        button.frame = self.bounds;
        [button addTarget:self action:@selector(clickHeader:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:button];
        
    }
    return self;
}

// 自动调用(自身的frame发生改变的时候调用)
- (void)layoutSubviews
{
    // 一定要调用!!!!
    [super layoutSubviews];
    button.frame = self.bounds;
}

- (void)clickHeader:(UIButton *)button
{
    self.model.isOpen = !self.model.isOpen;
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(didFinishedClick)]) {
        [self.delegate didFinishedClick];
    }
}

- (void)setModel:(ColorGroup *)model
{
    _model = model;
    [button setTitle:_model.groupName forState:UIControlStateNormal];
}

@end

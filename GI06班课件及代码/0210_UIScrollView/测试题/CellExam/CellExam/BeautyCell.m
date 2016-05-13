//
//  BeautyCell.m
//  CellExam
//
//  Created by Apple on 15/2/7.
//  Copyright (c) 2015年 Summer. All rights reserved.
//

#import "BeautyCell.h"

@interface BeautyCell()

@property (nonatomic, strong) UIImageView *avartarImageView;
@property (nonatomic, strong) UILabel     *nameLabel;
@property (nonatomic, strong) UIButton    *button;

@end

@implementation BeautyCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        _avartarImageView = [[UIImageView alloc]initWithFrame:CGRectMake(20, 10, 60, 60)];
        _avartarImageView.backgroundColor = [UIColor orangeColor];
        [self.contentView addSubview:_avartarImageView];
        
        _nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 75, 60, 20)];
        _nameLabel.textAlignment = NSTextAlignmentCenter;
        _nameLabel.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_nameLabel];
        
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        _button.frame = CGRectMake(250, 20, 44 , 44);
        [_button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_button];
    }
    return self;
}

+ (CGFloat)cellHeight
{
    return 100.0f;
}

- (void)clickButton:(UIButton *)button
{
    
    [_delegate beautyCell:self didClickButton:button];
}

- (void)setModel:(Beauty *)model
{
    _model = model;
    self.avartarImageView.image = [UIImage imageNamed:_model.avartar];
    self.nameLabel.text = _model.name;
    if (_model.isLike) {
        [self.button setImage:[UIImage imageNamed:@"heart"] forState:UIControlStateNormal];
    }
    else{
        [self.button setImage:[UIImage imageNamed:@"heart_white"] forState:UIControlStateNormal];
    }
    
}

@end

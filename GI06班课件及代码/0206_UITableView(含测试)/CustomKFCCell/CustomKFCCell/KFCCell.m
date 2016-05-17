//
//  KFCCell.m
//  CustomKFCCell
//
//  Created by jianfeng on 15/2/6.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "KFCCell.h"
@interface KFCCell()

@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)UIImageView *image;
@property (nonatomic, strong) UIButton *button;

@end

@implementation KFCCell

// 重写override
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 50, 60, 30)];
        _titleLabel.backgroundColor = [UIColor grayColor];
        [self.contentView addSubview:_titleLabel];
        
        _image = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 50, 50)];
        _image.backgroundColor = [UIColor grayColor];
        [self.contentView addSubview:_image];
        
        self.button = [[UIButton alloc]initWithFrame:CGRectMake(250, 20, 50, 40)];
        self.button.backgroundColor = [UIColor lightGrayColor];
        [self.button setTitle:@"收进" forState:UIControlStateNormal];
        [self.button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:self.button];
    }
    return self;
}

- (void)setKfc:(KFC *)kfc
{
    _kfc = kfc;
    _titleLabel.text = kfc.title;
    _image.image = [UIImage imageNamed:kfc.imageName];
}

+ (CGFloat)cellHeight
{
    return 100.0f;
}

- (void)clickButton:(UIButton *)button
{
    NSLog(@"button被点击了");
    
    [self.delegate kfcCell:self dealWithButton:button];
}

@end
















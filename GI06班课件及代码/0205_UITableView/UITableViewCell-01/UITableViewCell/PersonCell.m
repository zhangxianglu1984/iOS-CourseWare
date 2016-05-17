//
//  PersonCell.m
//  UITableViewCell
//
//  Created by jianfeng on 15/2/5.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "PersonCell.h"

#define kXpos 15
#define kYPos 10
#define kMargin 5
#define kHeight 30
#define kWidth 150

@interface PersonCell()

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *sexLabel;
@property (nonatomic, strong) UILabel *ageLabel;
@property (nonatomic, strong) UILabel *heightLabel;
@property (nonatomic, strong) UILabel *weightLabel;

@end

@implementation PersonCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


#pragma mark - getters

- (UILabel *)nameLabel
{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(kXpos, kYPos, kWidth, kHeight)];
        [self.contentView addSubview:_nameLabel];
    }
    return _nameLabel;
}

- (UILabel *)sexLabel
{
    if (!_sexLabel) {
        _sexLabel = [[UILabel alloc]initWithFrame:CGRectMake(kXpos, CGRectGetMaxY(_nameLabel.frame) + kMargin, kWidth, kHeight)];
        [self.contentView addSubview:_sexLabel];
    }
    return _sexLabel;
}

- (UILabel *)ageLabel
{
    if (!_ageLabel) {
        _ageLabel = [[UILabel alloc]initWithFrame:CGRectMake(kXpos, CGRectGetMaxY(_sexLabel.frame) + kMargin, kWidth, kHeight)];
        [self.contentView addSubview:_ageLabel];
    }
    return _ageLabel;
}

- (UILabel *)heightLabel
{
    if (!_heightLabel) {
        _heightLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_sexLabel.frame), CGRectGetMinY(_sexLabel.frame), kWidth, kHeight)];
        [self.contentView addSubview:_heightLabel];
    }
    return _heightLabel;
}

- (UILabel *)weightLabel
{
    if (!_weightLabel) {
        _weightLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(_heightLabel.frame), CGRectGetMinY(_ageLabel.frame), kWidth, kHeight)];
        [self.contentView addSubview:_weightLabel];
    }
    return _weightLabel;
}

- (void)setPerson:(Person *)person
{
    _person = person;
    self.nameLabel.text   = person.name;
    self.sexLabel.text    = [NSString stringWithFormat:@"性别:%@",person.isMale ? @"男" : @"女"];
    self.ageLabel.text    = [NSString stringWithFormat:@"年龄:%d",person.age];;
    self.heightLabel.text = [NSString stringWithFormat:@"身高:%.0fcm",person.height];
    self.weightLabel.text = [NSString stringWithFormat:@"体重:%.0fkg",person.weight];
}

@end

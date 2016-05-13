//
//  KFCCell.m
//  CustomCell_xib
//
//  Created by jianfeng on 15/2/9.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "KFCCell.h"

@interface KFCCell()

@property (weak, nonatomic) IBOutlet UIImageView *productImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;
@property (weak, nonatomic) IBOutlet UIImageView *isNewImageView;
@property (weak, nonatomic) IBOutlet UIButton *button;


@end

@implementation KFCCell

- (void)awakeFromNib {
    // Initialization code
}

// 此方法只有在用代码创建自定义cell的时候才会调用
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
    }
    return self;
}

+ (CGFloat)cellHeight
{
    return 120.0f;
}

- (void)setModel:(KFC *)model
{
    _model = model;
    self.productImageView.image = [UIImage imageNamed:_model.imageName];
    self.titleLabel.text = _model.title;
    self.priceLabel.text = [NSString stringWithFormat:@"￥%.2ld",(long)_model.price];
    self.descLabel.text = _model.desc;
    self.isNewImageView.hidden = !_model.isNew;
}

@end

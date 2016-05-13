//
//  Cell.m
//  UICollectionView
//
//  Created by jianfeng on 15/3/3.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "Cell.h"

@implementation Cell

- (void)setModel:(KFC *)model
{
    _model = model;
    self.imageView.image = [UIImage imageNamed:_model.imageName];
    self.titleLabel.text = _model.title;
}

@end

//
//  Cell.h
//  UICollectionView
//
//  Created by jianfeng on 15/3/3.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KFC.h"

@interface Cell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (nonatomic, strong) KFC *model;

@end

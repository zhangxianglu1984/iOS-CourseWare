//
//  KFCCell.h
//  CustomCell_xib
//
//  Created by jianfeng on 15/2/9.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KFC.h"

@interface KFCCell : UITableViewCell

@property (nonatomic, strong) KFC *model;
+ (CGFloat)cellHeight;

@end

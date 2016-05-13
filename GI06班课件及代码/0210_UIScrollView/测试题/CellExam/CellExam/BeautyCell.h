//
//  BeautyCell.h
//  CellExam
//
//  Created by Apple on 15/2/7.
//  Copyright (c) 2015年 Summer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Beauty.h"
@class BeautyCell;

@protocol BeautyCellDelegate <NSObject>

- (void)beautyCell:(BeautyCell *)cell didClickButton:(UIButton *)button;

@end

@interface BeautyCell : UITableViewCell

@property (nonatomic, strong) Beauty *model;
@property (nonatomic, weak) id<BeautyCellDelegate> delegate;

+ (CGFloat)cellHeight;

@end

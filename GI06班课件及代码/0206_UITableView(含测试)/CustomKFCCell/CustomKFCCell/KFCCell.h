//
//  KFCCell.h
//  CustomKFCCell
//
//  Created by jianfeng on 15/2/6.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KFC.h"

@class KFCCell;

@protocol KFCCellDelegate <NSObject>

- (void)kfcCell:(KFCCell *)cell dealWithButton:(UIButton *)button;

@end

@interface KFCCell : UITableViewCell

@property (nonatomic, strong)KFC *kfc;

@property (nonatomic, weak) id<KFCCellDelegate> delegate;

+ (CGFloat)cellHeight;

@end

//
//  BDBSelectAnnualEarningRangeTableCell.h
//  BiDaiBaoAPP
//
//  Created by xiangluzhang on 15/10/28.
//  Copyright © 2015年 xiangluzhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BDBSelectAnnualEarningRangeTableCellDelegate;

@interface BDBSelectAnnualEarningRangeTableCell : UITableViewCell

@property(nonatomic,weak) id<BDBSelectAnnualEarningRangeTableCellDelegate> delegate;

+ (BDBSelectAnnualEarningRangeTableCell *)cellWithTableView:(UITableView *)tableView;

@end

@protocol BDBSelectAnnualEarningRangeTableCellDelegate <NSObject>

@optional
- (void)tableViewCell:(BDBSelectAnnualEarningRangeTableCell *)tableViewCell didSelectMaxProfitableView:(UIView *)maxProfitableView;

- (void)tableViewCell:(BDBSelectAnnualEarningRangeTableCell *)tableViewCell didSelectMaxStableView:(UIView *)maxProfitableView;

- (void)tableViewCell:(BDBSelectAnnualEarningRangeTableCell *)tableViewCell didSelectMaxSafeView:(UIView *)maxProfitableView;

@end




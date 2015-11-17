//
//  BDBStatisticsTableCell.h
//  BiDaiBaoAPP
//
//  Created by xiangluzhang on 15/10/29.
//  Copyright © 2015年 xiangluzhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BDBStatisticsTableCell;

@protocol BDBStatisticsTableCellDelegate <NSObject>

//协议默认是required
@optional
/**
 *  统计信息按钮被点击
 */
- (void)statisticsTableCell:(BDBStatisticsTableCell *)statisticsTableCell didClickInvestableFundButton:(UIButton *)investableFundButton willUpdateInvestableFundLabel:(UILabel *)investableFundLable;

- (void)statisticsTableCell:(BDBStatisticsTableCell *)statisticsTableCell didClickInvestableProjectButton:(UIButton *)investableProjectButton willUpdateInvestableProjectLabel:(UILabel *)investableProjectLable;

- (void)statisticsTableCell:(BDBStatisticsTableCell *)statisticsTableCell didClickMaxProfitButton:(UIButton *)maxProfitButton willUpdateMaxProfitLabel:(UILabel *)maxProfitLable;

- (void)statisticsTableCell:(BDBStatisticsTableCell *)statisticsTableCell didClickInvestPeopleNumberButton:(UIButton *)investPeopleNumberButton willUpdateInvestPeopleNumberLabel:(UILabel *)investPeopleNumberLable;

- (void)statisticsTableCell:(BDBStatisticsTableCell *)statisticsTableCell didClickHideAndShowAdvButton:(UIButton *)hideAndShowAdvButton;


@end


@interface BDBStatisticsTableCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *investableFundLabel;

@property (weak, nonatomic) IBOutlet UILabel *investableProjectLabel;

@property (weak, nonatomic) IBOutlet UILabel *maxProfitLabel;

@property (weak, nonatomic) IBOutlet UILabel *investPeopleNumberLabel;

@property(nonatomic,weak) id<BDBStatisticsTableCellDelegate> delegate;

+ (BDBStatisticsTableCell *)cellWithTableView:(UITableView *)tableView;

@end

//
//  BDBStatisticsTableCell.m
//  BiDaiBaoAPP
//
//  Created by xiangluzhang on 15/10/29.
//  Copyright © 2015年 xiangluzhang. All rights reserved.
//

#import "BDBStatisticsTableCell.h"

@interface BDBStatisticsTableCell ()

@property (weak, nonatomic) IBOutlet UIButton *investableFundButton;

@property (weak, nonatomic) IBOutlet UIButton *investableProjectButton;

@property (weak, nonatomic) IBOutlet UIButton *maxProfitButton;

@property (weak, nonatomic) IBOutlet UIButton *investPeopleNumberButton;

@property (weak, nonatomic) IBOutlet UIButton *hideAndShowAdvButton;

- (void)p_initInvestableFundButton;

- (void)p_initInvestableProjectButton;

- (void)p_initMaxProfitButton;

- (void)p_initInvestPeopleNumberButton;

- (void)statisticsButtonClickedAction:(UIButton *)button;

- (void)p_initHideAndShowAdvButton;

- (void)hideAndShowAdvButtonClickedAction:(UIButton *)button;

@end

@implementation BDBStatisticsTableCell

+ (BDBStatisticsTableCell *)cellWithTableView:(UITableView *)tableView {
    static NSString *cellIdentifier = @"BDBStatisticsTableCell";
    
    BDBStatisticsTableCell *tableViewCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!tableViewCell) {
        tableViewCell = [[[NSBundle mainBundle] loadNibNamed:@"BDBStatisticsTableCell" owner:nil options:nil] lastObject];
        tableViewCell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return tableViewCell;
}

- (void)awakeFromNib {
    [self p_initInvestableFundButton];
    [self p_initInvestableProjectButton];
    [self p_initMaxProfitButton];
    [self p_initInvestPeopleNumberButton];
    [self p_initHideAndShowAdvButton];
}

- (void)statisticsButtonClickedAction:(UIButton *)button {
    _investableFundButton.selected = NO;
    _investableProjectButton.selected = NO;
    _maxProfitButton.selected = NO;
    _investPeopleNumberButton.selected = NO;
    
    button.selected = YES;
    
    if (button == _investableFundButton) {
        if ([_delegate respondsToSelector:@selector(statisticsTableCell:didClickInvestableFundButton:willUpdateInvestableFundLabel:)]){
            
            [_delegate statisticsTableCell:self didClickInvestableFundButton:button willUpdateInvestableFundLabel:_investableFundLabel];
        }
        
    } else if (button == _investableProjectButton) {
        if ([_delegate respondsToSelector:@selector(statisticsTableCell:didClickInvestableProjectButton:willUpdateInvestableProjectLabel:)]){
            
            [_delegate statisticsTableCell:self didClickInvestableProjectButton:button willUpdateInvestableProjectLabel:_investableProjectLabel];
        }
    } else if (button == _maxProfitButton) {
        if ([_delegate respondsToSelector:@selector(statisticsTableCell:didClickMaxProfitButton:willUpdateMaxProfitLabel:)]){
            
            [_delegate statisticsTableCell:self didClickMaxProfitButton:button willUpdateMaxProfitLabel:_maxProfitLabel];
        }
    } else if (button == _investPeopleNumberButton) {
        if ([_delegate respondsToSelector:@selector(statisticsTableCell:didClickInvestPeopleNumberButton:willUpdateInvestPeopleNumberLabel:)]){
            
            [_delegate statisticsTableCell:self didClickInvestPeopleNumberButton:button willUpdateInvestPeopleNumberLabel:_investPeopleNumberLabel];
        }
    }
}

- (void)hideAndShowAdvButtonClickedAction:(UIButton *)button
{
    button.selected = !button.isSelected;
    
    if ([_delegate respondsToSelector:@selector(statisticsTableCell:didClickHideAndShowAdvButton:)]) {
        [_delegate statisticsTableCell:self didClickHideAndShowAdvButton:button];
    }
}

#pragma mark - Private Methods
- (void)p_initInvestableFundButton {
    [_investableFundButton addTarget:self action:@selector(statisticsButtonClickedAction:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)p_initInvestableProjectButton {
    [_investableProjectButton addTarget:self action:@selector(statisticsButtonClickedAction:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)p_initMaxProfitButton {
    [_maxProfitButton addTarget:self action:@selector(statisticsButtonClickedAction:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)p_initInvestPeopleNumberButton {
    [_investPeopleNumberButton addTarget:self action:@selector(statisticsButtonClickedAction:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)p_initHideAndShowAdvButton {
    [_hideAndShowAdvButton addTarget:self action:@selector(hideAndShowAdvButtonClickedAction:) forControlEvents:UIControlEventTouchUpInside];
}

@end

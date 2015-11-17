//
//  BDBSelectAnnualEarningRangeTableCell.m
//  BiDaiBaoAPP
//
//  Created by xiangluzhang on 15/10/28.
//  Copyright © 2015年 xiangluzhang. All rights reserved.
//

#import "BDBSelectAnnualEarningRangeTableCell.h"

#import <objc/message.h>

@interface BDBSelectAnnualEarningRangeTableCell ()

@property (weak, nonatomic) IBOutlet UIImageView *maxProfitableIconImageView;

@property (weak, nonatomic) IBOutlet UIImageView *maxStableIconImageView;

@property (weak, nonatomic) IBOutlet UIImageView *maxSafeIconImageView;



- (IBAction)maxProfitableViewTappedAction:(UITapGestureRecognizer *)gesture;

- (IBAction)maxStableViewTappedAction:(UITapGestureRecognizer *)gesture;

- (IBAction)maxSafeViewTappedAction:(UITapGestureRecognizer *)gesture;

@end

@implementation BDBSelectAnnualEarningRangeTableCell

+ (BDBSelectAnnualEarningRangeTableCell *)cellWithTableView:(UITableView *)tableView {
    static NSString *cellIdentifier = @"BDBSelectAnnualEarningRangeTableCell";
    
    BDBSelectAnnualEarningRangeTableCell *tableViewCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!tableViewCell) {
        tableViewCell = [[[NSBundle mainBundle] loadNibNamed:@"BDBSelectAnnualEarningRangeTableCell" owner:nil options:nil] firstObject];
        tableViewCell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return tableViewCell;
}

- (void)awakeFromNib {
    [self maxProfitableViewTappedAction:nil];
}

- (IBAction)maxProfitableViewTappedAction:(UITapGestureRecognizer *)gesture {
    [_maxProfitableIconImageView setHighlighted:YES];
    [_maxStableIconImageView setHighlighted:NO];
    [_maxSafeIconImageView setHighlighted:NO];
    
    
    if ([_delegate respondsToSelector:@selector(tableViewCell:didSelectMaxProfitableView:)]) {
        [_delegate tableViewCell:self didSelectMaxProfitableView:_maxProfitableIconImageView];
    }
}

- (IBAction)maxStableViewTappedAction:(UITapGestureRecognizer *)gesture {
    [_maxStableIconImageView setHighlighted:YES];
    [_maxProfitableIconImageView setHighlighted:NO];
    [_maxSafeIconImageView setHighlighted:NO];
    
    if ([_delegate respondsToSelector:@selector(tableViewCell:didSelectMaxStableView:)]) {
        [_delegate tableViewCell:self didSelectMaxStableView:_maxStableIconImageView];
    }
}

- (IBAction)maxSafeViewTappedAction:(UITapGestureRecognizer *)gesture {
    [_maxStableIconImageView setHighlighted:NO];
    [_maxProfitableIconImageView setHighlighted:NO];
    [_maxSafeIconImageView setHighlighted:YES];
    
    if ([_delegate respondsToSelector:@selector(tableViewCell:didSelectMaxSafeView:)]) {
        [_delegate tableViewCell:self didSelectMaxSafeView:_maxSafeIconImageView];
    }
}
@end

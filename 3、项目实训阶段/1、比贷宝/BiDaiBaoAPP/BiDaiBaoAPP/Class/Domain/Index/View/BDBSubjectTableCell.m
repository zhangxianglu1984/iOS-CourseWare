//
//  BDBTableViewCell.m
//  BDBHomePage
//
//  Created by Jamy on 15/6/16.
//  Copyright (c) 2015年 Jamy. All rights reserved.
//

#import "BDBSubjectTableCell.h"

@interface BDBSubjectTableCell ()



@property (weak, nonatomic) IBOutlet UILabel *ProgressPercentLabel;

@property (weak, nonatomic) IBOutlet UILabel *TermLabel;
@property (weak, nonatomic) IBOutlet UILabel *AmountLabel;
@property (weak, nonatomic) IBOutlet UILabel *PlatformNameLabel;

@end

@implementation BDBSubjectTableCell

+ (BDBSubjectTableCell *)cellWithTableView:(UITableView *)tableView {
    static NSString *cellIdentifier = @"BDBSubjectTableCell";
    
    BDBSubjectTableCell *tableViewCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!tableViewCell) {
        tableViewCell = [[[NSBundle mainBundle] loadNibNamed:@"BDBSubjectTableCell" owner:nil options:nil] lastObject];
//        tableViewCell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return tableViewCell;
}

- (void)setSubjectModel:(BDBSubjectModel *)subjectModel {
    _subjectModel = subjectModel;
    
    float annualEarnings = [subjectModel.AnnualEarnings floatValue] * 100.0;
    _ProgressPercentLabel.text = [NSString stringWithFormat:@"%.1f",annualEarnings];
    
    _TermLabel.text = subjectModel.Term;
    
    _AmountLabel.text = subjectModel.Amount;
    
    _PlatformNameLabel.text = subjectModel.PlatformName;
}

@end

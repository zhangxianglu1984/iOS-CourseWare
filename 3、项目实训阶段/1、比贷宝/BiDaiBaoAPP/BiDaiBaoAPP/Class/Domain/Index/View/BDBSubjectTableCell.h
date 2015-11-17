//
//  BDBTableViewCell.h
//  BDBHomePage
//
//  Created by Jamy on 15/6/16.
//  Copyright (c) 2015年 Jamy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BDBSubjectModel.h"

@interface BDBSubjectTableCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *numberLabel;

@property (weak, nonatomic) IBOutlet UIImageView *iconBallImageView;

@property(nonatomic,strong) BDBSubjectModel *subjectModel;

+ (BDBSubjectTableCell *)cellWithTableView:(UITableView *)tableView;

@end

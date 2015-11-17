//
//  BDBNoticeCyclingTableCell.h
//  BiDaiBaoAPP
//
//  Created by xiangluzhang on 15/10/30.
//  Copyright © 2015年 xiangluzhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BDBNoticeCyclingTableCell : UITableViewCell

@property(nonatomic,copy) NSArray *noticeModels;

@property(nonatomic,assign) NSInteger displayingNoticeModelIndex;

+ (BDBNoticeCyclingTableCell *)cellWithTableView:(UITableView *)tableView;

@end

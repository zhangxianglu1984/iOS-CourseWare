//
//  IMCIconTableViewCell.h
//  Demo_九宫格布局
//
//  Created by xiangluzhang on 15/12/22.
//  Copyright © 2015年 xiangluzhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class IMCIconModel;

@interface IMCIconTableViewCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@property(nonatomic,strong) NSArray *iconModels;

@end

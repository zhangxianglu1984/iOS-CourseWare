//
//  CustomHeaderView.h
//  ComplexModelTableView
//
//  Created by jianfeng on 15/2/12.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ColorGroup.h"

@protocol CustomHeaderViewDelegate <NSObject>

- (void)didFinishedClick;

@end

@interface CustomHeaderView : UITableViewHeaderFooterView

@property (nonatomic, strong) ColorGroup *model;

@property (nonatomic, weak) id<CustomHeaderViewDelegate> delegate;

+ (CustomHeaderView *)headerViewWithTableView:(UITableView *)tableView;

@end

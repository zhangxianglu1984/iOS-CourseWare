//
//  IMCMainViewController.m
//  Demo_九宫格布局
//
//  Created by xiangluzhang on 15/12/22.
//  Copyright © 2015年 xiangluzhang. All rights reserved.
//

#import "IMCMainViewController.h"

#import "IMCIconTableViewCell.h"
#import "IMCIconModel.h"

@interface IMCMainViewController ()

@property(nonatomic,strong) NSMutableArray *iconModels;

@end

@implementation IMCMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.backgroundColor = [UIColor greenColor];
    
    self.tableView.rowHeight = 100.0;
    self.tableView.bounces = NO;
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    //self.tableView.estimatedRowHeight = 50.0;
}

- (NSMutableArray *)iconModels {
    if (_iconModels == nil) {
        self.iconModels = [NSMutableArray arrayWithCapacity:15];
        
        for (NSUInteger i = 0; i < 15; i ++) {
            NSMutableArray *iconModels = [NSMutableArray arrayWithCapacity:3];
            for (NSUInteger j = 0; j < 4; j ++) {
                IMCIconModel *iconModel = [IMCIconModel new];
                
                NSInteger randomNumber = arc4random_uniform(12) + 1;
                
                NSString *iconImageName = [NSString stringWithFormat:@"images.bundle/tmall_icon_cat_outing_%ld",randomNumber];
                iconModel.iconImage = [UIImage imageNamed:iconImageName];
                
                iconModel.title = [NSString stringWithFormat:@"Icon-%ld",randomNumber];
                
                [iconModels addObject:iconModel];
            }
            [_iconModels addObject:iconModels];
        }
    }
    return _iconModels;
}

#pragma mark - UITableView DataSource Methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.iconModels.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    IMCIconTableViewCell *tableViewCell = [IMCIconTableViewCell cellWithTableView:tableView];
    
    tableViewCell.iconModels = self.iconModels[indexPath.row];
    
    return tableViewCell;
}

#pragma mark UITableView Delegate Methods
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    NSLog(@"%s",__FUNCTION__);
//    
//    [NSThread sleepForTimeInterval:0.5];
//    
//    return 44.0;
//}


@end

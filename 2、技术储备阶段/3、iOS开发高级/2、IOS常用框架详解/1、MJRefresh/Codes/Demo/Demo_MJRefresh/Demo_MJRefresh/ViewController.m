//
//  ViewController.m
//  Demo_MJRefresh
//
//  Created by zhang xianglu on 15/6/26.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import "ViewController.h"
#import "IMCTableViewHeader.h"
#import "MJRefresh.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];

	__weak typeof(self) thisInstance = self;
	self.tableView.header = [IMCTableViewHeader headerWithRefreshingBlock:^{
		dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
			NSLog(@"获取数据...");
			[thisInstance.tableView.header endRefreshing];
		});
	}];
	
	[thisInstance.tableView.header beginRefreshing];
}


@end

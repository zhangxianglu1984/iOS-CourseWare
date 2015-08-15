//
//  IMCMainTableViewController.m
//  Demo_多图片网络加载
//
//  Created by zhang xianglu on 15/6/3.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import "IMCMainViewController.h"
#import "AppInfo.h"
#import "UIImageView+WebCache.h"

@interface IMCMainViewController ()

/**
 *  应用信息(AppInfo模型)
 */
@property(nonatomic,strong) NSMutableArray *appInfos;

@end

@implementation IMCMainViewController

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
	
	}
	return self;
}

/**
 *  通过懒加载的方式实例化数据 self.appInfos
 */
- (NSArray *)appInfos {
	if (_appInfos == nil) {
		NSArray *appInfos = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"apps" ofType:@"plist"]];
		
		self.appInfos = [NSMutableArray arrayWithCapacity:12];
		for (NSDictionary *appInfoDict in appInfos) {
			[_appInfos addObject:[AppInfo appInfoWithDictionary:appInfoDict]];
		}
	}
	
	return _appInfos;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	
}

#pragma mark - UITableView DataSource Methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return self.appInfos.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *cellIdentifier = @"cell";
	
	UITableViewCell * tableViewCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
	if (tableViewCell == nil) {
		tableViewCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
	}
	
	//获取模型数据
	AppInfo *appInfo = self.appInfos[indexPath.row];
	
	//设置cell显示的内容
	tableViewCell.textLabel.text = appInfo.name;
	tableViewCell.detailTextLabel.text = appInfo.download;
	
	[tableViewCell.imageView sd_setImageWithURL:[NSURL URLWithString:appInfo.icon] placeholderImage:[UIImage imageNamed:@"placeholder"]  options:SDWebImageRetryFailed | SDWebImageLowPriority | SDWebImageCacheMemoryOnly progress:^(NSInteger receivedSize, NSInteger expectedSize) {
		
		NSLog(@"加载进度%ld/%ld=%g",receivedSize,expectedSize,receivedSize/(expectedSize * 1.0));
		
	}completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
		//包括从缓存加载
		NSLog(@"图片加载完毕");
	}];
	
	
	
	return tableViewCell;
}

- (void)didReceiveMemoryWarning {
}


@end

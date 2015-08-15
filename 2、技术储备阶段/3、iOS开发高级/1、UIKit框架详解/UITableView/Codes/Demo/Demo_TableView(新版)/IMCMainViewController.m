//
//  IMCMainViewController.m
//  Demo_TableView(新版)
//
//  Created by zhang xianglu on 15/6/17.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import "IMCMainViewController.h"
#import "ZXLTableViewCell.h"
#import "UITableView+FDTemplateLayoutCell.h"

static NSString *const kCellIdentifier = @"cell";

@interface IMCMainViewController () <UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong) NSMutableArray *datas;

@end

@implementation IMCMainViewController

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		self.datas = [NSMutableArray array];
		for (NSUInteger i = 0; i < 15; i ++) {
			NSString *content = @"dsafsdkfhakjsdhfakjsdhfkadsafsdkfhakjsdhfakjsdhfkadsafsdkfhakjsdhfakjsdhfkadsafsdkfhakjsdhfakjsdhfkadsafsdkfhakjsdhfakjsdhfkadsafsdkfhakjsdhfakjsdhfkadsafsdkfhakjsdhfakjsdhfkadsafsdkfhakjsdhfakjsdhfkadsafsdkfhakjsdhfakjsdhfkadsafsdkfhakjsdhfakjsdhfka";
			[_datas addObject:content];
		}
	}
	return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

	UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
	tableView.backgroundColor = [UIColor greenColor];
	
	//打开fd..的日志功能
	tableView.fd_debugLogEnabled = NO;
	
	//注册单元格
	//1、通过xib文件来创建Cell
	[tableView registerNib:[UINib nibWithNibName:@"ZXLTableViewCell" bundle:nil] forCellReuseIdentifier:kCellIdentifier];
	
	//2、直接用代码创建[[Cell alloc] init]
	//[tableView registerClass:[ZXLTableViewCell class] forCellReuseIdentifier:kCellIdentifier];
	
	//3、直接放在ib文件的TableView上
	
	
	
	//tableView.rowHeight = 80;
	//把每个Cell高度计算工作的时机，从load转至scroll
	//ScrollView==contentSize(tableView)
	tableView.estimatedRowHeight = 150;
	
	tableView.delegate = self;
	tableView.dataSource = self;
	[self.view addSubview:tableView];
	
	tableView.translatesAutoresizingMaskIntoConstraints = NO;
	
	NSString *visualFormat = @"H:|[tableView]|";
	NSArray *constraint_h = [NSLayoutConstraint constraintsWithVisualFormat:visualFormat options:NSLayoutFormatAlignAllCenterY metrics:nil views:@{@"tableView": tableView}];
	
	visualFormat = @"V:|-(20)-[tableView]|";
	NSDictionary *viewsDict = NSDictionaryOfVariableBindings(tableView);
	NSArray *constraint_v = [NSLayoutConstraint constraintsWithVisualFormat:visualFormat options:NSLayoutFormatAlignAllLeft metrics:nil views:viewsDict];
	
	[self.view addConstraints:constraint_h];
	[self.view addConstraints:constraint_v];
}

#pragma mark - UITableView DataSource Methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	//NSLog(@"numberOfSectionsInTableView");
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	//NSLog(@"numberOfRowsInSection");
	return _datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	//NSLog(@"cellForRowAtIndexPath");

	//static NSString *cellIdentifier = kCellIdentifier;
	
	//从重用池中取出备用的Cell
	//ZXLTableViewCell *tableViewCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
	
	ZXLTableViewCell *tableViewCell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier forIndexPath:indexPath];
	
	//tableViewCell.backgroundColor = [UIColor redColor];
	
//	if (tableViewCell == nil) {
//		tableViewCell = [[UINib nibWithNibName:@"ZXLTableViewCell" bundle:nil] instantiateWithOwner:nil options:nil][0];
//		
//		tableViewCell.backgroundColor = [UIColor brownColor];
//	}
	
//	if (indexPath.row % 2 == 0) {
//		
//	}

	//设置显示的内容	
	tableViewCell.titleLabel.text = _datas[indexPath.row];
	
	
	//tableViewCell.titleLabel.numberOfLines = 1;
	//tableViewCell.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
	
	return tableViewCell;
}

#pragma mark - UITableView Delegate Methods
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	return [tableView fd_heightForCellWithIdentifier:kCellIdentifier configuration:^(ZXLTableViewCell *cell){
		//计算显示的高度	
		cell.titleLabel.text = _datas[indexPath.row];
		
		cell.titleLabel.text = [cell.titleLabel.text stringByAppendingString:@"你好asdfadf你好asdfadf你好asdfadf你好asdfadf你好asdfadf你好asdfadf你好asdfadf"];
	}];
}

//- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
//	NSLog(@"estimatedHeightForRowAtIndexPath: %lu",indexPath.row);
//	return 60;
//}


@end

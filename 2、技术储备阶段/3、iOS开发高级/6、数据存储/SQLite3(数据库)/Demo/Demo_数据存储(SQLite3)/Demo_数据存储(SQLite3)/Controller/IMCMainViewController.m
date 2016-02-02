//
//  IMCMainViewController.m
//  Demo_数据存储(SQLite3)
//SELECT id,name,age,height FROM t_student
//  Created by zhang xianglu on 15/7/7.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import "IMCMainViewController.h"
#import "AFNetworking.h"
#import "MJExtension.h"
#import "IMCGetP2PListResponseModel.h"

#import "ZXLNetService.h"

#import <sqlite3.h>
#import "IMCPlatformModel.h"


@interface IMCMainViewController () {
	sqlite3 *_db;
}

/**
 *  平台数据
 */
@property(nonatomic,strong) NSMutableArray *platformModels;

@end

@implementation IMCMainViewController

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		self.platformModels = [NSMutableArray array];
	}
	return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	
	//缓存路径
	NSString *cachesPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
	
	//数据库文件路径
	NSString *dbFilePath = [cachesPath stringByAppendingPathComponent:@"BiDaiBaoAPP.sqlite"];
	
	//打开数据库(OC字符串-C字符串)
	if(sqlite3_open([dbFilePath UTF8String], &_db) == SQLITE_OK){
		//创建数据表(非查询方法)
		char *sql = "CREATE TABLE IF NOT EXISTS t_platform(id INTEGER PRIMARY KEY AUTOINCREMENT,pid TEXT,name TEXT,website TEXT,deal TEXT,popularity TEXT,earnings REAL)";
		
		char *errmsg = NULL;
		if(sqlite3_exec(_db, sql, NULL, NULL, &errmsg) == SQLITE_OK){
			NSLog(@"数据表创建成功...");
		}else {
			NSLog(@"错误信息：%s",errmsg);
		}
		
	}else {
		NSLog(@"数据库打开失败...");
	}
	
	//从服务器获取平台数据
	NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
	parameters[@"Machine_id"] = [UIDevice currentDevice].identifierForVendor.UUIDString;
	parameters[@"Device"] = @"0";
	parameters[@"Type"] = @"0";
	
	[ZXLNetService sendAsyncPOSTRequestWithKeyValueParameters:parameters JSONResponseModelClass:[IMCGetP2PListResponseModel class] success:^(IMCGetP2PListResponseModel *responseModel) {
		
		//将模型数据存储到数据库中
		NSArray *platformModels = responseModel.P2PList;
		[platformModels enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
			
			IMCPlatformModel *platformModel = (IMCPlatformModel *)obj;
			
			NSString *sql = [NSString stringWithFormat:@"INSERT INTO t_platform(pid,name,website,deal,popularity,earnings) VALUES('%@','%@','%@','%@','%@','%@')",platformModel.PlatFormID,platformModel.PlatformName,platformModel.WebSite,platformModel.Deal,platformModel.Popularity,platformModel.Earnings];
			
			char *errmsg = NULL;
			if(sqlite3_exec(_db, [sql UTF8String], NULL, NULL, &errmsg) == SQLITE_OK){
				NSLog(@"%@平台数据插入成功",platformModel.PlatformName);
			}
			
		}];
		
		//从数据库中读取所有数据(SELECT)
		//1、预处理查询SQL语句
		char *sql = "SELECT * FROM t_platform";
		//SQL语句的预处理器
		sqlite3_stmt *stmt = NULL;
		if(sqlite3_prepare_v2(_db, sql, -1, &stmt, NULL) == SQLITE_OK){
			//去数据库查询出一条记录
			while(sqlite3_step(stmt) == SQLITE_ROW){
				IMCPlatformModel *platformModel = [[IMCPlatformModel alloc] init];
			
				//已经取到了一条记录
				platformModel.PlatFormID = [NSString stringWithUTF8String:NULL];
				platformModel.PlatformName = [NSString stringWithUTF8String:(char *)sqlite3_column_text(stmt, 2)];
				platformModel.WebSite = [NSString stringWithUTF8String:(char *)sqlite3_column_text(stmt, 3)];
				platformModel.Deal = [NSString stringWithUTF8String:(char *)sqlite3_column_text(stmt, 4)];
				platformModel.Popularity = [NSString stringWithUTF8String:(char *)sqlite3_column_text(stmt, 5)];
				platformModel.Earnings = [NSString stringWithUTF8String:(char *)sqlite3_column_text(stmt, 6)];
				
				//将查询出得数据添加到数组中
				[_platformModels addObject:platformModel];
			}
			
			//显示数据
			[self.tableView reloadData];
		}
	} failure:^(ZXLNetServiceFailureType netServiceFailureType) {
		NSLog(@"数据获取错误");
	}];

	
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _platformModels.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *cellIdentifier = @"cell";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
	if (!cell) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
	}
	
	IMCPlatformModel *platformModel = _platformModels[indexPath.row];
	
	cell.textLabel.text = [NSString stringWithFormat:@"%@: %@",platformModel.PlatFormID,platformModel.PlatformName];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

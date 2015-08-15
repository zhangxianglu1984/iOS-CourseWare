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
#import "IMCPlatformModel.h"
#import "FMDB.h"


@interface IMCMainViewController () 

@property(nonatomic,strong) FMDatabaseQueue *dbQueue;

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
	
	self.tableView.separatorColor = [UIColor blackColor];
	
	//缓存路径
	NSString *cachesPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
	
	//数据库文件路径
	NSString *dbFilePath = [cachesPath stringByAppendingPathComponent:@"BiDaiBaoAPP.sqlite"];
	
	//打开数据库(FMDB)
	self.dbQueue = [FMDatabaseQueue databaseQueueWithPath:dbFilePath];
	if (!_dbQueue) {
		NSLog(@"数据库打开失败");
	}else {
		NSString *sql = @"CREATE TABLE IF NOT EXISTS t_platform(id INTEGER PRIMARY KEY AUTOINCREMENT,pid TEXT,name TEXT,website TEXT,deal TEXT,popularity TEXT,earnings REAL)";
		
		[_dbQueue inDatabase:^(FMDatabase *db) {
			[db executeUpdate:sql];
		}];
		
		
		//从服务器获取平台数据
		NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
		parameters[@"Machine_id"] = [UIDevice currentDevice].identifierForVendor.UUIDString;
		parameters[@"Device"] = @"0";
		parameters[@"Type"] = @"0";
		
		[ZXLNetService sendAsyncPOSTRequestWithKeyValueParameters:parameters JSONResponseModelClass:[IMCGetP2PListResponseModel class] success:^(IMCGetP2PListResponseModel *responseModel) {
			
			//将模型数据存储到数据库中
			NSArray *platformModels = responseModel.P2PList;
			
			dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
				[platformModels enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
					
					IMCPlatformModel *platformModel = (IMCPlatformModel *)obj;
					
					NSString *sql = @"INSERT INTO t_platform(pid,name,website,deal,popularity,earnings) VALUES(:pid,:name,:website,:deal,:popularity,:earnings)";
					
					NSMutableDictionary *sqlParameters = [NSMutableDictionary dictionary];
					sqlParameters[@"pid"] = platformModel.PlatFormID;
					sqlParameters[@"name"] = platformModel.PlatformName;
					sqlParameters[@"website"] = platformModel.WebSite;
					sqlParameters[@"deal"] = platformModel.Deal;
					sqlParameters[@"popularity"] = platformModel.Popularity;
					sqlParameters[@"earnings"] = platformModel.Earnings;
					
					[_dbQueue inDatabase:^(FMDatabase *db) {
						if([db executeUpdate:sql withParameterDictionary:sqlParameters]){
							NSLog(@"%@平台数据插入成功",platformModel.PlatformName);
						}
					}];
					
					
				}];
				
				//结果集
				[_dbQueue inDatabase:^(FMDatabase *db) {
					//查询表中的数据
					NSString *sql = @"SELECT * FROM t_platform";
				
					FMResultSet *resultSet = [db executeQuery:sql];
					
					while([resultSet next]){
						IMCPlatformModel *platformModel = [[IMCPlatformModel alloc] init];
						
						platformModel.PlatFormID = [resultSet stringForColumn:@"pid"];
						platformModel.PlatformName = [resultSet stringForColumn:@"name"];
						platformModel.WebSite = [resultSet stringForColumn:@"website"];
						platformModel.Deal = [resultSet stringForColumn:@"deal"];
						platformModel.Popularity = [resultSet stringForColumn:@"popularity"];
						platformModel.Earnings = [resultSet stringForColumn:@"earnings"];
						
						[_platformModels addObject:platformModel];
					}
				}];
				
				dispatch_async(dispatch_get_main_queue(), ^{
					[self.tableView reloadData];
				});

			});

		} failure:^(ZXLNetServiceFailureType netServiceFailureType) {
			
		}];
	
 	}
	
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

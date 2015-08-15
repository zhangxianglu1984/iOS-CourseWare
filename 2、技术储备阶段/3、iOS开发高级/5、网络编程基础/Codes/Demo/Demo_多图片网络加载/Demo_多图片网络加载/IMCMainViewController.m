//
//  IMCMainTableViewController.m
//  Demo_多图片网络加载
//
//  Created by zhang xianglu on 15/6/3.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import "IMCMainViewController.h"
#import "AppInfo.h"

@interface IMCMainViewController ()

/**
 *  并发队列，加载图片
 */
@property(nonatomic,strong) NSOperationQueue *operationQueue;

/**
 *  应用信息(AppInfo模型)
 */
@property(nonatomic,strong) NSMutableArray *appInfos;

/**
 *  图片缓存 key:图片路径 value:UIImage
 */
@property(nonatomic,strong) NSMutableDictionary *iconCacheDictionary;

/**
 *  操作缓存 key:图片路径 value:NSOperation
 */
@property(nonatomic,strong) NSMutableDictionary *operationCacheDictionary;

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

- (NSOperationQueue *)operationQueue {
	if(_operationQueue == nil){
		self.operationQueue = [[NSOperationQueue alloc] init];
	}
	return _operationQueue;
}

- (NSMutableDictionary *)iconCacheDictionary {
	if (_iconCacheDictionary == nil) {
		self.iconCacheDictionary = [NSMutableDictionary dictionaryWithCapacity:5];
	}
	return _iconCacheDictionary;
}

- (NSMutableDictionary *)operationCacheDictionary {
	if (_operationCacheDictionary == nil) {
		self.operationCacheDictionary = [NSMutableDictionary dictionaryWithCapacity:5];
	}
	return _operationCacheDictionary;
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
	
	//如果没有图片，才下载
	UIImage *iconImage = self.iconCacheDictionary[appInfo.icon];
	if (iconImage == nil) {
		tableViewCell.imageView.image = [UIImage imageNamed:@"placeholder"];
		
		//判断沙盒里是否有该文件的缓存
		NSString *iconFileName = [[NSURL URLWithString:appInfo.icon] lastPathComponent];
		
		NSData *iconDatas = [NSData dataWithContentsOfFile:[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0] stringByAppendingPathComponent:iconFileName]];
		
		if (iconDatas == nil) {
			if (self.operationCacheDictionary[appInfo.icon] == nil){
				__weak typeof(self) thisIntance = self;
				NSBlockOperation *requestOperation = [NSBlockOperation blockOperationWithBlock:^{
					
					NSURL *iconUrl = [NSURL URLWithString:appInfo.icon];
					NSURLRequest *iconRequest = [NSURLRequest requestWithURL:iconUrl];
					
					//				[NSThread sleepForTimeInterval:4];
					
					NSURLResponse *iconResponse;
					NSError *error;
					NSData *iconDatas = [NSURLConnection sendSynchronousRequest:iconRequest returningResponse:&iconResponse error:&error];
					
					//NSData -> UIImage
					UIImage *iconImage = [UIImage imageWithData:iconDatas];
					
					if (iconImage != nil) {
						//加载完图片后，放入缓存
						thisIntance.iconCacheDictionary[appInfo.icon] = iconImage;
						
						//将图片缓存到沙盒中
						/**
						 *  expandTilde 
						 *  NO ~/Library/Caches
						 *  YES 
						 */
						NSString *cacheDirectoryPath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask,YES)[0];
						
						NSString *iconFileCachePath = [cacheDirectoryPath stringByAppendingPathComponent:iconUrl.lastPathComponent];
						//UIImage -> NSData
						NSData *iconDatas = UIImagePNGRepresentation(iconImage);
						
						//将datas写入文件
						[iconDatas writeToFile:iconFileCachePath atomically:YES];
						
						[[NSOperationQueue mainQueue] addOperationWithBlock:^{
							//将获取到得图片设置到cell中
							//tableViewCell.imageView.image = iconImage;
							[tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
						}];
					}
					
					/**
					 *  清除操作缓存
					 */
					[thisIntance.operationCacheDictionary removeObjectForKey:appInfo.icon];
				}];
				
				/**
				 *  将操作缓存到操作字典
				 */
			 	self.operationCacheDictionary[appInfo.icon] = requestOperation;
				
				[self.operationQueue addOperation:requestOperation];
			}
		}else {
			tableViewCell.imageView.image = [UIImage imageWithData:iconDatas];
		}
	
	}else {
		tableViewCell.imageView.image = iconImage;
	}
	
	return tableViewCell;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
	self.operationQueue.suspended = YES;
}


- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
	self.operationQueue.suspended = NO;
}

- (void)didReceiveMemoryWarning {
	[self.iconCacheDictionary removeAllObjects];
	
	//清除所有未开始执行的操作
	[self.operationQueue cancelAllOperations];
	
	//正在执行的操作
	[self.operationCacheDictionary removeAllObjects];
}


@end

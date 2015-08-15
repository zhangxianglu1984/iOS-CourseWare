//
//  ZXLSQLiteDatabaseInstance.m
//  BiDaiBaoAPP
//
//  Created by zhang xianglu on 15/7/19.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import "ZXLSQLiteDatabaseInstance.h"
#import "ZXLSQLiteDatabaseConfig.h"
#import "NSObject+ZXLDatabaseModel.h"

static id sharedInstance = nil;

@interface ZXLSQLiteDatabaseInstance ()

/**
 *  记录已经创建的表
 */
@property(nonatomic,strong) NSMutableArray *namesOfExistedTablesInDatabase;

/**
 *  数据库操作
 */
@property(nonatomic,strong) FMDatabaseQueue *databaseQueue;

/**
 *  线程锁
 */
@property(nonatomic,strong) NSRecursiveLock *threadRecursiveLock;

/**
 *  执行原始的SQL语句
 */
- (void)executeDatabaseOperation:(void (^)(FMDatabase *database))operation;


@end

@implementation ZXLSQLiteDatabaseInstance

- (instancetype)init {
	if (self = [super init]) {
		self.threadRecursiveLock = [[NSRecursiveLock alloc] init];
		self.namesOfExistedTablesInDatabase = [NSMutableArray array];
	}
	return self;
}

#pragma mark - Public Methods
- (void)executeDatabaseOperation:(void (^)(FMDatabase *database))operation {
	[_threadRecursiveLock lock];
	
	[self.databaseQueue inDatabase:^(FMDatabase *db) {
		operation(db);
	}];
	
	[_threadRecursiveLock unlock];
}

- (BOOL)executeUpdateDatabaseOperation:(NSString *)updateOperationSQL {
	return [self executeUpdateDatabaseOperation:updateOperationSQL withParameterDictionary:nil];
}

- (BOOL)executeUpdateDatabaseOperation:(NSString *)updateOperationSQL withParameterDictionary:(NSDictionary *)arguments {
	__block BOOL operationSuccessed = NO;
	
	[self executeDatabaseOperation:^(FMDatabase *database) {
		operationSuccessed = (arguments.count > 0)? [database executeUpdate:updateOperationSQL withParameterDictionary:arguments] : [database executeUpdate:updateOperationSQL];
	}];
	
	return operationSuccessed;
}

- (BOOL)clearDatabaseModelsInTable:(NSString *)tableName {
		
	
	return YES;
}

- (BOOL)clearDatabaseModels:(Class)databaseModelClass {
	return YES;
}

/*
- (NSInteger)countOfDatabaseModelsInTable:(NSString*)tableName whereSQL:(NSString *)whereSQL bindingParams:(NSDictionary *)bindingParams {
	__block NSInteger countOfDatabaseModel = 0;

	[self.databaseQueue inDatabase:^(FMDatabase *db) {
		NSMutableString *sql = [NSMutableString stringWithFormat:@"SELECT count(rowid) FROM %@",tableName];
		
		if (whereSQL && ![@"" isEqualToString:whereSQL]) {
			[sql appendFormat:@" WHERE %@",whereSQL];
		}
		
		FMResultSet *resultSet = [db executeQuery:sql withParameterDictionary:bindingParams];
		
		//是否有错
		if (db.hadError) {
			ZXLLOG(@" sql:%@ \n args:%@ \n sqlite error :%@ \n", sql, bindingParams, db.lastErrorMessage);
		}
		
		if (resultSet.columnCount > 0 && [resultSet next]) {
			countOfDatabaseModel = [resultSet intForColumnIndex:0];
		}
		
		//FMResultSet用完后及时关闭
		[resultSet close];
	}];
	
	return countOfDatabaseModel;
}

- (void)countOfDatabaseModels:(Class)databaseModelClass whereSQL:(NSString *)whereSQL  bindingParams:(NSDictionary *)bindingParams callback:(void(^)(NSInteger countOfDatabaseModel))callback {
	dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
		NSInteger countOfDatabaseModel = [self countOfDatabaseModelsInTable:[databaseModelClass zxl_databaseModelTableName] whereSQL:whereSQL bindingParams:bindingParams];
	
		if (callback) {
			dispatch_async(dispatch_get_main_queue(), ^{
				callback(countOfDatabaseModel);
			});
		}
	});
}

- (NSInteger)countOfDatabaseModels:(Class)databaseModelClass whereSQL:(NSString *)whereSQL bindingParams:(NSDictionary *)bindingParams {
	return [self countOfDatabaseModelsInTable:[databaseModelClass zxl_databaseModelTableName] whereSQL:whereSQL bindingParams:bindingParams];
}

#pragma mark - Getters And Setters Methods
- (FMDatabaseQueue *)databaseQueue {
	if (!_databaseQueue) {
		NSString *databaseFilePath = [ZXLSQLiteDatabaseConfig sharedConfig].databaseFilePath;
		NSString *databaseFileName = [ZXLSQLiteDatabaseConfig sharedConfig].databaseFileName;
		
		self.databaseQueue = [FMDatabaseQueue databaseQueueWithPath:[databaseFilePath stringByAppendingPathComponent:databaseFileName]];
	}
	return _databaseQueue;
}
*/

+ (instancetype)sharedInstance {
	if (sharedInstance == nil) {
		sharedInstance = [[ZXLSQLiteDatabaseInstance alloc] init];
	}
	return sharedInstance;
}

/**
 *  开辟内存的方法 alloc -> allocWithZone
 */
+ (instancetype)allocWithZone:(struct _NSZone *)zone {
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		sharedInstance = [super allocWithZone:zone];
	});
	
	return sharedInstance;
}

/**
 *  当给对象发送copy消息时，调用的方法
 *  [object copy]
 *  @param zone 
 *
 *  @return <#return value description#>
 */
- (id)copyWithZone:(NSZone *)zone {
	return sharedInstance;
}


@end

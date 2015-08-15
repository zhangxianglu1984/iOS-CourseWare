//
//  ZXLSQLiteDatabaseInstance.h
//  BiDaiBaoAPP
//
//  Created by zhang xianglu on 15/7/19.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FMDatabase;

@interface ZXLSQLiteDatabaseInstance : NSObject

/**
 *  获取ZXLSQLiteDatabaseInstance实例
 */
+ (instancetype)sharedInstance;


/**
 *  执行更新操作
 *
 *  @param BOOL 
 *
 *  @return 
 */
- (BOOL)executeUpdateDatabaseOperation:(NSString *)updateOperationSQL;
- (BOOL)executeUpdateDatabaseOperation:(NSString *)updateOperationSQL withParameterDictionary:(NSDictionary *)arguments;

/**
 *  执行查询操作
 *
 *  @param BOOL 
 *
 *  @return 
 */

/**
 *  增
 */
- (BOOL)insertDatabaseModel:(NSObject *)databaseModel;
- (void)insertDatabaseModel:(NSObject *)databaseModel callback:(void(^)(BOOL result))block;

/**
 *  删
 */
- (BOOL)deleteDatabaseModel:(NSObject *)databaseModel;
- (void)deleteDatabaseModel:(NSObject *)databaseModel callback:(void(^)(BOOL result))block;
 
/**
 *  改
 */
 
/**
 *  查
 */
 
/**
 *  满足条件的记录数(同步)
 */
//- (NSInteger)countOfDatabaseModelsInTable:(NSString*)tableName whereSQL:(NSString *)whereSQL bindingParams:(NSDictionary *)bindingParams;

/**
 *  满足条件的记录数(异步查询，主线程callback)
 */
//- (void)countOfDatabaseModels:(Class)databaseModelClass whereSQL:(NSString *)whereSQL  bindingParams:(NSDictionary *)bindingParams callback:(void(^)(NSInteger countOfDatabaseModel))callback;
/**
 *  满足条件的记录数(同步)
 */
//- (NSInteger)countOfDatabaseModels:(Class)databaseModelClass whereSQL:(NSString *)whereSQL bindingParams:(NSDictionary *)bindingParams;

/**
 *  清空表数据
 */
- (BOOL)clearDatabaseModelsInTable:(NSString *)tableName;
- (BOOL)clearDatabaseModels:(Class)databaseModelClass;

@end

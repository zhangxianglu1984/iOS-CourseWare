//
//  NSObject+ZXLDatabaseModelExecuteDelegate.h
//  FMDB_ZXLDatabaseHelper
//
//  Created by zhang xianglu on 15/8/1.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (ZXLDatabaseModelExecuteDelegate)

/**
 *  创建表之前调用
 *
 *  @param databaseInstance 
 *  @param tableName        
 */
+ (void)zxl_databaseInstance:(ZXLSQLiteDatabaseInstance *)databaseInstance willCreateTableWithName:(NSString *)tableName;

/**
 *  创建表之后调用
 *
 *  @param databaseInstance 
 *  @param tableName        
 */
+ (void)zxl_databaseInstance:(ZXLSQLiteDatabaseInstance *)databaseInstance didCreateTableWithName:(NSString *)tableName;

/**
 *  修改表结构之前调用
 *
 *  @param databaseInstance 
 *  @param tableName        
 */
+ (void)zxl_databaseInstance:(ZXLSQLiteDatabaseInstance *)databaseInstance willAlterTableWithName:(NSString *)tableName;

/**
 *  修改表结构之后调用
 *
 *  @param databaseInstance 
 *  @param tableName        
 */
+ (void)zxl_databaseInstance:(ZXLSQLiteDatabaseInstance *)databaseInstance didAlterTableWithName:(NSString *)tableName;

/**
 *  删除表之前调用
 *
 *  @param databaseInstance 
 *  @param tableName        
 */
+ (void)zxl_databaseInstance:(ZXLSQLiteDatabaseInstance *)databaseInstance willDropTableWithName:(NSString *)tableName;

/**
 *  删除表之后调用
 *
 *  @param databaseInstance 
 *  @param tableName        
 */
+ (void)zxl_databaseInstance:(ZXLSQLiteDatabaseInstance *)databaseInstance didDropTableWithName:(NSString *)tableName;

/**
 *  插入模型之前
 *
 *  @param databaseInstance 
 *  @param tableName        
 */
+ (BOOL)zxl_databaseInstance:(ZXLSQLiteDatabaseInstance *)databaseInstance willInsertDatabaseModel:(NSObject *)databaseModel;

/**
 *  插入模型后
 *
 *  @param databaseInstance 
 *  @param tableName        
 */
+ (void)zxl_databaseInstance:(ZXLSQLiteDatabaseInstance *)databaseInstance didInsertDatabaseModel:(NSObject *)databaseModel success:(BOOL)successed;

/**
 *  更新模型前
 *
 *  @param databaseInstance 
 *  @param tableName        
 */
+ (BOOL)zxl_databaseInstance:(ZXLSQLiteDatabaseInstance *)databaseInstance willUpdateDatabaseModel:(NSObject *)databaseModel;

/**
 *  更新模型后
 *
 *  @param databaseInstance 
 *  @param tableName        
 */
+ (void)zxl_databaseInstance:(ZXLSQLiteDatabaseInstance *)databaseInstance didUpdateDatabaseModel:(NSObject *)databaseModel success:(BOOL)successed;

/**
 *  删除模型前
 *
 *  @param databaseInstance 
 *  @param tableName        
 */
+ (BOOL)zxl_databaseInstance:(ZXLSQLiteDatabaseInstance *)databaseInstance willDeleteDatabaseModel:(NSObject *)databaseModel;

/**
 *  更新模型后
 *
 *  @param databaseInstance 
 *  @param tableName        
 */
+ (void)zxl_databaseInstance:(ZXLSQLiteDatabaseInstance *)databaseInstance didDeleteDatabaseModel:(NSObject *)databaseModel success:(BOOL)successed;



@end

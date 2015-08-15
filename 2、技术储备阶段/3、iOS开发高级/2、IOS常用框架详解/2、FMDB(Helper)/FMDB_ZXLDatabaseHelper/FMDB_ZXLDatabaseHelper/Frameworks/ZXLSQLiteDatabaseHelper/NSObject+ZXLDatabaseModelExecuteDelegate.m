//
//  NSObject+ZXLDatabaseModelExecuteDelegate.m
//  FMDB_ZXLDatabaseHelper
//
//  Created by zhang xianglu on 15/8/1.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import "NSObject+ZXLDatabaseModelExecuteDelegate.h"

@implementation NSObject (ZXLDatabaseModelExecuteDelegate)

+ (void)zxl_databaseInstance:(ZXLSQLiteDatabaseInstance *)databaseInstance willCreateTableWithName:(NSString *)tableName {}

+ (void)zxl_databaseInstance:(ZXLSQLiteDatabaseInstance *)databaseInstance didCreateTableWithName:(NSString *)tableName {}

+ (void)zxl_databaseInstance:(ZXLSQLiteDatabaseInstance *)databaseInstance willAlterTableWithName:(NSString *)tableName {}

+ (void)zxl_databaseInstance:(ZXLSQLiteDatabaseInstance *)databaseInstance didAlterTableWithName:(NSString *)tableName {}

+ (void)zxl_databaseInstance:(ZXLSQLiteDatabaseInstance *)databaseInstance willDropTableWithName:(NSString *)tableName {}

+ (void)zxl_databaseInstance:(ZXLSQLiteDatabaseInstance *)databaseInstance didDropTableWithName:(NSString *)tableName {}


+ (BOOL)zxl_databaseInstance:(ZXLSQLiteDatabaseInstance *)databaseInstance willInsertDatabaseModel:(NSObject *)databaseModel {
	return YES;
}

+ (void)zxl_databaseInstance:(ZXLSQLiteDatabaseInstance *)databaseInstance didInsertDatabaseModel:(NSObject *)databaseModel success:(BOOL)successed {}

+ (BOOL)zxl_databaseInstance:(ZXLSQLiteDatabaseInstance *)databaseInstance willUpdateDatabaseModel:(NSObject *)databaseModel {
	return YES;
}

+ (void)zxl_databaseInstance:(ZXLSQLiteDatabaseInstance *)databaseInstance didUpdateDatabaseModel:(NSObject *)databaseModel success:(BOOL)successed {}

+ (BOOL)zxl_databaseInstance:(ZXLSQLiteDatabaseInstance *)databaseInstance willDeleteDatabaseModel:(NSObject *)databaseModel {
	return YES;
}

+ (void)zxl_databaseInstance:(ZXLSQLiteDatabaseInstance *)databaseInstance didDeleteDatabaseModel:(NSObject *)databaseModel success:(BOOL)successed {}



@end

//
//  NSObject_ZXLDatabaseModel.h
//  BiDaiBaoAPP
//
//  Created by zhang xianglu on 15/7/19.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ZXLDatabaseModelORMapping;

@interface NSObject (ZXLDatabaseModel)

/**
 *  表名称
 */
+ (NSString *)zxl_databaseModelTableName;

/**
 *  主键名
 */
+ (NSString *)zxl_databaseModelPrimaryKey;

/**
 *  联合主键
 */
+ (NSArray *)zxl_databaseModelUnionPrimaryKeyArray;

/**
 *  数据库模型都有一个主键rowid(在类别中不能生成成员变量)
 */
- (NSInteger)zxl_databaseModelRowId;
- (void)zxl_setDatabaseModelRowId:(NSInteger)databaseModelRowId;

/**
 *  创建对象到关系表的映射
 */
+ (ZXLDatabaseModelORMapping *)zxl_generateDatabaseModelORMapping;

/**
 *	设置是否包含父类的属性
 */
+ (BOOL)zxl_isContainParentProperty;

/**
 *  当前表中的列是否包含自身的属性。
 *
 *  @return BOOL
 */
+ (BOOL)zxl_isContainSelfProperty;




@end

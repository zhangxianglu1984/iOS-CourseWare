//
//  NSObject+ZXLDatabaseMapping.h
//  BiDaiBaoAPP
//
//  Created by zhang xianglu on 15/7/19.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (ZXLDatabaseORMapping)

/**
 *  定义属性到表字段名的映射
 */
+ (NSDictionary *)zxl_databaseModelPropertyColumnMappings;

@end


@interface ZXLDatabaseModelPropertyColumnMapping : NSObject

/**
 *  保存方式
 */
@property(readonly,copy,nonatomic) NSString *type;

/**
 *  属性对应的数据表列名
 */
@property(readonly,copy,nonatomic) NSString *columnName;

/**
 *  属性对应的数据表列类型
 */
@property(readonly,copy,nonatomic) NSString *columnType;

/**
 *  属性名
 */
@property(readonly,copy,nonatomic) NSString* propertyName;

/**
 *  属性类型
 */
@property(readonly,copy,nonatomic) NSString* propertyType;

@end

@interface ZXLDatabaseModelORMapping : NSObject

@property(readonly,nonatomic) NSUInteger columnCount;


@property(readonly,nonatomic)NSArray* primaryKeys;

-(ZXLDatabaseModelPropertyColumnMapping *)objectWithIndex:(NSInteger)index;
-(ZXLDatabaseModelPropertyColumnMapping *)objectWithPropertyName:(NSString*)propertyName;
-(ZXLDatabaseModelPropertyColumnMapping *)objectWithColumnName:(NSString*)columnName;

- (id)initWithPropertyColumnMapping:(NSDictionary*)propertyColumnMapping propertyNames:(NSArray*)propertyNames propertyType:(NSArray*)propertyType primaryKeys:(NSArray*)primaryKeys;






@end
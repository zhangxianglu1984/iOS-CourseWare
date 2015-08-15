//
//  NSObject+ZXLDatabaseMapping.m
//  BiDaiBaoAPP
//
//  Created by zhang xianglu on 15/7/19.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import "NSObject+ZXLDatabaseORMapping.h"
#import "NSObject+ZXLDatabaseModel.h"
#import "ZXLSQLiteDatabaseConstant.h"

@implementation NSObject (ZXLDatabaseORMapping)

+ (NSDictionary *)zxl_databaseModelPropertyColumnMappings {
	return nil;
}

@end

#pragma mark - ZXLDatabaseModelPropertyColumnMapping
@interface ZXLDatabaseModelPropertyColumnMapping()

@property(copy,nonatomic) NSString *type;

@property(copy,nonatomic) NSString *columnName;
@property(copy,nonatomic) NSString *columnType;

@property(copy,nonatomic) NSString *propertyName;
@property(copy,nonatomic) NSString *propertyType;

- (instancetype)initWithType:(NSString*)type propertyName:(NSString *)propertyName propertyType:(NSString *)propertyType columnName:(NSString *)columnName columnType:(NSString *)columnType; 

@end

@implementation ZXLDatabaseModelPropertyColumnMapping
- (instancetype)initWithType:(NSString*)type propertyName:(NSString *)propertyName propertyType:(NSString *)propertyType columnName:(NSString *)columnName columnType:(NSString *)columnType{
	if(self = [super init]){
		self.type = type;
		self.propertyName = propertyName;
		self.propertyType = propertyType;
		self.columnName = columnName;
		self.columnType = columnType;
	}
	return self;
}

@end

@interface ZXLDatabaseModelORMapping () {
	__strong NSMutableDictionary* _propertyNames;
	__strong NSMutableDictionary* _columnNames;
	__strong NSArray *_primaryKeys;
}

- (void)addDatabaseModelPropertyColumnMappingWithType:(NSString *)type propertyName:(NSString *)propertyName propertyType:(NSString *)propertyType columnName:(NSString *)columnName columnType:(NSString *)columnType;

@end

@implementation ZXLDatabaseModelORMapping

#pragma mark - Public Methods
- (NSUInteger)columnCount{
	return _columnNames.count;
}

-(ZXLDatabaseModelPropertyColumnMapping *)objectWithIndex:(NSInteger)index {
	return (index < _columnNames.count)? [_columnNames objectForKey:[_columnNames.allKeys objectAtIndex:index]] : nil;
}

-(ZXLDatabaseModelPropertyColumnMapping *)objectWithPropertyName:(NSString*)propertyName {
	 return [_propertyNames objectForKey:propertyName];
}

-(ZXLDatabaseModelPropertyColumnMapping *)objectWithColumnName:(NSString*)columnName {
	return [_columnNames objectForKey:columnName];
}

- (id)initWithPropertyColumnMapping:(NSDictionary*)propertyColumnMapping propertyNames:(NSArray*)propertyNames propertyType:(NSArray*)propertyType primaryKeys:(NSArray*)primaryKeys {
	if (self = [super init]) {
		
		_primaryKeys = [NSArray arrayWithArray:primaryKeys];
		
		_propertyNames = [[NSMutableDictionary alloc]init];
		_columnNames = [[NSMutableDictionary alloc]init];
		
		NSString  *type,*column_name,*column_type,*property_name,*property_type;
		if(propertyColumnMapping.count > 0){
			NSArray* columns_names = propertyColumnMapping.allKeys;
			
			for (NSInteger i =0; i< columns_names.count; i++) {
				type = column_name = column_type = property_name = property_type = nil;
				column_name = columns_names[i];
				
				NSString* mappingValue = [propertyColumnMapping objectForKey:column_name];
				
				//如果 设置的 属性名 是空白的  自动转成 使用ColumnName
				if(!mappingValue || [@"" isEqualToString:mappingValue]){
					NSLog(@"#ERROR sql column name %@ mapping value is empty,automatically converted LKDBInherit",column_name);
					mappingValue = ZXL_SQL_Mapping_Inherit;
				}
				
				if([mappingValue isEqualToString:ZXL_SQL_Mapping_UserCalculate]){
					type = ZXL_SQL_Mapping_UserCalculate;
					column_type = ZXL_SQL_Type_Text;
				}
				else {
					
					if([mappingValue isEqualToString:ZXL_SQL_Mapping_Inherit] || [mappingValue isEqualToString:ZXL_SQL_Mapping_Binding]){
						type = ZXL_SQL_Mapping_Inherit;
						property_name = column_name;
					}
					else {
						type = ZXL_SQL_Mapping_Binding;
						property_name = mappingValue;
					}
					
					NSUInteger index = [propertyNames indexOfObject:property_name];
					
					NSAssert(index != NSNotFound, @"#ERROR TableMapping SQL column name %@ not fount %@ property name",column_name,property_name);
					
					property_type = [propertyType objectAtIndex:index];
					column_type = ZXLSQLTypeFromObjcType(property_type);
				}
				
				[self addDatabaseModelPropertyColumnMappingWithType:type propertyName:property_name propertyType:property_type columnName:column_name columnType:column_type];
			}
		}
		else {
			for (NSInteger i=0; i < propertyNames.count; i++) {
				type = ZXL_SQL_Mapping_Inherit;
				
				property_name = [propertyNames objectAtIndex:i];
				column_name = property_name;
				
				property_type = [propertyType objectAtIndex:i];
				column_type = ZXLSQLTypeFromObjcType(property_type);
				
				[self addDatabaseModelPropertyColumnMappingWithType:type propertyName:property_name propertyType:property_type columnName:column_name columnType:column_type];
			}
		}
		
		if(_primaryKeys.count == 0){
			_primaryKeys = [NSArray arrayWithObject:@"rowid"];
		}
		
		for (NSString *pkname in _primaryKeys){
			if([pkname.lowercaseString isEqualToString:@"rowid"]){
				if([self objectWithColumnName:pkname] == nil){
					[self addDatabaseModelPropertyColumnMappingWithType:ZXL_SQL_Mapping_Inherit propertyName:pkname propertyType:@"int" columnName:pkname columnType:ZXL_SQL_Type_Int];
				}
			}
		}
	}
	return self;
}

#pragma mark - Private Methods
- (void)addDatabaseModelPropertyColumnMappingWithType:(NSString *)type propertyName:(NSString *)propertyName propertyType:(NSString *)propertyType columnName:(NSString *)columnName columnType:(NSString *)columnType {
	ZXLDatabaseModelPropertyColumnMapping* databaseModelPropertyColumnMapping = [[ZXLDatabaseModelPropertyColumnMapping alloc] initWithType:type propertyName:propertyName propertyType:propertyType columnName:columnName columnType:columnType];
	
	if(databaseModelPropertyColumnMapping.propertyName){
		[_propertyNames setObject:databaseModelPropertyColumnMapping forKey:databaseModelPropertyColumnMapping.propertyName];
	}
	
	if(databaseModelPropertyColumnMapping.columnName)
	{
		[_columnNames setObject:databaseModelPropertyColumnMapping forKey:databaseModelPropertyColumnMapping.columnName];
	}
}




@end



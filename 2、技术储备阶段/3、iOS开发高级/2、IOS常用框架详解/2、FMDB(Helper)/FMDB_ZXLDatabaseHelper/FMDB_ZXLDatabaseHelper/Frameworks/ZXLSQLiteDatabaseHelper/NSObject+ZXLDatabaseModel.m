//
//  NSObject_ZXLDatabaseModel.m
//  BiDaiBaoAPP
//
//  Created by zhang xianglu on 15/7/19.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import "NSObject+ZXLDatabaseModel.h"

#import <objc/runtime.h>
#import "NSObject+ZXLDatabaseORMapping.h"

static NSString *const ZXLDatabaseModel_DEFAULT_PRIMARY_KEY = @"rowid";

static char ZXLDatabaseModel_Key_RowId;

@implementation NSObject (ZXLDatabaseModel)

+ (NSString *)zxl_databaseModelTableName {
	return NSStringFromClass(self);
}

+ (NSString *)zxl_databaseModelPrimaryKey {
	return ZXLDatabaseModel_DEFAULT_PRIMARY_KEY;
}

+ (NSArray *)zxl_databaseModelUnionPrimaryKeyArray
{
	return nil;
}

+ (BOOL)zxl_isContainParentProperty {
	return YES;	
}

+ (BOOL)zxl_isContainSelfProperty {
	return YES;
}



#pragma mark - Public Methods

+ (ZXLDatabaseModelORMapping *)zxl_generateDatabaseModelORMapping {
	static __strong NSMutableDictionary* databaseModelProperties = nil;
	static __strong NSRecursiveLock* recursiveLock = nil;
	
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		databaseModelProperties = [[NSMutableDictionary alloc]initWithCapacity:8];
		recursiveLock = [[NSRecursiveLock alloc]init];
	});
	
	ZXLDatabaseModelORMapping* databaseModelORMapping = nil;
	
	[recursiveLock lock];
	
	databaseModelORMapping = [databaseModelProperties objectForKey:NSStringFromClass(self)];
	if(!databaseModelORMapping){
		NSMutableArray *databaseModelPropertyNames = [NSMutableArray array];
		NSMutableArray *databaseModelPropertyTypes = [NSMutableArray array];
		
		NSDictionary *databaseModelPropertyColumnMappings = [self zxl_databaseModelPropertyColumnMappings];
		
		if ([self zxl_isContainSelfProperty] && [self class] != [NSObject class]){
			[self readSelfPropertiesToPropertyNames:databaseModelPropertyNames andPropertyTypes:databaseModelPropertyTypes];
		}
		
		//主键
		NSArray* pkArray = [self zxl_databaseModelUnionPrimaryKeyArray];
		if(pkArray.count == 0){
			pkArray = nil;
			NSString *pk = [self zxl_databaseModelPrimaryKey];
			if (pk && ![@"" isEqualToString:pk]) {
    			pkArray = [NSArray arrayWithObject:pk];
			}
		}
		
		
		if([self zxl_isContainParentProperty] && [self superclass] != [NSObject class]){
			ZXLDatabaseModelORMapping* superDatabaseModelORMapping = [[self superclass] zxl_generateDatabaseModelORMapping];
			for (NSInteger i = 0; i < superDatabaseModelORMapping.columnCount; i++) {
				ZXLDatabaseModelPropertyColumnMapping *databaseModelPropertyColumnMapping = [superDatabaseModelORMapping objectWithIndex:i];
				if(databaseModelPropertyColumnMapping.propertyName && databaseModelPropertyColumnMapping.propertyType && ![databaseModelPropertyColumnMapping.propertyName isEqualToString:@"rowid"])
				{
					[databaseModelPropertyNames addObject:databaseModelPropertyColumnMapping.propertyName];
					[databaseModelPropertyTypes addObject:databaseModelPropertyColumnMapping.propertyType];
				}
			}
		}
		
		if (databaseModelPropertyNames.count > 0){
			databaseModelORMapping = [[ZXLDatabaseModelORMapping alloc]initWithPropertyColumnMapping:databaseModelPropertyColumnMappings propertyNames:databaseModelPropertyNames propertyType:databaseModelPropertyTypes primaryKeys:pkArray];
		}else {
			databaseModelORMapping = [[ZXLDatabaseModelORMapping alloc] init];
		}
		
		[databaseModelProperties setObject:databaseModelORMapping forKey:NSStringFromClass(self)];
	}
	
	[recursiveLock unlock];
	
	return databaseModelORMapping;
}

#pragma mark - Getters And Setters Methods
- (void)zxl_setDatabaseModelRowId:(NSInteger)databaseModelRowId {
	objc_setAssociatedObject(self, &ZXLDatabaseModel_Key_RowId, @(databaseModelRowId), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSInteger)zxl_databaseModelRowId {
	return [objc_getAssociatedObject(self, &ZXLDatabaseModel_Key_RowId) integerValue];
}



#pragma mark - Private Methods
/**
 *	@brief	获取自身的属性
 *
 *	@param 	pronames 	保存属性名称
 *	@param 	protypes 	保存属性类型
 */
+ (void)readSelfPropertiesToPropertyNames:(NSMutableArray *)propertyNames andPropertyTypes:(NSMutableArray *)propertyTypes{
	unsigned int outCount = 0, i = 0;
	objc_property_t *properties = class_copyPropertyList(self, &outCount);
	
	for (i = 0; i < outCount; i++) {
		objc_property_t selfProperty = properties[i];
		NSString *propertyName = [NSString stringWithCString:property_getName(selfProperty) encoding:NSUTF8StringEncoding];
		
		//取消rowid 的插入 //子类 已重载的属性 取消插入
		if(propertyName.length == 0 || [propertyName isEqualToString:@"rowid"] ||
		   [propertyNames indexOfObject:propertyName] != NSNotFound) continue;
		
		NSString *propertyType = [NSString stringWithCString: property_getAttributes(selfProperty) encoding:NSUTF8StringEncoding];
		
		///过滤只读属性
		if ([propertyType rangeOfString:@",R,"].length > 0 || [propertyType hasSuffix:@",R"])
		{
			NSString* firstWord = [[propertyName substringToIndex:1] uppercaseString];
			NSString* otherWord = [propertyName substringFromIndex:1];
			NSString* setMethodString = [NSString stringWithFormat:@"set%@%@:",firstWord,otherWord];
			SEL setSEL = NSSelectorFromString(setMethodString);
			///有set方法就不过滤了
			if([self instancesRespondToSelector:setSEL] == NO)
			{
				continue;
			}
		}
		
		/*
		 c char
		 i int
		 l long
		 s short
		 d double
		 f float
		 @ id //指针 对象
		 ...  BOOL 获取到的表示 方式是 char
		 .... ^i 表示  int*  一般都不会用到
		 */
		
		NSString* propertyClassName = nil;
		if ([propertyType hasPrefix:@"T@"]) {
			
			NSRange range = [propertyType rangeOfString:@","];
			if(range.location > 4 && range.location <= propertyType.length)
			{
				range = NSMakeRange(3,range.location - 4);
				propertyClassName = [propertyType substringWithRange:range];
				if([propertyClassName hasSuffix:@">"])
				{
					NSRange categoryRange = [propertyClassName rangeOfString:@"<"];
					if (categoryRange.length>0)
					{
						propertyClassName = [propertyClassName substringToIndex:categoryRange.location];
					}
				}
			}
		}
		else if([propertyType hasPrefix:@"T{"])
		{
			NSRange range = [propertyType rangeOfString:@"="];
			if(range.location > 2 && range.location <= propertyType.length)
			{
				range = NSMakeRange(2, range.location-2);
				propertyClassName = [propertyType substringWithRange:range];
			}
		}
		else
		{
			propertyType = [propertyType lowercaseString];
			if ([propertyType hasPrefix:@"ti"] || [propertyType hasPrefix:@"tb"])
			{
				propertyClassName = @"int";
			}
			else if ([propertyType hasPrefix:@"tf"])
			{
				propertyClassName = @"float";
			}
			else if([propertyType hasPrefix:@"td"])
			{
				propertyClassName = @"double";
			}
			else if([propertyType hasPrefix:@"tl"] || [propertyType hasPrefix:@"tq"])
			{
				propertyClassName = @"long";
			}
			else if ([propertyType hasPrefix:@"tc"])
			{
				propertyClassName = @"char";
			}
			else if([propertyType hasPrefix:@"ts"])
			{
				propertyClassName = @"short";
			}
		}
		
		///没找到具体的属性就放弃
		if(!propertyClassName || [@"" isEqualToString:propertyClassName]) continue;
		
		///添加属性
		[propertyNames addObject:propertyName];
		[propertyTypes addObject:propertyClassName];
	}
	
	//获得属性用完后，需立即释放
	free(properties);
	
	if([self zxl_isContainParentProperty] && [self superclass] != [NSObject class]){
		[[self superclass] readSelfPropertiesToPropertyNames:propertyNames andPropertyTypes:propertyTypes];
	}
}



@end

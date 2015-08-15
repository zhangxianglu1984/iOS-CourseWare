//
//  ZXLSQLiteDatabaseConstant.m
//  BiDaiBaoAPP
//
//  Created by zhang xianglu on 15/7/19.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import "ZXLSQLiteDatabaseConstant.h"

NSString *const ZXL_SQL_Type_Text        =   @"text";
NSString *const ZXL_SQL_Type_Int         =   @"integer";
NSString *const ZXL_SQL_Type_Real      =   @"real";
NSString *const ZXL_SQL_Type_Blob        =   @"blob";

NSString *const ZXL_SQL_Attribute_NotNull     =   @"NOT NULL";
NSString *const ZXL_SQL_Attribute_PrimaryKey  =   @"PRIMARY KEY";
NSString *const ZXL_SQL_Attribute_Default     =   @"DEFAULT";
NSString *const ZXL_SQL_Attribute_Unique      =   @"UNIQUE";
NSString *const ZXL_SQL_Attribute_Check       =   @"CHECK";
NSString *const ZXL_SQL_Attribute_ForeignKey  =   @"FOREIGN KEY";

NSString *const ZXL_SQL_Convert_FloatType   =   @"float_double_decimal";
NSString *const ZXL_SQL_Convert_IntType     =   @"int_char_short_long";
NSString *const ZXL_SQL_Convert_BlobType    =   @"";

NSString *const ZXL_SQL_Mapping_Inherit          =   @"ZXLDBInherit";
NSString *const ZXL_SQL_Mapping_Binding          =   @"ZXLDBBinding";
NSString *const ZXL_SQL_Mapping_UserCalculate    =   @"ZXLDBUserCalculate";

NSString *const ZXL_SQL_TypeKey = @"DB_Type";

NSString *const ZXL_SQL_TypeKey_Model = @"DB_Type_Model";
NSString *const ZXL_SQL_TypeKey_JSON = @"DB_Type_JSON";
NSString *const ZXL_SQL_TypeKey_Combo = @"DB_Type_Combo";
NSString *const ZXL_SQL_TypeKey_Date = @"DB_Type_Date";

NSString *const ZXL_SQL_ValueKey = @"DB_Value";

NSString *const ZXL_SQL_TableNameKey = @"DB_TableName";
NSString *const ZXL_SQL_ClassKey = @"DB_Class";
NSString *const ZXL_SQL_RowIdKey = @"DB_RowId";
NSString *const ZXL_SQL_PValueKey = @"DB_PKeyValue";


inline NSString *ZXLSQLTypeFromObjcType(NSString* objcType){
	if([ZXL_SQL_Convert_IntType rangeOfString:objcType].length > 0){
		return ZXL_SQL_Type_Int;
	}
	if ([ZXL_SQL_Convert_FloatType rangeOfString:objcType].length > 0) {
		return ZXL_SQL_Type_Real;
	}
	if ([ZXL_SQL_Convert_BlobType rangeOfString:objcType].length > 0) {
		return ZXL_SQL_Type_Blob;
	}
	
	return ZXL_SQL_Type_Text;
}

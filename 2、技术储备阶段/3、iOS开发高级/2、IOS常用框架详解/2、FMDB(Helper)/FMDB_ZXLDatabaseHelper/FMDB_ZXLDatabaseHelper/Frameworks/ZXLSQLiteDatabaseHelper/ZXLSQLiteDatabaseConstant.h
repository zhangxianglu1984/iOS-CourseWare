//
//  ZXLSQLiteDatabaseConstant.h
//  BiDaiBaoAPP
//
//  Created by zhang xianglu on 15/7/19.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *const ZXL_SQL_Type_Text;
extern NSString *const ZXL_SQL_Type_Int;
extern NSString *const ZXL_SQL_Type_Real;
extern NSString *const ZXL_SQL_Type_Blob;

extern NSString *const ZXL_SQL_Attribute_NotNull;
extern NSString *const ZXL_SQL_Attribute_PrimaryKey;
extern NSString *const ZXL_SQL_Attribute_Default;
extern NSString *const ZXL_SQL_Attribute_Unique;
extern NSString *const ZXL_SQL_Attribute_Check;
extern NSString *const ZXL_SQL_Attribute_ForeignKey;

extern NSString *const ZXL_SQL_Convert_FloatType;
extern NSString *const ZXL_SQL_Convert_IntType;
extern NSString *const ZXL_SQL_Convert_BlobType;

extern NSString *const ZXL_SQL_Mapping_Inherit;
extern NSString *const ZXL_SQL_Mapping_Binding;
extern NSString *const ZXL_SQL_Mapping_UserCalculate;

extern NSString *const ZXL_SQL_TypeKey;

extern NSString *const ZXL_SQL_TypeKey_Model;
extern NSString *const ZXL_SQL_TypeKey_JSON;
extern NSString *const ZXL_SQL_TypeKey_Combo;
extern NSString *const ZXL_SQL_TypeKey_Date;

extern NSString *const ZXL_SQL_ValueKey;

extern NSString *const ZXL_SQL_TableNameKey;
extern NSString *const ZXL_SQL_ClassKey;
extern NSString *const ZXL_SQL_RowIdKey;
extern NSString *const ZXL_SQL_PValueKey;

/**
 *  把Object-c 类型 转换为sqlite 类型
 */  
extern NSString *ZXLSQLTypeFromObjcType(NSString *objcType);


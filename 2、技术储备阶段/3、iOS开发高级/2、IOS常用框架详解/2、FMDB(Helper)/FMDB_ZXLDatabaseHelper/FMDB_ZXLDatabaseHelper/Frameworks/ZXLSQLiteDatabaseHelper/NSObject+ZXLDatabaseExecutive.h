//
//  NSObject+ZXLDatabaseExecutive.h
//  BiDaiBaoAPP
//
//  Created by zhang xianglu on 15/7/19.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (ZXLDatabaseExecutive)

/**
 *  增
 */
- (BOOL)zxl_dataBaseModelInsert;

/**
 *  删
 */
- (BOOL)zxl_dataBaseModeDelete;

/**
 *  改
 */
- (BOOL)zxl_dataBaseModeUpdate;

/**
 *  查
 */
 

@end

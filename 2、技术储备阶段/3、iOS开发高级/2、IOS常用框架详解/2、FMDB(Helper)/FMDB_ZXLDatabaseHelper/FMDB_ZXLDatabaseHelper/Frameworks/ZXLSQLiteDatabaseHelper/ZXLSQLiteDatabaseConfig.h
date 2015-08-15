//
//  ZXLSQLiteDatabaseConfig.h
//  BiDaiBaoAPP
//
//  Created by zhang xianglu on 15/7/19.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZXLSQLiteDatabaseConfig : NSObject

+ (instancetype)sharedConfig;

/**
 *  数据库文件保存路径
 */
@property(nonatomic,copy,readonly) NSString *databaseFilePath;

/**
 *  数据库文件名
 */
@property(nonatomic,copy,readonly) NSString *databaseFileName;


@end




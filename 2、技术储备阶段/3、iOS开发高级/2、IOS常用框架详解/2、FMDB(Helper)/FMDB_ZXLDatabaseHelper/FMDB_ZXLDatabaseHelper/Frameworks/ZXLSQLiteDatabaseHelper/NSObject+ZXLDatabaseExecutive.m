//
//  NSObject+ZXLDatabaseExecutive.m
//  BiDaiBaoAPP
//
//  Created by zhang xianglu on 15/7/19.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import "NSObject+ZXLDatabaseExecutive.h"

@implementation NSObject (ZXLDatabaseExecutive)

+ (ZXLSQLiteDatabaseInstance *)SQLiteDatabaseInstance {
	return [ZXLSQLiteDatabaseInstance sharedInstance];
}



@end

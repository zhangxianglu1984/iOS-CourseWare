//
//  ZXLMainViewController.m
//  FMDB_ZXLDatabaseHelper
//
//  Created by zhang xianglu on 15/8/1.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import "ZXLMainViewController.h"



@interface ZXLMainViewController ()

@end

@implementation ZXLMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   	
	
	ZXLSQLiteDatabaseInstance *databaseInstance = [ZXLSQLiteDatabaseInstance sharedInstance];
	
	[databaseInstance executeDatabaseOperation:^(FMDatabase *database) {
		
	}];
}




@end

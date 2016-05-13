//
//  ViewController.m
//  FMDB
//
//  Created by jianfeng on 15/3/18.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "ViewController.h"
#import "FMDB.h"

@interface ViewController ()
{
    FMDatabase *db;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 如果传入的全路径不存在数据库,那么会创建一个新的(要打开)
    db = [FMDatabase databaseWithPath:[self filePath]];
    NSLog(@"%@",db);
    if (![db open]) {
        NSLog(@"%@",@"数据库打开失败");
    }
    else{
        BOOL success = [db executeUpdate:@"create table if not exists emp (id integer primary key autoincrement, name text)"];
        
        if (success) {
            NSLog(@"建表成功");
        }
        else{
            NSLog(@"建表失败");
        }
    }
}

// 数据库的全路径
- (NSString *)filePath
{
    NSString *docPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    NSLog(@"docPath:%@",docPath);
    return [docPath stringByAppendingPathComponent:@"emp.db"];
}

- (IBAction)insert:(id)sender {
//    [db executeUpdate:@"insert into emp (name) values ('Jim')"];
//    [db executeUpdate:@"insert into emp (name) values ('Linda')"];
//    [db executeUpdate:@"insert into emp (name) values ('Lilei')"];
    
//    [db executeUpdateWithFormat:@"insert into emp (name) values ('%@')",@"mm"];
//    [db executeUpdate:@"insert into emp (name) values(?)",@"Lily"];
}
- (IBAction)query:(id)sender {
    FMResultSet *rs = [db executeQuery:@"select id emp_id,name emp_name from emp"];
    while([rs next]) {
        // 可以从结果集里面的一条记录单独取出字段相关的数据
//        NSString *name = [rs stringForColumn:@"emp_name"];
//        int ID = [rs intForColumn:@"emp_id"];
//        NSLog(@"%@-%d",name, ID);
        
        // 也可以将一条记录作为一个字典输出(字典的key对应了数据库里面的字段名)
        NSDictionary *dic = [rs resultDictionary];
        NSLog(@"%@",dic);
    }
}

@end

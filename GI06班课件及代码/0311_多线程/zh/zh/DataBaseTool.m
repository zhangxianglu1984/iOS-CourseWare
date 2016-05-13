//
//  DataBaseTool.m
//  zh
//
//  Created by jianfeng on 15/3/24.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "DataBaseTool.h"
#import "FMDB.h"

static FMDatabaseQueue *queue;

@implementation DataBaseTool


/*alloc将为Constants实例在堆上分配变量。这时调用一次initialize方法，而且仅调用一次，也就是说再次alloc操作的时候，不会再调用initialize方法了。 initialize 会在运行时仅被触发一次，如果没有向类发送消息的话，这个方法将不会被调用。这个方法的调用是线程安全的。父类会比子类先收到此消息。
 */
+ (void)initialize
{
    NSString *filePath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"myDB.sqlite"];
    
    // 线程安全,防止数据混乱
    queue = [FMDatabaseQueue databaseQueueWithPath:filePath];
    [queue inDatabase:^(FMDatabase *db) {
        // 执行数据库的更新或者查询
        [db executeUpdate:@"create table if not exists t_stories (id integer primary key autoincrement, data blob)"];
        
    }];
}

+ (void)saveStories:(NSDictionary *)dic
{
    [queue inDatabase:^(FMDatabase *db) {
        // 插入数据
        
        // dic转成二进制才能存到数据库
        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:dic];
        
        // 执行更新
        BOOL success = [db executeUpdate:@"insert into t_stories (data) values(?)",data];
        if (success) {
            NSLog(@"插入数据成功");
        }
        else{
            NSLog(@"插入数据失败");
        }
        
    }];
}

+ (NSDictionary *)getStories
{
    __block NSDictionary *dic = nil;
    [queue inDatabase:^(FMDatabase *db) {
        // 取数据
        
        // 执行查询
        FMResultSet *result = [db executeQuery:@"select * from t_stories order by id desc limit 1"];
        NSData *dataResult = nil;
        while ([result next]) {
            dataResult = [result dataForColumn :@"data"];
        }
        dic = [NSKeyedUnarchiver unarchiveObjectWithData:dataResult];
        
    }];
    return dic;
}


@end

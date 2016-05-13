//
//  ViewController.m
//  CellHeight
//
//  Created by jianfeng on 15/3/2.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "ViewController.h"
#import "News.h"
#import "NewsCell.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width

@interface ViewController ()
{
    NSArray *array;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.separatorColor = [UIColor blackColor];
    
    [self initData];
}

- (void)initData
{
    News *news0 = [[News alloc]init];
    news0.title = @"新0";
    news0.content = @"习近平首先欢迎威廉王子王访华，请他转达对伊丽莎白二世女王的诚挚问候和良好祝愿，表示期待年内应女王邀请访问英国，同英国领导人共同规划中英关系未来发展。";
    
    News *news1 = [[News alloc]init];
    news1.title = @"新1";
    news1.content = @"习近平首先欢迎威廉王子王访华，请他转达对伊丽莎白二世女王的诚挚问候和良好祝愿。";
    
    News *news2 = [[News alloc]init];
    news2.title = @"新2";
    news2.content = @"习近平首先欢迎威廉王子王访华，请他转达对伊丽莎白二世女王的诚挚问候和良好祝愿。习近平首先欢迎威廉王子王访华，请他转达对伊丽莎白二世女王的诚挚问候和良好祝愿习近平首先欢迎威廉王子王访华，请他转达对伊丽莎白二世女王的诚挚问候和良好祝愿";
    
    array = @[news0, news1, news2];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return array.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    News *theNews = array[indexPath.row];
    return [self heightForNews:theNews];
    
//    NewsCell *cell = (NewsCell *)[self tableView:tableView cellForRowAtIndexPath:indexPath];
//    return cell.frame.size.height;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    NewsCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[NewsCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    News *theNews = array[indexPath.row];
    cell.model = theNews;
    return cell;
}

- (CGFloat)heightForNews:(News *)news
{
    NSString *str = news.content;
    CGFloat height = [str boundingRectWithSize:CGSizeMake(kScreenWidth - 20 *2 - 50, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName :[UIFont systemFontOfSize:17.0]} context:nil].size.height;
    return height + 40;
}


@end

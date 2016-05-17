//
//  ViewController.m
//  CellExam
//
//  Created by Apple on 15/2/7.
//  Copyright (c) 2015年 Summer. All rights reserved.
//

#import "ViewController.h"
#import "Beauty.h"
#import "BeautyCell.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,BeautyCellDelegate>
{
    UITableView *tableView;
    NSMutableArray *dataList;
}

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initData];
    [self initTableView];
}

- (void)initData
{
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"beauties" ofType:@"plist"];
    NSArray *array = [[NSArray alloc]initWithContentsOfFile:filePath];
    NSMutableArray *tempArray = [NSMutableArray array];
    for (NSDictionary *dic in array) {
        Beauty *beauty = [Beauty beautyWithDic:dic];
        [tempArray addObject:beauty];
    }
    dataList = [tempArray copy];
}

- (void)initTableView
{
    tableView = [[UITableView alloc]initWithFrame:self.view.bounds
                                            style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:tableView];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return dataList.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [BeautyCell cellHeight];
}

- (UITableViewCell *)tableView:(UITableView *)tableView1 cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    BeautyCell *cell = [tableView1 dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[BeautyCell alloc]initWithStyle:UITableViewCellStyleDefault
                                     reuseIdentifier:identifier];
        cell.delegate = self;
    }
    cell.model = dataList[indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView1 didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView1 deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)beautyCell:(BeautyCell *)cell didClickButton:(UIButton *)button
{
    NSIndexPath *indexPath = [tableView indexPathForCell:cell];
    // 取出点中这一行的模型
    Beauty *beautySelect = dataList[indexPath.row];
    
    //
    [beautySelect setIsLike:!beautySelect.isLike];
    
    [tableView reloadData];
    
    Beauty *beauty = dataList[indexPath.row];
    NSString *yesOrNoStr = beauty.isLike== YES ? @"是":@"否";
    NSLog(@"名字:%@, 点赞:%@",beauty.name,yesOrNoStr);

    
}


@end

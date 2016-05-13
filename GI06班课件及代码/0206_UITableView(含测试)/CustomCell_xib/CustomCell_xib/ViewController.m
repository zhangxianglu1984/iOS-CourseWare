//
//  ViewController.m
//  CustomCell_xib
//
//  Created by jianfeng on 15/2/9.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "ViewController.h"
#import "KFC.h"
#import "KFCCell.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *tableView;
    NSMutableArray *array;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.separatorColor = [UIColor blackColor];
    [self.view addSubview:tableView];
    [self initdata];
    
}

- (void)initdata{
    
    NSString *kfcStr = [[NSBundle mainBundle]pathForResource:@"KFC.plist" ofType:nil];
    
    NSArray *arrayKFC = [NSArray arrayWithContentsOfFile:kfcStr];
    array = [NSMutableArray array];
    for (int i = 0; i < arrayKFC.count; i++) {
        KFC *kfc = [KFC kfcWithDic:arrayKFC[i]];
        [array addObject:kfc];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return array.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [KFCCell cellHeight];
}

- (UITableViewCell *)tableView:(UITableView *)tableView1 cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identify = @"KFCCell";
    KFCCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        // 从xib加载cell
        NSArray *arr = [[NSBundle mainBundle] loadNibNamed:@"KFCCell" owner:nil options:nil];
        cell  = arr[0];
    }
    KFC *cellKfc = array[indexPath.row];
    cell.model = cellKfc;
    return cell;
}

@end

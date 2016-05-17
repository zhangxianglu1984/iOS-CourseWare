//
//  ViewController.m
//  CustomKFCCell
//
//  Created by jianfeng on 15/2/6.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "ViewController.h"
#import "KFCCell.h"
#import "KFC.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,KFCCellDelegate>
{
    UITableView *tableView ;
    NSMutableArray *array;
}
@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // mvc
    // model -> Product
    // view  -> cell
    // controller -> self
    
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

- (UITableViewCell *)tableView:(UITableView *)tableView1 cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identify = @"cell";
    KFCCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[KFCCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
        cell.delegate = self;
    }
    KFC *cellKfc = array[indexPath.row];
    cell.kfc = cellKfc;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [KFCCell cellHeight];
}

- (void)kfcCell:(KFCCell *)cell dealWithButton:(UIButton *)button
{
    NSIndexPath *indexPath = [tableView indexPathForCell:cell];
    NSLog(@"%d",indexPath.row);
}


@end

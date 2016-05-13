//
//  ViewController.m
//  UITableView_reuse
//
//  Created by jianfeng on 15/2/3.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *tableView;

}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initTableView];
}

- (void)initTableView
{
    tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.rowHeight = 80;
    tableView.separatorColor = [UIColor blackColor];
    [self.view addSubview:tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1000;
}

// 每次有一个cell出现在屏幕中的时候调用
- (UITableViewCell *)tableView:(UITableView *)tableVie1w cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell0";
    // 1.从缓存池里面取出可复用的cell(标识符相同)
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    // 2.如果没有取到合适的cell,就创建一个新的(绑定标识符)
    if (cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    NSLog(@"%p",cell);
    // 3.修改显示的数据
    cell.textLabel.text = [NSString stringWithFormat:@"line-%d",indexPath.row];
    return cell;
}

@end

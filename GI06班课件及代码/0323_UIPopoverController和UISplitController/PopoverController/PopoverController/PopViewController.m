//
//  PopViewController.m
//  PopoverController
//
//  Created by jianfeng on 15/3/23.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "PopViewController.h"
#import "Color.h"

@interface PopViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *tableView;
    NSArray     *colors;
}

@property(nonatomic, copy) clickBlock cBlock;

@end

@implementation PopViewController

- (instancetype)initWithBlock:(clickBlock) block
{
    if (self = [super init]) {
        self.cBlock = block;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 将来要显示在popover之中的大小
    self.preferredContentSize = CGSizeMake(200, 200);
    
    [self initData];
    [self initViews];
}

- (void)initData
{
    colors = @[[Color colorWithName:@"red" andColor:[UIColor redColor]],
               [Color colorWithName:@"green" andColor:[UIColor greenColor]],
               [Color colorWithName:@"blue" andColor:[UIColor blueColor]]];
}

- (void)initViews
{
    tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
}

#pragma mark - UITableViewDelegate & UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView1 numberOfRowsInSection:(NSInteger)section
{
    return colors.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView1 cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView1 dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    Color *color = colors[indexPath.row];
    cell.textLabel.text = color.name;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Color *model = colors[indexPath.row];
    // 调用block的时候要先判断,有才执行
    if (self.cBlock) {
        self.cBlock(model.color);
    }
    
}

@end

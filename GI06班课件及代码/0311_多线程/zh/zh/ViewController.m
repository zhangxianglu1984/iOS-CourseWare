//
//  ViewController.m
//  zh
//
//  Created by jianfeng on 15/3/10.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
#import "UIKit+AFNetworking.h"
#import "StoriesCell.h"
#import "StoryListModel.h"
#import "Defines.h"
#import "Banner.h"
#import "BannerCell.h"
#import "DetailViewController.h"
#import "DataTool.h"

#define kBannerCell @"BannerCell"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDataSource,UICollectionViewDelegate>
{
    UITableView *tableView;
    NSMutableArray *storiesArray;
    NSMutableArray *topStoriesArray;
    UIPageControl *pageControl;
    
    NSTimer *timer;
    
    UIRefreshControl *refreshControl;
}

@property (nonatomic, strong) Banner *banner;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    // 隐藏navigationbar
    self.navigationController.navigationBarHidden = YES;
    
    [self initTableView];
    
    storiesArray = [NSMutableArray array];
    topStoriesArray = [NSMutableArray array];
    
    [self setupData];
}

- (void)initTableView
{
    tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.tableHeaderView = self.banner;
    tableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:tableView];
    
    pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0, 250 - 20, kScreenWidth, 20)];
    [self.banner.superview addSubview:pageControl];
    
    // 添加内建(系统自带)的下拉刷新控件
    refreshControl = [[UIRefreshControl alloc]init];
    [refreshControl addTarget:self action:@selector(refresh) forControlEvents:UIControlEventValueChanged];
    [tableView addSubview:refreshControl];
}

- (Banner *)banner
{
    if (!_banner) {
        _banner = [[Banner alloc]init];
        _banner.delegate = self;
        _banner.dataSource = self;
        [_banner registerNib:[UINib nibWithNibName:kBannerCell bundle:nil] forCellWithReuseIdentifier:kBannerCell];
    }
    return _banner;
}

- (void)setupData
{
    [DataTool getStoriesWithSuccess:^(NSDictionary *dic) {
        [storiesArray removeAllObjects];
        [topStoriesArray removeAllObjects];
        
        // 展示tableView数据
        NSArray *originArray = dic[@"stories"];
        for (NSDictionary *dic in originArray) {
            StoryListModel *model = [StoryListModel storyListModelWithDic:dic];
            [storiesArray addObject:model];
        }
        [tableView reloadData];
        
        // 展示热门数据(顶部广告栏)
        NSArray *topOriginArray = dic[@"top_stories"];
        for (NSDictionary *dic in topOriginArray) {
            StoryListModel *model = [StoryListModel storyListModelWithDic:dic];
            [topStoriesArray addObject:model];
        }
        [self.banner reloadData];
        
        // 更新页码个数
        pageControl.numberOfPages = topStoriesArray.count;
        
        // 让刷新控件停止转动
        [refreshControl endRefreshing];
        
        // 添加定时器
        // 注意:在控制器里面调用定时器,注意要在页面消失的时候停止掉定时器,并且置空
        //      否则这个定时器会持有控制器,导致页面不能被正常释放
        if (!timer) {
            timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(dealWithTimer) userInfo:nil repeats:YES];
            
            // 手动将定时器加入到common模式下,让拖动页面的时候也能响应定时器事件
            [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
        }
        
    } andFailure:^(NSError *error) {
        NSLog(@"%@",error.localizedDescription);
    }];
}

- (void)refresh
{
    [self setupData];
}

#pragma mark - timer

- (void)dealWithTimer
{
    // 1.获取当前展示的cell处于哪个indexPath
    BannerCell *bCell = [self.banner visibleCells][0];
    NSIndexPath *currIndexPath = [self.banner indexPathForCell:bCell];
    
    // 2.计算下一个要展示的cell的indexPath
    NSIndexPath *nextIndexPath = [NSIndexPath indexPathForItem:currIndexPath.item + 1 inSection:0];
    
    // 3.collectionView滚动到目标位置
    [self.banner scrollToItemAtIndexPath:nextIndexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return storiesArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [StoriesCell cellHeight];
}

- (UITableViewCell *)tableView:(UITableView *)tableView1 cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    StoriesCell *cell = [StoriesCell cellWithTableView:tableView1];
    cell.model = storiesArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailViewController *detail = [[DetailViewController alloc]init];
    detail.storyID = [storiesArray[indexPath.row] ID];
    [self.navigationController pushViewController:detail animated:YES];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return topStoriesArray.count * 1000;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    BannerCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kBannerCell forIndexPath:indexPath];
    cell.model = topStoriesArray[indexPath.row % 5];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
    // 计算UICollectionView的页数的另一个方法
    // 1.取到可见cell的第一个
    if ([collectionView visibleCells].count == 0) {
        return;
    }
    UICollectionViewCell *cell0 = [collectionView visibleCells][0];
    // 2.得到他的下标
    NSIndexPath *indexPath0 = [collectionView indexPathForCell:cell0];
    // 3.算出页数
    pageControl.currentPage = (indexPath0.row) % topStoriesArray.count;
}

@end




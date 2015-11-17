//
//  BDBNoticeListViewController.m
//  BiDaiBaoAPP
//
//  Created by xiangluzhang on 15/10/22.
//  Copyright © 2015年 xiangluzhang. All rights reserved.
//

#import "BDBNoticeListViewController.h"
#import "BDBIndexService.h"
#import "BDBNoticeModel.h"
#import "BDBNoticeListTableCell.h"
#import "BDBNoticeDetailViewController.h"

@interface BDBNoticeListViewController () <UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *noticeListTableView;

@property(nonatomic,strong) NSMutableArray *noticeModels;

@property(nonatomic,assign) NSInteger pageIndex;

@property(nonatomic,strong) NSIndexPath *selectedIndexPath;

@property(nonatomic,weak) BDBLoadDataIndicateView *loadDataIndicateView;

/**
 *  刷新表视图单元格
 */
- (void)p_refreshNoticeListTableCell;

/**
 *  追加表示图单元格
 */
- (void)p_appendNoticeListTableCell;

- (void)p_loadNoticeModelsWithPageIndex:(NSInteger)pageIndex;

/**
 *  初始化表示图
 */
- (void)p_initNoticeListTableView;

@end

@implementation BDBNoticeListViewController

- (instancetype)initWithCoder:(NSCoder *)coder{
    if (self = [super initWithCoder:coder]) {
        self.title = @"公告";
        //当前控制被押入栈中时，隐藏底部tabBar
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.loadDataIndicateView = [BDBLoadDataIndicateView showInView:self.view];
    
    [self p_initNoticeListTableView];
    
    [self p_refreshNoticeListTableCell];
}

- (NSMutableArray *)noticeModels {
    if (!_noticeModels) {
        self.noticeModels = [NSMutableArray array];
    }
    
    return _noticeModels;
}

#pragma mark - Private Methods
- (void)p_initNoticeListTableView {
    _noticeListTableView.dataSource = self;
    _noticeListTableView.delegate = self;
    
    _noticeListTableView.estimatedRowHeight = 70;
    _noticeListTableView.backgroundColor = UIColorWithRGB(239.0, 239.0, 239.0);
    
    __weak typeof(self) weakSelf = self;
    //下拉控件
    _noticeListTableView.header = [BDBTableViewRefreshHeader headerWithRefreshingBlock:^{
        [weakSelf p_refreshNoticeListTableCell];
    }];
    
    //上拉控件
    _noticeListTableView.footer = [BDBTableViewRefreshFooter footerWithRefreshingBlock:^{
        [weakSelf p_appendNoticeListTableCell];
    }];
    
    
    
    
    UINib *BDBNoticeListTableCellNib = [UINib nibWithNibName:@"BDBNoticeListTableCell" bundle:nil];
    
    [_noticeListTableView registerNib:BDBNoticeListTableCellNib forCellReuseIdentifier:@"BDBNoticeListTableCell"];
}

- (void)p_refreshNoticeListTableCell {
    self.pageIndex = 1;
    [self p_loadNoticeModelsWithPageIndex:_pageIndex];
}

- (void)p_appendNoticeListTableCell {
    self.pageIndex ++;
    [self p_loadNoticeModelsWithPageIndex:_pageIndex];
}

- (void)p_loadNoticeModelsWithPageIndex:(NSInteger)pageIndex {
    __weak typeof(self) weakSelf = self;
    [BDBIndexService requestNoticeWithPageIndex:pageIndex success:^(NSArray *noticeModels) {
        
        //将下拉控件收起
        if (weakSelf.noticeListTableView.header.isRefreshing) {
            [weakSelf.noticeModels removeAllObjects];
            [weakSelf.noticeModels addObjectsFromArray:noticeModels];
            
            [weakSelf.noticeListTableView.header endRefreshing];
        }
        
        //将上拉控件收起
        if (weakSelf.noticeListTableView.footer.isRefreshing) {
            [weakSelf.noticeModels addObjectsFromArray:noticeModels];
            
            [weakSelf.noticeListTableView.footer endRefreshing];
        }
        
        //隐藏提示页
        if (weakSelf.loadDataIndicateView) {
            [weakSelf.noticeModels addObjectsFromArray:noticeModels];
            
            [weakSelf.loadDataIndicateView hide];
        }
        
        [weakSelf.noticeListTableView reloadData];
    } failure:^(id obj) {
        ZXLLOG(@"%@",obj);
    }];
    
}



#pragma mark - UITableView DataSource Methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.noticeModels.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"BDBNoticeListTableCell";
    
    BDBNoticeListTableCell *tableViewCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    tableViewCell.noticeModel = self.noticeModels[indexPath.row];
    
    return tableViewCell;
}

#pragma mark - UIScrollView Delegate Methods
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"BDBNoticeListTableCell";
    
    return [tableView fd_heightForCellWithIdentifier:cellIdentifier configuration:^(BDBNoticeListTableCell *tableViewCell) {
        tableViewCell.noticeModel = self.noticeModels[indexPath.row];
    }];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.selectedIndexPath = indexPath;
    
    [self performSegueWithIdentifier:@"gotoBDBNoticeDetailViewController" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([@"gotoBDBNoticeDetailViewController" isEqualToString:segue.identifier]) {
        BDBNoticeDetailViewController *controller = segue.destinationViewController;
        
        BDBNoticeModel *noticeModel = self.noticeModels[_selectedIndexPath.row];
        controller.noticeDetailURL = noticeModel.DetailURL;
    }
}


@end

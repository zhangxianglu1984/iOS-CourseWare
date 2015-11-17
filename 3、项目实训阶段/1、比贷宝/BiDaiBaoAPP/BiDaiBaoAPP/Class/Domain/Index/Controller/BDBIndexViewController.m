//
//  BDBIndexViewController.m
//  BiDaiBaoAPP
//
//  Created by xiangluzhang on 15/10/20.
//  Copyright © 2015年 xiangluzhang. All rights reserved.
//

#import "BDBIndexViewController.h"
#import "BDBIndexTableHeaderView.h"
#import "BDBSubjectTableCell.h"
#import "BDBIndexService.h"

#import <objc/message.h>
#import "BDBSelectAnnualEarningRangeTableCell.h"
#import "BDBSubjectDetailViewController.h"
#import "BDBStatisticsTableCell.h"
#import "BDBStatisticsModel.h"
#import "UILabel+FlickerNumber.h"
#import "BDBNoticeCyclingTableCell.h"
#import "BDBNoticeModel.h"
#import "BDBNoticeDetailViewController.h"


@interface BDBIndexViewController () <UITableViewDataSource,UITableViewDelegate,BDBSelectAnnualEarningRangeTableCellDelegate,BDBStatisticsTableCellDelegate>

@property (weak, nonatomic) IBOutlet UITableView *indexTableView;

@property(nonatomic,weak) BDBLoadDataIndicateView *loadDataIndicateView;

@property(nonatomic,weak) BDBStatisticsTableCell *statisticsTableCell;

@property(nonatomic,weak) BDBNoticeCyclingTableCell *noticeCyclingTableCell;

@property(nonatomic,strong) BDBIndexTableHeaderView *indexTableHeaderView;

@property(nonatomic,assign) BOOL isSelectAnnualEarningRangeTableCelltapped;

@property(nonatomic,strong) NSMutableArray *subjectModels;

@property(nonatomic,assign) NSInteger pageIndex;

@property(nonatomic,copy) NSString *minAnnualEarnings;

@property(nonatomic,copy) NSString *maxAnnualEarnings;

@property(nonatomic,strong) NSIndexPath *selectedSubjectCellIndexPath;

- (void)p_initMemberVariables;

- (void)rightBarButtonItemClickedAction;

- (void)p_initIndexTableView;

- (void)p_refreshIndexTableSubjectCell;

- (void)p_appendIndexTableSubjectCell;

- (void)p_initStatisticsTableCell;

- (void)p_loadSubjectModels;

- (void)p_expandIndexTableHeaderView;

- (void)p_shrinkIndexTableHeaderView;

- (void)p_initNoticeCyclingTableCell;

@end

@implementation BDBIndexViewController

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        self.title = @"比贷宝";
        
        [self p_initMemberVariables];
    }
    
    return self;
}

- (NSMutableArray *)subjectModels {
    if (!_subjectModels) {
        self.subjectModels = [NSMutableArray array];
    }
    return _subjectModels;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //我要在导航栏右边加个铃铛按钮
    UIImage *rightBarButtonImage = [UIImage imageNamed:@"Index_navbar_right_clock"];
    
    rightBarButtonImage = [rightBarButtonImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:rightBarButtonImage style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonItemClickedAction)];
    
    self.navigationItem.rightBarButtonItem = rightBarButtonItem;
    
    self.loadDataIndicateView = [BDBLoadDataIndicateView showInView:self.view];
    
    [self p_initIndexTableView];
    
    [self p_initStatisticsTableCell];
    
    [self p_initNoticeCyclingTableCell];
    
    [self p_refreshIndexTableSubjectCell];
}

- (void)rightBarButtonItemClickedAction {
    [self performSegueWithIdentifier:@"gotoBDBNoticeListViewController" sender:self];
}

#pragma mark - UITableView DataSource Methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger numberOfRowsInSection = 0;
    switch (section) {
        case 0:
        case 1:
        case 2: {
            numberOfRowsInSection = 1;
            break;
        }
        case 3: {
            numberOfRowsInSection = self.subjectModels.count;
            break;
        }
        default:
            break;
    }
    
    return numberOfRowsInSection;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *tableViewCell = nil;
    switch (indexPath.section) {
        case 0: {
            tableViewCell = [BDBNoticeCyclingTableCell cellWithTableView:tableView];
            self.noticeCyclingTableCell = (BDBNoticeCyclingTableCell *)tableViewCell;
            
            break;
        }
        case 1: {
            tableViewCell = [BDBStatisticsTableCell cellWithTableView:tableView];
            objc_msgSend(tableViewCell, @selector(setDelegate:),self);
            self.statisticsTableCell = (BDBStatisticsTableCell *)tableViewCell;
            break;
        }
        case 2: {
            tableViewCell = [BDBSelectAnnualEarningRangeTableCell cellWithTableView:tableView];
            objc_msgSend(tableViewCell, @selector(setDelegate:),self);
            break;
        }
        case 3: {
            tableViewCell = [BDBSubjectTableCell cellWithTableView:tableView];
            
//            [tableViewCell setValue:self.subjectModels[indexPath.row] forKey:@"subjectModel"];
            
//            [tableViewCell performSelector:@selector(setSubjectModel:) withObject:self.subjectModels[indexPath.row]];
            
            //运行时
            objc_msgSend(tableViewCell, @selector(setSubjectModel:),self.subjectModels[indexPath.row]);
            
            
            [tableViewCell setValue:[NSString stringWithFormat:@"%ld",indexPath.row+1] forKeyPath:@"numberLabel.text"];
            
            UIImage *iconBallImage = [UIImage imageNamed:@"Index_icon_gray_ball"];
            if (indexPath.row < 3) {
                iconBallImage = [UIImage imageNamed:@"icon_reddot_03"];
            }
            [tableViewCell setValue:iconBallImage forKeyPath:@"iconBallImageView.image"];
            
            [tableViewCell setValue:self.subjectModels[indexPath.row] forKey:@"subjectModel"];
            
            break;
        }
        default:
            break;
    }
    
    return tableViewCell;
}

#pragma mark - UITableView Delegate Methods
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 3) {
        self.selectedSubjectCellIndexPath = indexPath;
        
        [self performSegueWithIdentifier:@"gotoBDBSubjectDetailViewController" sender:self];
    } else if (indexPath.section == 0) {
        BDBNoticeCyclingTableCell *noticeCyclingTableCell = [tableView cellForRowAtIndexPath:indexPath];
        
        BDBNoticeModel *noticeModel = noticeCyclingTableCell.noticeModels[noticeCyclingTableCell.displayingNoticeModelIndex];
        
        //创建noticeDetailViewController
        UIStoryboard *indexStoryBoard = [UIStoryboard storyboardWithName:@"Index" bundle:nil];
        
        BDBNoticeDetailViewController *noticeDetailViewController = [indexStoryBoard instantiateViewControllerWithIdentifier:@"BDBNoticeDetailViewController"];
        
        noticeDetailViewController.noticeDetailURL = noticeModel.DetailURL;
        
        [self.navigationController pushViewController:noticeDetailViewController animated:YES];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([@"gotoBDBSubjectDetailViewController" isEqualToString:segue.identifier]) {
        BDBSubjectModel *subjectModel = self.subjectModels[_selectedSubjectCellIndexPath.row];
        
        BDBSubjectDetailViewController *subjectDetailViewController = segue.destinationViewController;
        
        subjectDetailViewController.detailURL = subjectModel.DetailURL;
    }
}

#pragma mark - UIScrollView Delegate Methods
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat heightForRowAtIndexPath = 0.0;
    switch (indexPath.section) {
        case 0: {
            heightForRowAtIndexPath = 30.0;
            break;
        }
        case 1: {
            heightForRowAtIndexPath = 95.0;
            break;
        }
        case 2: {
            heightForRowAtIndexPath = 69.0;
            break;
        }
        case 3: {
            heightForRowAtIndexPath = 44.0;
            break;
        }
        default:
            break;
    }
    
    return heightForRowAtIndexPath;
}

#pragma mark - BDBSelectAnnualEarningRangeTableCell Delegate Methods
- (void)tableViewCell:(BDBSelectAnnualEarningRangeTableCell *)tableViewCell didSelectMaxProfitableView:(UIView *)maxProfitableView {
    self.isSelectAnnualEarningRangeTableCelltapped = YES;
    
    self.minAnnualEarnings = @"0.15";
    self.maxAnnualEarnings = @"1.00";
    
    [self p_refreshIndexTableSubjectCell];
}

- (void)tableViewCell:(BDBSelectAnnualEarningRangeTableCell *)tableViewCell didSelectMaxStableView:(UIView *)maxProfitableView {
    self.isSelectAnnualEarningRangeTableCelltapped = YES;
    
    self.minAnnualEarnings = @"0.12";
    self.maxAnnualEarnings = @"0.15";
    
    [self p_refreshIndexTableSubjectCell];
}

- (void)tableViewCell:(BDBSelectAnnualEarningRangeTableCell *)tableViewCell didSelectMaxSafeView:(UIView *)maxProfitableView {
    self.isSelectAnnualEarningRangeTableCelltapped = YES;
    
    self.minAnnualEarnings = @"0.00";
    self.maxAnnualEarnings = @"0.12";
    
    [self p_refreshIndexTableSubjectCell];
}

#pragma mark - BDBStaticsTableCell Delegate Methods
- (void)statisticsTableCell:(BDBStatisticsTableCell *)statisticsTableCell didClickInvestableFundButton:(UIButton *)investableFundButton willUpdateInvestableFundLabel:(UILabel *)investableFundLable {
    [BDBIndexService requestStatisticsWithSuccess:^(BDBStatisticsModel *statisticsModel) {
        
        NSNumber *investableFundAmount = [NSNumber numberWithFloat:[statisticsModel.AmountRemain floatValue]];
        [investableFundLable dd_setNumber:investableFundAmount];
        
    } failure:^(id obj) {}];
}

- (void)statisticsTableCell:(BDBStatisticsTableCell *)statisticsTableCell didClickInvestableProjectButton:(UIButton *)investableProjectButton willUpdateInvestableProjectLabel:(UILabel *)investableProjectLable {
    [BDBIndexService requestStatisticsWithSuccess:^(BDBStatisticsModel *statisticsModel) {
        
        NSNumber *investableProjectNumber = [NSNumber numberWithFloat:[statisticsModel.BidNum integerValue]];
        [investableProjectLable dd_setNumber:investableProjectNumber];
        
    } failure:^(id obj) {}];
}

- (void)statisticsTableCell:(BDBStatisticsTableCell *)statisticsTableCell didClickMaxProfitButton:(UIButton *)maxProfitButton willUpdateMaxProfitLabel:(UILabel *)maxProfitLable {
    [BDBIndexService requestStatisticsWithSuccess:^(BDBStatisticsModel *statisticsModel) {
        
        NSNumber *maxProfit = [NSNumber numberWithFloat:statisticsModel.EarningsMax * 100.0];
        
        [maxProfitLable dd_setNumber:maxProfit format:@"%.1f%%"];
        
    } failure:^(id obj) {}];
}

- (void)statisticsTableCell:(BDBStatisticsTableCell *)statisticsTableCell didClickInvestPeopleNumberButton:(UIButton *)investPeopleNumberButton willUpdateInvestPeopleNumberLabel:(UILabel *)investPeopleNumberLable {
    [BDBIndexService requestStatisticsWithSuccess:^(BDBStatisticsModel *statisticsModel) {
        
        NSNumber *investPeopleNumber = [NSNumber numberWithInteger:[statisticsModel.InvestorNum integerValue]];
        
        [investPeopleNumberLable dd_setNumber:investPeopleNumber];
        
    } failure:^(id obj) {}];
}

- (void)statisticsTableCell:(BDBStatisticsTableCell *)statisticsTableCell didClickHideAndShowAdvButton:(UIButton *)hideAndShowAdvButton {
    hideAndShowAdvButton.isSelected? [self p_expandIndexTableHeaderView] : [self p_shrinkIndexTableHeaderView];
}

#pragma mark - Private Methods
- (void)p_initIndexTableView {
    _indexTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    _indexTableView.dataSource = self;
    _indexTableView.delegate = self;
    
    _indexTableView.estimatedRowHeight = 50.0;
    
    __weak typeof(self) weakSelf = self;
    //下拉刷新
    _indexTableView.header = [BDBTableViewRefreshHeader headerWithRefreshingBlock:^{
        [weakSelf p_refreshIndexTableSubjectCell];
    }];
    //上拉加载更多
    _indexTableView.footer = [BDBTableViewRefreshFooter footerWithRefreshingBlock:^{
        [weakSelf p_appendIndexTableSubjectCell];
    }];
    
    //表头部视图
    BDBIndexTableHeaderView *indexTableHeaderView = [BDBIndexTableHeaderView new];
    
    //根据一个视图的约束，计算出它的framesize
    CGSize indexTableHeaderViewSize = [indexTableHeaderView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    
    indexTableHeaderView.height = indexTableHeaderViewSize.height;
    
    _indexTableView.tableHeaderView = indexTableHeaderView;
    self.indexTableHeaderView = indexTableHeaderView;
    
    [self performSelector:@selector(p_shrinkIndexTableHeaderView) withObject:nil afterDelay:6.0];
}

- (void)p_refreshIndexTableSubjectCell {
    self.pageIndex = 1;
    [self p_loadSubjectModels];
}

- (void)p_appendIndexTableSubjectCell {
    self.pageIndex ++;
    [self p_loadSubjectModels];
}

- (void)p_loadSubjectModels {
    __weak typeof(self) weakSelf = self;
    [BDBIndexService requestWorthyBidsAtPageIndex:_pageIndex minAnnualEarnings:_minAnnualEarnings maxAnnualEarnings:_maxAnnualEarnings
        success:^(NSArray *bidList) {
            //1、第一次加载数据(加载页)
            if (_loadDataIndicateView) {
                //处理数据
                [weakSelf.subjectModels addObjectsFromArray:bidList];
              
                [_loadDataIndicateView hide];
            }
      
            //2、下拉刷新
            if ([weakSelf.indexTableView.header isRefreshing]) {
                [weakSelf.subjectModels removeAllObjects];
                [weakSelf.subjectModels addObjectsFromArray:bidList];
                  
                [weakSelf.indexTableView.header endRefreshing];
            }
      
            //3、点击>12%.按钮
            if (_isSelectAnnualEarningRangeTableCelltapped){
                [weakSelf.subjectModels removeAllObjects];
                [weakSelf.subjectModels addObjectsFromArray:bidList];
                
                self.isSelectAnnualEarningRangeTableCelltapped = NO;
            }
            
            //上拉加载更多
            if ([weakSelf.indexTableView.footer isRefreshing]) {
                [weakSelf.subjectModels addObjectsFromArray:bidList];
                
                [weakSelf.indexTableView.footer endRefreshing];
            }
      
            //重新刷新表格视图
            NSIndexSet *reloadSectionIndexSet = [NSIndexSet indexSetWithIndex:3];
            [_indexTableView reloadSections:reloadSectionIndexSet withRowAnimation:UITableViewRowAnimationNone];
        } failure:^(id obj) {
            ZXLLOG(@"%@",obj);
    }];
}

- (void)p_initStatisticsTableCell {
    __weak typeof(self) weakSelf = self;
    [BDBIndexService requestStatisticsWithSuccess:^(BDBStatisticsModel *statisticsModel) {
        BDBStatisticsTableCell *statisticsTableCell = weakSelf.statisticsTableCell;
        
        statisticsTableCell.investableFundLabel.text = statisticsModel.AmountRemain;
        
        statisticsTableCell.investableProjectLabel.text = statisticsModel.BidNum;
        
        statisticsTableCell.maxProfitLabel.text = [NSString stringWithFormat:@"%.1f%%",statisticsModel.EarningsMax * 100.0];
        
        statisticsTableCell.investPeopleNumberLabel.text = statisticsModel.InvestorNum;
        
    } failure:^(id obj) {}];
}

- (void)p_initMemberVariables {
    self.minAnnualEarnings = @"0.15";
    self.maxAnnualEarnings = @"1.00";
    
    self.isSelectAnnualEarningRangeTableCelltapped = NO;
}

- (void)p_expandIndexTableHeaderView {
    _indexTableView.tableHeaderView = _indexTableHeaderView;
}

- (void)p_shrinkIndexTableHeaderView {
    _indexTableView.tableHeaderView = nil;
}

- (void)p_initNoticeCyclingTableCell {
    [BDBIndexService requestNoticeWithPageIndex:1 success:^(NSArray *noticeModels) {
        //把数据交给cell的label，显示出来
//        NSIndexPath *noticeCyclingTableCellIndexPath = [NSIndexPath indexPathForRow:0 inSection:0];
//        
//        BDBNoticeCyclingTableCell *noticeCyclingTableCell = [_indexTableView cellForRowAtIndexPath:noticeCyclingTableCellIndexPath];
        
        _noticeCyclingTableCell.noticeModels = noticeModels;
        
    } failure:^(id obj) {}];
}

@end

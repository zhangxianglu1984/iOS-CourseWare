//
//  IMCMainViewController.m
//  Demo_QQ好友列表
//
//  Created by xiangluzhang on 15/12/16.
//  Copyright © 2015年 xiangluzhang. All rights reserved.
//

#import "IMCMainViewController.h"

#import "IMCContactTableViewSectionHeader.h"

static NSString *const kContactTableViewCellIdentifier = @"ContactTableViewCellIdentifier";

static NSString *const kContactTableViewSectionHeaderIdentifier = @"ContactTableViewSectionHeaderIdentifier";

@interface IMCMainViewController () <UITableViewDataSource,UITableViewDelegate,IMCContactTableViewSectionHeaderDelegate>

@property (weak, nonatomic) IBOutlet UITableView *contactTableView;

@property(nonatomic,copy) NSArray *contactDatas;

@property(nonatomic,strong) NSMutableArray *contactTableViewSectionHeaders;

@end

@implementation IMCMainViewController

- (instancetype)init {
    if (self = [super init]) {
        self.contactTableViewSectionHeaders = [NSMutableArray array];
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    _contactTableView.dataSource = self;
    _contactTableView.delegate = self;
    
    //设置SectionHeader的高度
    _contactTableView.sectionHeaderHeight = 50.0;
    _contactTableView.rowHeight = 44.0;
    
    //注册单元格
    [_contactTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kContactTableViewCellIdentifier];
    //注册SectionHeader
    [_contactTableView registerClass:[IMCContactTableViewSectionHeader class] forHeaderFooterViewReuseIdentifier:kContactTableViewSectionHeaderIdentifier];
    
}


#pragma mark - UITableView DataSource Methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.contactDatas.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    __block NSInteger numberOfRowsInSection = 0;
    
    [_contactTableViewSectionHeaders enumerateObjectsUsingBlock:^(IMCContactTableViewSectionHeader *sectionHeader, NSUInteger idx, BOOL * _Nonnull stop) {
        if (sectionHeader.section == section) {
            switch (sectionHeader.buttonArrowType) {
                case IMCContactTableViewSectionHeaderButtonArrowTypeDown: {
                    NSArray *contactGroup = [self.contactDatas[section] objectForKey:@"friends"];
                    
                    numberOfRowsInSection = contactGroup.count;
                    break;
                }
                case IMCContactTableViewSectionHeaderButtonArrowTypeRight: {
                    numberOfRowsInSection = 0;
                    break;
                }
                default:
                    break;
            }
            *stop = YES;
        }
    }];
    
    return numberOfRowsInSection;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *contactTableViewCell = [tableView dequeueReusableCellWithIdentifier:kContactTableViewCellIdentifier forIndexPath:indexPath];
    
    NSArray *contactGroup = [self.contactDatas[indexPath.section] objectForKey:@"friends"];
    
    contactTableViewCell.textLabel.text = contactGroup[indexPath.row];
    
    return contactTableViewCell;
}

//- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
//    return [self.contactDatas[section] objectForKey:@"group"];
//}

#pragma mark - UITableView Delegate Methods
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    IMCContactTableViewSectionHeader *tableViewSectionHeader = nil;
    
    static NSInteger sectionCount = 0;
    if (sectionCount < self.contactDatas.count) {
        tableViewSectionHeader = [[IMCContactTableViewSectionHeader alloc] initWithReuseIdentifier:kContactTableViewSectionHeaderIdentifier];
        
        tableViewSectionHeader.delegate = self;
        
        tableViewSectionHeader.title = [self.contactDatas[section] objectForKey:@"group"];
        
        tableViewSectionHeader.section = section;
        
        [_contactTableViewSectionHeaders addObject:tableViewSectionHeader];
        
        sectionCount ++;
    } else {
        tableViewSectionHeader = _contactTableViewSectionHeaders[section];
    }
    
    return tableViewSectionHeader;
}

#pragma mark - IMCContactTableViewSectionHeader Delegate Methods
- (void)contactTableViewSectionHeader:(IMCContactTableViewSectionHeader *)contactTableViewSectionHeader inSection:(NSInteger)section buttonArrowType:(IMCContactTableViewSectionHeaderButtonArrowType)buttonArrowType{
    //刷新指定section
    [_contactTableView reloadSections:[NSIndexSet indexSetWithIndex:section] withRowAnimation:UITableViewRowAnimationFade];
}

- (NSArray *)contactDatas {
    if (_contactDatas == nil) {
        NSString *contactFilePath = [[NSBundle mainBundle] pathForResource:@"friends" ofType:@"plist"];
        
        self.contactDatas = [NSArray arrayWithContentsOfFile:contactFilePath];
    }
    return _contactDatas;
}


@end

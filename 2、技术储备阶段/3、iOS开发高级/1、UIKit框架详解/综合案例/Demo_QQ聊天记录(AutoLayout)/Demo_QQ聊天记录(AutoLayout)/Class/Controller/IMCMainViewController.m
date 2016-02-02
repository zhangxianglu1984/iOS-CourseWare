//
//  IMCMainViewController.m
//  Demo_QQ聊天记录(AutoLayout)
//
//  Created by xiangluzhang on 15/12/18.
//  Copyright © 2015年 xiangluzhang. All rights reserved.
//

#import "IMCMainViewController.h"

#import "IMCDialogMessageModel.h"
#import "IMCDialogTableViewSendMessageCell.h"
#import "IMCDialogTableViewReceiveMessageCell.h"

#import "UITableView+FDTemplateLayoutCell.h"

@interface IMCMainViewController () <UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *dialogTableView;

@property(nonatomic,strong) NSMutableArray *dialogMessageModels;

@end

@implementation IMCMainViewController

- (instancetype)initWithCoder:(NSCoder *)coder {
    if (self = [super initWithCoder:coder]) {
        self.title = @"盖茨比";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //不让Cell响应用户的触摸
    //_dialogTableView.allowsSelection = NO;
    _dialogTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _dialogTableView.backgroundColor = [UIColor grayColor];
    
    _dialogTableView.estimatedRowHeight = 70.0;
    
    _dialogTableView.delegate = self;
    _dialogTableView.dataSource = self;
    
    UINib *dialogTableViewSendMessageCellNib = [UINib nibWithNibName:@"IMCDialogTableViewSendMessageCell" bundle:nil];
    [_dialogTableView registerNib:dialogTableViewSendMessageCellNib forCellReuseIdentifier:@"IMCDialogTableViewSendMessageCell"];
    
    UINib *dialogTableViewReceiveMessageCellNib = [UINib nibWithNibName:@"IMCDialogTableViewReceiveMessageCell" bundle:nil];
    [_dialogTableView registerNib:dialogTableViewReceiveMessageCellNib forCellReuseIdentifier:@"IMCDialogTableViewReceiveMessageCell"];
}

- (NSMutableArray *)dialogMessageModels {
    if (_dialogMessageModels == nil) {
        self.dialogMessageModels = [NSMutableArray array];
        
        NSString *dialogMessageFilePath = [[NSBundle mainBundle] pathForResource:@"messages" ofType:@"plist"];
        NSArray *dialogMessages = [NSArray arrayWithContentsOfFile:dialogMessageFilePath];
        [dialogMessages enumerateObjectsUsingBlock:^(NSDictionary *dialogMessage, NSUInteger idx, BOOL *stop) {
            IMCDialogMessageModel *dialogMessageModel = [IMCDialogMessageModel modelWithDictionary:dialogMessage];
            
            [_dialogMessageModels addObject:dialogMessageModel];
        }];
    }
    return _dialogMessageModels;
}

#pragma mark - UITableView DataSource Methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dialogMessageModels.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *tableViewCell = nil;
    
    IMCDialogMessageModel *dialogMessageModel = [self.dialogMessageModels objectAtIndex:indexPath.row];
    switch (dialogMessageModel.type) {
        case DialogMessageTypeSend: {
            tableViewCell = [IMCDialogTableViewSendMessageCell cellWithTableView:tableView indexPath:indexPath];
            //KVC
            [tableViewCell setValue:dialogMessageModel forKey:@"dialogMessageModel"];
            
//            [tableViewCell performSelector:@selector(setDialogMessageModel:) withObject:dialogMessageModel];
            
            break;
        }
        case DialogMessageTypeReceive: {
            tableViewCell = [IMCDialogTableViewReceiveMessageCell cellWithTableView:tableView indexPath:indexPath];
            
            //KVC
            [tableViewCell setValue:dialogMessageModel forKey:@"dialogMessageModel"];
            
            break;
        }
        default:
            break;
    }
    
    return tableViewCell;
}

#pragma mark - UITableView Delegate Methods
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat tableViewRowHeight = 0.0;
    
    IMCDialogMessageModel *dialogMessageModel = self.dialogMessageModels[indexPath.row];
    //约束->尺寸
    switch (dialogMessageModel.type) {
        case DialogMessageTypeSend: {
            tableViewRowHeight = [tableView fd_heightForCellWithIdentifier:@"IMCDialogTableViewSendMessageCell" configuration:^(IMCDialogTableViewSendMessageCell *cell) {
                cell.dialogMessageModel = dialogMessageModel;
            }];
           // NSLog(@"tableViewRowHeight = %g",tableViewRowHeight);
            break;
        }
        case DialogMessageTypeReceive: {
            tableViewRowHeight = [tableView fd_heightForCellWithIdentifier:@"IMCDialogTableViewReceiveMessageCell" configuration:^(IMCDialogTableViewReceiveMessageCell *cell) {
               
                cell.dialogMessageModel = dialogMessageModel;
                
            }];
            NSLog(@"tableViewRowHeight = %g",tableViewRowHeight);
            //tableViewRowHeight = 66.0;
            break;
        }
        default:
            break;
    }
    
    return tableViewRowHeight;
}


@end

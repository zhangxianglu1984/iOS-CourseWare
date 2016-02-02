//
//  IMCMainViewController.m
//  Demo_QQ聊天界面
//
//  Created by xiangluzhang on 15/12/17.
//  Copyright © 2015年 xiangluzhang. All rights reserved.
//

#import "IMCMainViewController.h"

#import "IMCDialogMessageModel.h"
#import "IMCDialogTableViewMessageCell.h"
#import "IMCDialogMessageCellFrameModel.h"

@interface IMCMainViewController () <UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *dialogTableView;

@property(nonatomic,strong) NSMutableArray *dialogMessageCellFrameModels;

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
    
    _dialogTableView.delegate = self;
    _dialogTableView.dataSource = self;
}

- (NSMutableArray *)dialogMessageCellFrameModels {
    if (_dialogMessageCellFrameModels == nil) {
        self.dialogMessageCellFrameModels = [NSMutableArray array];
        
        NSString *dialogMessageFilePath = [[NSBundle mainBundle] pathForResource:@"messages" ofType:@"plist"];
        NSArray *dialogMessages = [NSArray arrayWithContentsOfFile:dialogMessageFilePath];
        [dialogMessages enumerateObjectsUsingBlock:^(NSDictionary *dialogMessage, NSUInteger idx, BOOL *stop) {
            //字典->数据模型
            IMCDialogMessageModel *dialogMessageModel = [IMCDialogMessageModel modelWithDictionary:dialogMessage];
            
            BOOL isDisplayTime = YES;
            if (_dialogMessageCellFrameModels.count >= 1) {
                IMCDialogMessageModel *lastDialogMessageModel = [[_dialogMessageCellFrameModels lastObject] dialogMessageModel];
                if ([dialogMessageModel.time isEqualToString:lastDialogMessageModel.time]) {
                    isDisplayTime = NO;
                }
            }
            dialogMessageModel.isDisplayTime = isDisplayTime;
            
            //数据模型->Frame模型
            IMCDialogMessageCellFrameModel *dialogMessageCellFrameModel = [IMCDialogMessageCellFrameModel frameModelWithDialogMessageModel:dialogMessageModel];
            
            [_dialogMessageCellFrameModels addObject:dialogMessageCellFrameModel];
        }];
    }
    return _dialogMessageCellFrameModels;
}

#pragma mark - UITableView DataSource Methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dialogMessageCellFrameModels.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    IMCDialogTableViewMessageCell *tableViewCell = [IMCDialogTableViewMessageCell cellWithTableView:tableView];
    
    tableViewCell.frameModel = self.dialogMessageCellFrameModels[indexPath.row];
    
    return tableViewCell;
}

#pragma mark - UITableView Delegate Methods
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    //FrameModel->Cell
    IMCDialogMessageCellFrameModel *dialogMessageCellFrameModel = self.dialogMessageCellFrameModels[indexPath.row];
    
    return dialogMessageCellFrameModel.dialogMessageCellHeight;
}


//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//
//    //1、实例化新的场景
//    //2、给新的场景传值(prepareForSegue)
//    //3、present新的场景
//    [self performSegueWithIdentifier:@"IMCXXXSegue" sender:self];
//}

//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    if ([segue.identifier isEqualToString:@"IMCXXXSegue"]) {
//        IMCMainViewController *vc = segue.destinationViewController;
//    }
//}

@end

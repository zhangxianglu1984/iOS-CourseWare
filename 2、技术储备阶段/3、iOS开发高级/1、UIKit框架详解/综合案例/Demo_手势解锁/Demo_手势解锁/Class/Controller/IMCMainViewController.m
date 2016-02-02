//
//  IMCMainViewController.m
//  Demo_手势解锁
//
//  Created by xiangluzhang on 15/12/15.
//  Copyright © 2015年 xiangluzhang. All rights reserved.
//

#import "IMCMainViewController.h"

#import "IMCSetPasswordViewController.h"
#import "IMCModifyPasswordViewController.h"
#import "IMCResetPasswordViewController.h"

@interface IMCMainViewController ()

- (IBAction)setPasswordButtonClickedAction;
- (IBAction)modifyPasswordButtonClickedAction;
- (IBAction)resetPasswordButtonClickedAction;

@end

@implementation IMCMainViewController

- (instancetype)init {
    if (self = [super init]) {
        self.title = @"手势解锁";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)setPasswordButtonClickedAction {
    IMCSetPasswordViewController *setPasswordViewController = [IMCSetPasswordViewController new];
    [self.navigationController pushViewController:setPasswordViewController animated:NO];
}

- (IBAction)modifyPasswordButtonClickedAction {
    IMCModifyPasswordViewController *modifyPasswordViewContrller = [IMCModifyPasswordViewController new];
    [self.navigationController pushViewController:modifyPasswordViewContrller animated:YES];
}

- (IBAction)resetPasswordButtonClickedAction {
    IMCResetPasswordViewController *resetPasswordViewController = [IMCResetPasswordViewController new];
    [self.navigationController pushViewController:resetPasswordViewController animated:YES];
}
@end

//
//  IMCMainViewController.m
//  Demo_Autolayout(键盘移动)
//
//  Created by zhang xianglu on 15/6/18.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import "IMCMainViewController.h"
#import "ZXLKeyBoardSpacingView.h"

@interface IMCMainViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation IMCMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
	ZXLKeyBoardSpacingView *keyBoardSpacingView = [ZXLKeyBoardSpacingView installToView:self.view];
	
//	NSString *visualFormat = @"V:[textField][keyBoardSpacingView]|";
//	NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:visualFormat options:0 metrics:nil views:@{@"textField": _textField,@"keyBoardSpacingView": keyBoardSpacingView}];
//	
//	[self.view addConstraints:constraints];
}


@end

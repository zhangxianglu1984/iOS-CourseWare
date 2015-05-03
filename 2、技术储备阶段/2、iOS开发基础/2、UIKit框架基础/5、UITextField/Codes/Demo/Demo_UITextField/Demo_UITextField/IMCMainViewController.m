//
//  IMCMainViewController.m
//  Demo_UITextField
//
//  Created by zhang xianglu on 15/4/27.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import "IMCMainViewController.h"

@interface IMCMainViewController () <UITextFieldDelegate>

@end

@implementation IMCMainViewController

- (instancetype)initWithCoder:(NSCoder *)coder
{
	self = [super initWithCoder:coder];
	if (self) {
		NSFileManager *fileManager = [NSFileManager defaultManager];
		
		NSArray *filePaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	
		NSString *filePath = [NSString stringWithFormat:@"%@/%@",filePaths[0],@"address.txt"];
		
		NSLog(@"filePath: %@",filePath);
		
		NSString *content = @"Hello World!";
		
		NSData *contentDatas = [content dataUsingEncoding:NSUTF8StringEncoding];
		
		[fileManager createFileAtPath:filePath contents:contentDatas attributes:nil];
		
	}
	return self;
}

/** 只能使用auto layout 的方式添加组件 **/
- (void)viewDidLoad {
    [super viewDidLoad];
	
	/** 文本输入框 **/
	UITextField *textField = [[UITextField alloc] init];
	//textField.backgroundColor = [UIColor greenColor];
	textField.delegate = self;
	textField.keyboardType = UIKeyboardTypeDefault;
	textField.clearButtonMode = UITextFieldViewModeAlways;
	textField.returnKeyType = UIReturnKeyDone;
	textField.placeholder = @"请输入密码";
	textField.secureTextEntry = YES;
	
	textField.translatesAutoresizingMaskIntoConstraints = NO;

	
	//NSMutableArray *layoutConstaints = [[NSMutableArray alloc] initWithCapacity:5];
	
//	NSLayoutConstraint *layoutConstaint_1 = [NSLayoutConstraint constraintWithItem:textField attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1 constant:0];
//	[layoutConstaints addObject:layoutConstaint_1];
//	
//	NSArray *layoutConstraint_2 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-40-[textField]-80-|" options:NSLayoutFormatAlignAllCenterY metrics:nil views:@{@"textField":textField}];
//	[layoutConstaints addObjectsFromArray:layoutConstraint_2];
	
	//[self.view addConstraints:layoutConstaints];
	
}

/** 通过frame的方式添加组件 **/
- (void)viewWillLayoutSubviews {
	[super viewWillLayoutSubviews];
	
	
}

#pragma mark - UITextField Delegate Methods
/** 当用户点击进入文本框的时候发送的消息 
	返回值
		YES 弹出键盘
		NO  不弹出键盘
**/
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
	NSLog(@"textFieldShouldBeginEditing..");
	return YES;
}

/**
	键盘弹起之后调用
**/
- (void)textFieldDidBeginEditing:(UITextField *)textField {
	NSLog(@"textFieldDidBeginEditing..");
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
	NSLog(@"textFieldShouldEndEditing..");
	return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
	NSLog(@"textFieldDidEndEditing..");
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
	
	NSLog(@"%@",NSStringFromRange(range));
	NSLog(@"shouldChangeCharactersInRange: %@",string);
	
	return YES;	
}

- (BOOL)textFieldShouldClear:(UITextField *)textField {
	NSLog(@"textFieldShouldClear..");
	return YES;
}

/** 当用户点击return时调用 **/
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
	NSLog(@"textFieldShouldReturn: %@",textField.text);

	[textField resignFirstResponder];
	
	return YES;
}	


@end

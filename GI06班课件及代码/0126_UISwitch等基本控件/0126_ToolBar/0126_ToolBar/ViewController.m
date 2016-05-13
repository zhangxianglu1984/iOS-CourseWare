//
//  ViewController.m
//  0126_ToolBar
//
//  Created by jianfeng on 15/1/26.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "ViewController.h"
#import "Defines.h"

@interface ViewController ()
{
    UITextView *textView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];

    UIToolbar *toolBarTop = [[UIToolbar alloc]init];
    toolBarTop.frame = CGRectMake(0, 0, self.view.bounds.size.width, 44);
    NSLog(@"%@",toolBarTop.tintColor);
  
    [self.view addSubview:toolBarTop];
    
    // 使用标题来初始化item
    UIBarButtonItem *item0 = [[UIBarButtonItem alloc]initWithTitle:@"我的" style:UIBarButtonItemStylePlain target:self action:@selector(clickMine:)];
    // 使用图片来初始化item
    UIImage *image = [UIImage imageNamed:@"001"];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc]initWithImage:image style:UIBarButtonItemStylePlain target:self action:@selector(clickImage:)];

    // 使用系统自定义的样式初始化item
    UIBarButtonItem *flex = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
//
//    // 使用自定义的view进行初始化
//    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 50, 44)];
//    titleLabel.text = @"标题";
//    UIBarButtonItem *itemTitle = [[UIBarButtonItem alloc]initWithCustomView:titleLabel];

//    // 使用item组成的数组给toolBar的item属性赋值,让这些item显示到toolBar上
    toolBarTop.items = @[item0,flex,item1];
    
    
    textView = [[UITextView alloc]initWithFrame:CGRectMake(0, 44, kScreenWidth, 200)];
    textView.font = [UIFont systemFontOfSize:30];
    textView.backgroundColor = [UIColor lightGrayColor];
    textView.returnKeyType = UIReturnKeySearch;
    [self.view addSubview:textView];
    
    // 自定义键盘附件(点击完成,收起键盘)
    UIToolbar *toolBar = [[UIToolbar alloc]init];
    toolBar.backgroundColor = [UIColor orangeColor];
    toolBar.frame = CGRectMake(0, 0, kScreenWidth, 44);
    
    UIBarButtonItem *item01 = [[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(done:)];
    UIBarButtonItem *flex2 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    toolBar.items =@[flex2,item01];
    
    textView.inputAccessoryView = toolBar;
}

- (void)clickMine:(UIBarButtonItem*) item
{
    NSLog(@"我的");
}

- (void)clickImage:(UIBarButtonItem *)item
{
    NSLog(@"点击图片");
}

- (IBAction)done:(id)sender {
    [textView resignFirstResponder];
//    [self.view endEditing:YES];
}
@end

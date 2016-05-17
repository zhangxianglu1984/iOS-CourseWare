//
//  ViewController.m
//  UIPresentationController
//
//  Created by jianfeng on 15/3/23.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "ViewController.h"
#import "ModalViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /* iOS8的新特性(至少要答这三点)
     * sizeClasses
     * UIAlertController
     * UIPresentationController
     */
    
    // UIPresentationController是用来管理所有以modal形式展现的控制器
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    // 在iPad中是气泡形式,在iPhone中是从底部弹出(默认的present样式)
    ModalViewController *modalPopover = [[ModalViewController alloc]init];
    
    // 在设定是popover展现的情况下,还会生成一个popoverPresentationController,而且这个popoverPresentationController等同于presentationController;
    // 如果不是popover形式,打印的popoverPresentationController是空的
    modalPopover.modalPresentationStyle = UIModalPresentationPopover;
    modalPopover.popoverPresentationController.sourceView = self.view;
    modalPopover.popoverPresentationController.sourceRect = CGRectMake(10, 10, 100, 100);
    
    [self presentViewController:modalPopover animated:YES completion:nil];
    
    NSLog(@"%@--%@",modalPopover.presentationController,modalPopover.popoverPresentationController);
    
    //    ModalViewController *modalVC = [[ModalViewController alloc]init];
    //    modalVC.modalPresentationStyle = UIModalPresentationFormSheet;
    //    // 需要modal形式展现的控制,在调用present...方法时,就会自动生成一个presentationController的类
    //    [self presentViewController:modalVC animated:YES completion:nil];
    ////    NSLog(@"%@", modalVC.presentationController);
    //
    //    // UIPresentationController 有两个重要属性
    //    // presentingViewController->表示modal的执行控制器(后面的)
    //    // presentedViewController->被modal出来的控制器(前面)
    //    NSLog(@"presenting:%@----presented:%@",modalVC.presentationController.presentingViewController, modalVC.presentationController.presentedViewController);
}

- (void)actionSheetTest
{
    UIActionSheet *as = [[UIActionSheet alloc]initWithTitle:@"nihao" delegate:nil cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"确定", nil];
    [as showInView:self.view];
}

- (void)alertControllerTest
{
    // 在iPad里面,使用UIAlertController一定要使用UIModalPresentationPopover这种形式,否则会崩溃
    UIAlertController *ac = [UIAlertController alertControllerWithTitle:@"nihao" message:@"haha" preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        NSLog(@"取消");
    }];
    
    UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        NSLog(@"点击确定");
    }];
    
    [ac addAction:sureAction];
    [ac addAction:cancelAction];
    
    ac.modalPresentationStyle = UIModalPresentationPopover;
    // 从一个固定的位置冒出来
    ac.popoverPresentationController.sourceView = self.view;
    ac.popoverPresentationController.sourceRect = CGRectMake(10, 10, 100, 100);
    
    // 从barButtonItem冒出来
    ac.popoverPresentationController.barButtonItem = self.navigationItem.leftBarButtonItem;
    [self presentViewController:ac animated:YES completion:nil];
    NSLog(@"%@--%@",ac.presentationController,ac.popoverPresentationController);
    
}

@end

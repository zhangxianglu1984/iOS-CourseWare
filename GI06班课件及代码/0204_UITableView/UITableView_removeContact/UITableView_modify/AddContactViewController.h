//
//  AddContactViewController.h
//  UITableView_modify
//
//  Created by jianfeng on 15/2/3.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Contact.h"

@protocol AddContactViewControllerDelegate <NSObject>

- (void)dealWithWith:(Contact *)contact;

@end

@interface AddContactViewController : UIViewController

@property (nonatomic, assign) id<AddContactViewControllerDelegate> delegate;

@end

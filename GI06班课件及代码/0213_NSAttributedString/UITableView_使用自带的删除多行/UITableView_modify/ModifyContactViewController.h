//
//  ModifyContactViewController.h
//  UITableView_modify
//
//  Created by jianfeng on 15/2/4.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Contact.h"

@protocol ModifyContactViewControllerDelegate <NSObject>

- (void)didMoifyContact:(Contact *)con;

@end

@interface ModifyContactViewController : UIViewController

@property (nonatomic, strong) Contact *contactMod;
@property (nonatomic, assign) id<ModifyContactViewControllerDelegate> delegate;

@end

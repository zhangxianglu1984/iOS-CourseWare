//
//  ViewControllerA.m
//  passValueViaObj
//
//  Created by jianfeng on 15/1/30.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "ViewControllerA.h"
#import "ViewControllerB.h"
#import "Student.h"

@interface ViewControllerA ()
{
    NSString *nameStr;
    NSString *numStr;
    NSInteger score;
}

@end

@implementation ViewControllerA


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"页面一";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(pass:)];
    
    nameStr = @"小明";
    numStr = @"20140101";
    score = 80;
    
    
    Student *stu1 = [[Student alloc]init];
    stu1.name = nameStr;
    stu1.num = numStr;
    stu1.score = score;
}

- (void)pass:(UIBarButtonItem *)item {
    ViewControllerB *vcB = [[ViewControllerB alloc]init];
//    vcB.studentDic = @{@"name":nameStr,
//                       @"num":numStr,
//                       @"score":@(score)};
    
//    Student *stu1 = [[Student alloc]init];
//    stu1.name = nameStr;
//    stu1.num = numStr;
//    stu1.score = score;
//    vcB.sss = stu1;
    
    Student *stu2 = [[Student alloc]initWithName:@"小红" num:@"22929" andScore:90];
    vcB.sss = stu2;
    
    [self.navigationController pushViewController:vcB animated:YES];
}


@end

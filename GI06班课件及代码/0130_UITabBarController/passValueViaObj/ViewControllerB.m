//
//  ViewControllerB.m
//  passValueViaObj
//
//  Created by jianfeng on 15/1/30.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "ViewControllerB.h"

@interface ViewControllerB ()
{
    UILabel *nameLabel;
    UILabel *numLabel;
    UILabel *scoreLabel;
}

@end

@implementation ViewControllerB

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"页面二";
    
    [self initLabels];
}

- (void)initLabels
{
    nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(70, 100, 100, 30)];
    nameLabel.backgroundColor = [UIColor redColor];
//    nameLabel.text = self.studentDic[@"name"];
    nameLabel.text = self.sss.name;
    [self.view addSubview:nameLabel];
    
    numLabel = [[UILabel alloc]initWithFrame:CGRectMake(70, 140, 100, 30)];
    numLabel.backgroundColor = [UIColor redColor];
//    numLabel.text = self.studentDic[@"num"];
    numLabel.text = self.sss.num;
    [self.view addSubview:numLabel];
    
    scoreLabel = [[UILabel alloc]initWithFrame:CGRectMake(70, 180, 100, 30)];
    scoreLabel.backgroundColor = [UIColor redColor];
//    nameLabel.text = [@(self.studentDic[@"score"]) stringValue];
    scoreLabel.text = [@(self.sss.score) stringValue];
    [self.view addSubview:scoreLabel];
}

@end

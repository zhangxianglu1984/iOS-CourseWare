//
//  ViewController.m
//  passValue_SB
//
//  Created by jianfeng on 15/1/30.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "ViewController.h"
#import "Student.h"
#import "SecondViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.destinationViewController isKindOfClass:[SecondViewController class]]) {
        Student *stu = [Student studenWithName:@"xiaoming" num:@"123" andScore:50];
        ((SecondViewController *)segue.destinationViewController).student = stu;
    }
}


- (IBAction)connFinish:(id)sender {
    [self performSegueWithIdentifier:@"myConnSegue" sender:nil];
    
}



@end

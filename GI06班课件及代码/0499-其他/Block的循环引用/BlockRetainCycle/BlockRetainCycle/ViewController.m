//
//  ViewController.m
//  BlockRetainCycle
//
//  Created by 敖 然 on 15/4/28.
//  Copyright (c) 2015年 CoderAR. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
//    [self performSegueWithIdentifier:@"one2two" sender:indexPath];
    [self performSegueWithIdentifier:@"one2two" sender:nil];
}

//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    ViewController *vc = segue.destinationViewController;
//    vc.model = dataList[sender.row];
//}


@end

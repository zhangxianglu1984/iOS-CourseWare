//
//  ViewController.m
//  UIDatePicker
//
//  Created by jianfeng on 15/2/11.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    /**
     UIDatePickerModeTime,           // Displays hour, minute, and optionally AM/PM designation depending on the locale setting (e.g. 6 | 53 | PM)
     UIDatePickerModeDate,           // Displays month, day, and year depending on the locale setting (e.g. November | 15 | 2007)
     UIDatePickerModeDateAndTime,    // Displays date, hour, minute, and optionally AM/PM designation depending on the locale setting (e.g. Wed Nov 15 | 6 | 53 | PM)
     UIDatePickerModeCountDownTimer,
     */
    UIDatePicker *datePicker = [[UIDatePicker alloc]initWithFrame:CGRectMake(0, 20, self.view.bounds.size.width, 216)];
    
    datePicker.datePickerMode = UIDatePickerModeDateAndTime;
    datePicker.countDownDuration = 60 * 10;
    datePicker.minuteInterval = 4;
    [self.view addSubview:datePicker];
    
    // 时间字符串->时间类型(NSDate) 需要时间格式与字符串格式完全一致
    NSString *date1String = @"2015-01-20 12:00:00";// @"2015-01-20 12:00:00"
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSDate *date1 = [formatter dateFromString:date1String];
    
    [date1 dateByAddingTimeInterval:60 * 5];
    
    NSDateFormatter *formatter2 = [[NSDateFormatter alloc]init];
    formatter2.dateFormat = @"yyyy-MM-dd";
     NSString *date2String = [formatter2 stringFromDate:date1];
    
    NSLog(@"%@",date2String);
    
    
}


@end







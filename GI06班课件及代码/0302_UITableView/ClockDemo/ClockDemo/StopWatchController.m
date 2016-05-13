//
//  StopWatchController.m
//  ClockDemo
//
//  Created by 敖 然 on 15/3/2.
//  Copyright (c) 2015年 imcore. All rights reserved.
//

#import "StopWatchController.h"

@interface StopWatchController ()<UITableViewDelegate,UITableViewDataSource>
{
    int _timerCount;
    int _minute;
    int _second;
    int _100ms;
    int _minuteForLap;
    int _secondForLap;
    int _msForLap;
    int _lapCount;//点击lap的次数
}

@property(nonatomic, strong) UIButton * buttonStart;//开始按钮
@property(nonatomic, strong) UIButton * buttonReset;//重置和lap按钮
@property(nonatomic, strong) UITableView * tableView;//点击lap出现的表格
@property(nonatomic, strong) UILabel * labelForShow;//显示时间
@property(nonatomic, strong) UILabel * labelForLap;//每次点击lap重新置为0
@property(nonatomic, strong) NSTimer * myTimer;//计时器
@property(nonatomic, strong) NSMutableArray * dataList;

@end

@implementation StopWatchController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = @"秒表";
    
    [self initViews];
    [self initData];
}

- (void)initViews
{
    self.labelForShow.text = @"00:00.00";
    self.labelForLap.text = @"00:00.00";
    
    self.buttonStart.enabled = YES;
    self.buttonReset.enabled = NO;
    
    //创建表格
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,
                                                                  self.view.frame.size.height / 2,
                                                                  self.view.frame.size.width,
                                                                  self.view.frame.size.height / 2)
                                                 style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}

- (void)initData
{
    _100ms = 0;
    _minute = 0;
    _second = 0;
    _minuteForLap = 0;
    _secondForLap = 0;
    _msForLap = 0;
    _lapCount = 0;
    self.dataList = [NSMutableArray array];
}

//点击start/stop
-(void)clickStartButton:(UIButton*)sender
{
    //如果此时按钮显示start
    if ([sender.titleLabel.text isEqual: @"Start"] )
    {
        [self.buttonStart setTitle:@"Stop" forState:UIControlStateNormal];
        [self.buttonReset setTitle:@"Lap" forState:UIControlStateNormal];
        //只有reset按钮是灰色的时候,启动定时器
        if (self.buttonReset.enabled == NO)
        {
            self.myTimer = [NSTimer scheduledTimerWithTimeInterval:0.1
                                                            target:self
                                                          selector:@selector(handleTimer:)
                                                          userInfo:nil
                                                           repeats:YES];
            self.buttonReset.enabled = YES;
        }
        else
        {
            //其他时候点击stop都只是启动暂停的秒表
            [self.myTimer setFireDate:[NSDate distantPast]];
        }
    }
    else
    {
        //按钮显示stop的时候暂停秒表
        [self.myTimer setFireDate:[NSDate distantFuture]];
        [self.buttonStart setTitle:@"Start" forState:UIControlStateNormal];
        [self.buttonReset setTitle:@"Reset" forState:UIControlStateNormal];
        
    }
}

//点击reset/lap
-(void)clickLapButton:(UIButton*)sender
{
    //点击reset
    if ([sender.titleLabel.text isEqual: @"Reset"])
    {
        [self.myTimer invalidate];//停止计时器
        self.buttonReset.enabled = NO;//reset按钮变灰
        _100ms = 0;
        _minute = 0;
        _second = 0;
        _minuteForLap = 0;
        _secondForLap = 0;
        _msForLap = 0;
        _lapCount = 0;//点击lap的次数
        //两个显示按钮都初始化为0
        self.labelForShow.text = [self displayMinute:0 andSecond:0 andMs:0];
        self.labelForLap.text = [self displayMinute:0 andSecond:0 andMs:0];
        [self.dataList removeAllObjects];
        [self.tableView reloadData];
    }
    else
    {
        //点击Lap
        [self.dataList addObject:self.labelForLap.text];//把点击时候的text存入dataList
        _lapCount++;
        [self.tableView reloadData];//重绘
        self.labelForLap.text = [self displayMinute:0 andSecond:0 andMs:0];
        _minuteForLap = 0;
        _secondForLap = 0;
        _msForLap = 0;
    }
}

//定时器回调
-(void)handleTimer:(NSTimer*)aTimer
{
    //100毫秒++
    _100ms++;
    
    //100毫秒那里>9 秒+1
    if (_100ms > 99)
    {
        _second++;
        _100ms = 0;
    }
    //同理如果秒那里>59 分钟+1
    if (_second > 59)
    {
        _minute ++;
        _second = 0;
    }
    
    //labelForLap的毫秒++
    _msForLap ++;
    if (_msForLap > 99)
    {
        _secondForLap ++;
        _msForLap = 0;
    }
    if (_secondForLap > 59)
    {
        _minuteForLap ++;
        _secondForLap = 0;
    }
    
    //显示在label里面
    self.labelForShow.text = [self displayMinute:_minute andSecond:_second andMs:_100ms];
    self.labelForLap.text = [self displayMinute:_minuteForLap andSecond:_secondForLap andMs:_msForLap];
}


//显示秒表规格的字符串
-(NSString*)displayMinute:(int)minute andSecond:(int)second andMs:(int)ms
{
    NSString * minuteStr = [NSString stringWithFormat:@"%02d",minute];
    NSString * secondStr = [NSString stringWithFormat:@"%02d",second];
    NSString * msStr = [NSString stringWithFormat:@"%02d",ms];
    
    NSString *displayStr = [NSString stringWithFormat:@"%@:%@.%@", minuteStr, secondStr, msStr];
    return displayStr;
}

#pragma mark - UITableViewDelegate

// 单元格行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataList count];
}

// 绘制单元格
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier = @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }
    if (_lapCount > 0)
    {
        int showIndex = self.dataList.count - indexPath.row -1;
        cell.textLabel.text = [NSString stringWithFormat:@"lap%d",showIndex + 1];
        cell.detailTextLabel.textColor = [UIColor blackColor];
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%@",self.dataList[showIndex]];
    }
    return cell;
}

#pragma mark - getters

- (UILabel *)labelForShow
{
    //创建显示label
    if (!_labelForShow) {
        _labelForShow = [[UILabel alloc]initWithFrame:CGRectMake(0, 105, kScreenWidth, 80)];
        _labelForShow.textAlignment = NSTextAlignmentCenter;
        _labelForShow.font = [self.labelForShow.font fontWithSize: 76];
        _labelForShow.textColor = [UIColor blackColor];
        [self.view addSubview:_labelForShow];
    }
    return _labelForShow;
}

- (UILabel *)labelForLap
{
    if (!_labelForLap) {
        //创建显示label(小的)
        _labelForLap = [[UILabel alloc]initWithFrame:CGRectMake(kScreenWidth - 110, 80, 100, 30)];
        _labelForLap.textAlignment = NSTextAlignmentCenter;
        _labelForLap.font = [self.labelForLap.font fontWithSize: 25];
        _labelForLap.textColor = [UIColor grayColor];
        [self.view addSubview:_labelForLap];
    }
    return _labelForLap;
}

- (UIButton *)buttonReset
{
    if (!_buttonReset) {
        //创建重置/lap按钮
        self.buttonReset = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        self.buttonReset.frame = CGRectMake(0, 0, 70, 70);
        [self.buttonReset setTitle:@"Reset" forState:UIControlStateNormal];
        self.buttonReset.backgroundColor = [UIColor lightGrayColor];
        self.buttonReset.layer.cornerRadius = 35;
        self.buttonReset.center = CGPointMake(kScreenWidth/4 * 3, 230);
        [self.buttonReset addTarget:self
                             action:@selector(clickLapButton:)
                   forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:self.buttonReset];
    }
    return _buttonReset;
}

- (UIButton *)buttonStart
{
    if (!_buttonStart) {
        //创建开始按钮
        self.buttonStart = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        self.buttonStart.frame = CGRectMake(0, 0, 70, 70);
        [self.buttonStart setTitle:@"Start" forState:UIControlStateNormal];
        self.buttonStart.backgroundColor = [UIColor lightGrayColor];
        self.buttonStart.layer.cornerRadius = 35;
        self.buttonStart.center = CGPointMake(kScreenWidth/4, 230);
        [self.buttonStart addTarget:self
                             action:@selector(clickStartButton:)
                   forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:self.buttonStart];
    }
    return _buttonStart;
}



@end

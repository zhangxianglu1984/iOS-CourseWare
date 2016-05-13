//
//  ViewController.m
//  0128_Gesture
//
//  Created by jianfeng on 15/1/28.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIGestureRecognizerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imageView.userInteractionEnabled = YES;
//    // 默认情况下,view只接收一个手势
//    [self testPinch];
//    [self testRotate];
    
    [self testPan];
    
//    [self testTap];
}

#pragma mark - 点击手势

- (void)testTap
{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
    tap.numberOfTapsRequired = 2;
    [self.imageView addGestureRecognizer:tap];
    
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap1:)];
    tap1.numberOfTapsRequired = 1;
    [self.imageView addGestureRecognizer:tap1];
    
    // 当单击和双击同时加在view上的时候,双击可能导致先调用单击事件
    // 使用此方法表示当双击的时候,可以先不响应单击的点击事件,等双击事件识别失败后才响应
    [tap1 requireGestureRecognizerToFail:tap];
}

- (void)tap:(UITapGestureRecognizer *)ges
{
    NSLog(@"2222");
}

- (void)tap1:(UITapGestureRecognizer*)ges
{
    NSLog(@"1111");
}

#pragma mark - 长按手势

- (void)testLongPress
{
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longPress:)];
    longPress.minimumPressDuration = 2;
    longPress.allowableMovement = 50;
    [self.imageView addGestureRecognizer:longPress];
}

- (void)longPress:(UILongPressGestureRecognizer *)ges
{
    NSLog(@"长按");
}

#pragma mark - 捏合手势

- (void)testPinch
{
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(pinch:)];
    [self.imageView addGestureRecognizer:pinch];
}

- (void)pinch:(UIPinchGestureRecognizer*)ges
{
    NSLog(@"%f",ges.scale);
    self.imageView.transform = CGAffineTransformScale(self.imageView.transform, ges.scale, ges.scale);
    ges.scale = 1;
}

#pragma mark - 旋转手势

- (void)testRotate
{
    UIRotationGestureRecognizer *rotateGes = [[UIRotationGestureRecognizer alloc]initWithTarget:self action:@selector(rotate:)];
    rotateGes.delegate = self;
    [self.imageView addGestureRecognizer:rotateGes];
}

- (void)rotate:(UIRotationGestureRecognizer *)ges
{
    NSLog(@"%f",ges.rotation);
    self.imageView.transform = CGAffineTransformRotate(self.imageView.transform, ges.rotation);
    ges.rotation = 0;
}

#pragma mark - 滑动手势

- (void)textSwipe
{
    UISwipeGestureRecognizer *swipeGes = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipe:)];
    swipeGes.delegate = self;
    swipeGes.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.imageView addGestureRecognizer:swipeGes];
}

- (void)swipe:(UISwipeGestureRecognizer *)ges
{
    NSLog(@"aaa");
}

#pragma mark - 拖拽手势

- (void)testPan
{
    UIPanGestureRecognizer *panGes = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(pan:)];
    panGes.delegate  = self;
    [self.imageView addGestureRecognizer:panGes];
}

- (void)pan:(UIPanGestureRecognizer*)ges
{
    CGPoint trans = [ges translationInView:self.imageView];
    self.imageView.center = CGPointMake(self.imageView.center.x + trans.x,
                                        self.imageView.center.y + trans.y);
    [ges setTranslation:CGPointZero inView:self.imageView];
    
}

#pragma mark - UIGestureRecognizerDelegate

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    [touch locationInView:self.view];
    return NO;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}




@end

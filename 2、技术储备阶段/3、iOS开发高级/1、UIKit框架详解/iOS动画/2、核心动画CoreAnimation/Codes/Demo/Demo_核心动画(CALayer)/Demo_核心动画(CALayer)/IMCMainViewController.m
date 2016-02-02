//
//  IMCMainViewController.m
//  Demo_核心动画(CALayer)
//
//  Created by zhang xianglu on 15/6/23.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import "IMCMainViewController.h"

@interface IMCMainViewController ()

@property (weak, nonatomic) IBOutlet UIView *greenView;

@property(nonatomic,weak) CALayer *redLayer;

@end

@implementation IMCMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	
	//position,anchorPoint
	
			
	//获取一个视图的跟图层
	//CALayer *greenViewLayer = _greenView.layer;
	
	//创建一个新的图层
	CALayer *redLayer = [CALayer layer];
	redLayer.backgroundColor = [UIColor redColor].CGColor;
	
//	redLayer.frame = CGRectMake(0, 0, 100, 100);
	
	redLayer.bounds = (CGRect){0, 0, 100, 100};
	
	redLayer.anchorPoint = (CGPoint){0.0,0.0};
	
	redLayer.position = (CGPoint){0,0};
	
	[self.view.layer addSublayer:redLayer];
    
    self.redLayer = redLayer;
	
	//_greenView.layer.delegate = self;
	
	//重新绘制图层
	//[_greenView.layer setNeedsDisplay];
	
	
	//UI -> CG .cgXXX UIImage .cgImage
	//_greenViewLayer.backgroundColor = [UIColor blueColor].CGColor;
	
//	greenViewLayer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"icon_fox"].CGImage);
//	
//	//加一个边框
//	greenViewLayer.borderColor = [UIColor grayColor].CGColor;
//	greenViewLayer.borderWidth = 8;
	
	//加圆角
	//greenViewLayer.cornerRadius = 50.0;
	//让子图层与父图层同步
	//greenViewLayer.masksToBounds = YES;
	
	//阴影
//	greenViewLayer.shadowColor = [UIColor redColor].CGColor;
//	greenViewLayer.shadowOffset = CGSizeMake(10, -10);
//	greenViewLayer.shadowOpacity = 0.5;
	
	//greenViewLayer.position = CGPointMake(250, 500);
	
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    //_redLayer.backgroundColor = [UIColor blueColor].CGColor;
    
//    _redLayer.position = CGPointMake(120, 368);
//    
//    _redLayer.bounds = CGRectMake(0.0, 0.0, 300, 300);
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
	
}

//- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx {
//	CGContextAddEllipseInRect(ctx, layer.bounds);
//	CGContextFillPath(ctx);
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

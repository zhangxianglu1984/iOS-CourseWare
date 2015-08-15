//
//  ViewController.m
//  Demo_应用国际化(NSLocalization)
//
//  Created by zhang xianglu on 15/7/23.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *htmlLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	NSString *htmlString = @"Hello<br/> World";
	
	NSAttributedString *attrStr = [[NSAttributedString alloc] initWithData:[htmlString dataUsingEncoding:NSUTF8StringEncoding] options:@{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType} documentAttributes:nil error:nil];
	
	_htmlLabel.attributedText = attrStr;
}



@end

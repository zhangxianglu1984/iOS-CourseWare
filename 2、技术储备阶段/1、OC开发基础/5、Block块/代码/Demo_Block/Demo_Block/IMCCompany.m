//
//  IMCCompany.m
//  Demo_Block
//
//  Created by zhang xianglu on 15/6/1.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import "IMCCompany.h"

@interface IMCCompany () {
	NSInteger _year;
}

@property(nonatomic,strong) NSString *name;

@property(nonatomic,assign) NSInteger money;

@end

@implementation IMCCompany

- (void)stock {
	//[self.delegate stock:self];
	if(self.stockBlock == nil){
		//typeof(self) == IMCCompany *
		//__weak typeof(self) thisInstance = self;
		
		__unsafe_unretained typeof(self) thisInstance = self;
		
		self.stockBlock = ^{
			thisInstance.name = @"果核科技";
			
			thisInstance->_year = 100;
		};
	} 
}

@end

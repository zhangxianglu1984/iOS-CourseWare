//
//  IMCPolice.m
//  Demo_对象归档
//
//  Created by zhang xianglu on 15/7/3.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import "IMCPolice.h"

@interface IMCPolice () 

@end

@implementation IMCPolice
- (id)initWithCoder:(NSCoder *)decoder {
	if (self = [super initWithCoder:decoder]) {
		self.brand = [decoder decodeObjectForKey:@"brand"];
	}	
	return self;
}



- (void)encodeWithCoder:(NSCoder *)encoder {
	[super encodeWithCoder:encoder];
	[encoder encodeObject:_brand forKey:@"brand"];
}





@end

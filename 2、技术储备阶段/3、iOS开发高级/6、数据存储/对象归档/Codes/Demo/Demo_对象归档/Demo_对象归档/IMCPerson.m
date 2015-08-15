//
//  IMCPerson.m
//  Demo_对象归档
//
//  Created by zhang xianglu on 15/7/2.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import "IMCPerson.h"
#import "IMCPolice.h"

@interface IMCPerson ()


@end

@implementation IMCPerson 

- (id)initWithCoder:(NSCoder *)decoder {
	if (self = [super init]) {
		//说明该类型的对象归档后，如何读取
		self.name = [decoder decodeObjectForKey:@"name"];
		self.age = [decoder decodeIntegerForKey:@"age"];
	}
	return self;
}

/**
 *  说明该类型的对象(成员变量)如何被归档
 */
- (void)encodeWithCoder:(NSCoder *)encoder {
	[encoder encodeObject:_name forKey:@"name"];
	[encoder encodeInteger:_age forKey:@"age"];	
}

- (NSString *)description {
	return [NSString stringWithFormat:@"name: %@ && age: %lu",_name,_age];
}










@end

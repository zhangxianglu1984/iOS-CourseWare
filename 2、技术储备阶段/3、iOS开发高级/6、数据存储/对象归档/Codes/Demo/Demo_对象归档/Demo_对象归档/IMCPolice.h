//
//  IMCPolice.h
//  Demo_对象归档
//
//  Created by zhang xianglu on 15/7/3.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import "IMCPerson.h"

@interface IMCPolice : IMCPerson <NSCoding>

@property(nonatomic,copy) NSString *brand;

@end

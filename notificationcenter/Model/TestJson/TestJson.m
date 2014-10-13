//
//  TestJson.m
//  notificationcenter
//
//  Created by Rita on 14-10-10.
//  Copyright (c) 2014年 Rita. All rights reserved.
//

#import "TestJson.h"

@implementation TestJson
@synthesize status,result;

+(Class)testJson_class{
    return [TestJson_class class];
}

@end


@implementation TestJson_class

@synthesize name,type;

@end

@implementation TestJsonCategory
@synthesize name,id,order;
@end


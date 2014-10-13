//
//  TestJson.h
//  notificationcenter
//
//  Created by Rita on 14-10-10.
//  Copyright (c) 2014年 Rita. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Jastor.h"

//"id": 12,
//"name": "不限",
//"order": 0

@interface TestJson : Jastor

@property (nonatomic,copy)NSNumber *status;
@property (nonatomic,copy)NSArray *result;


@end


@interface TestJson_class : Jastor
@property (strong,nonatomic) NSString* name;
@property (nonatomic) int type;
@end


@interface TestJsonCategory : Jastor
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSNumber *id;
@property (nonatomic, copy) NSNumber *order;
@end
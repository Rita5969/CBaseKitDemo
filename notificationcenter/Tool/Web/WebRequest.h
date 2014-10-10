//
//  WebRequest.h
//  FastRent
//
//  Created by heng chengfei on 14-4-12.
//  Copyright (c) 2014年 cf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ComboxVo.h"
#import "ComboxDatas.h"
#import "ComboxData.h"

@interface WebRequest : NSObject

+(WebRequest *)sharedObj;

+(NSDictionary *)request:(NSString *)url;

+(ComboxVo *)getComboxVo:(NSString *)url;

@end

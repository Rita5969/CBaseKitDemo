//
//  myMacros.h
//  notificationcenter
//
//  Created by Rita on 14-8-14.
//  Copyright (c) 2014年 Rita. All rights reserved.
//

#import <Foundation/Foundation.h>
//＝＝＝＝＝＝常用变量＝＝＝＝＝＝//
#define IOS7_OR_LATER   ( [[[UIDevice currentDevice] systemVersion] compare:@"7.0"] != NSOrderedAscending )
#define kDeviceWidth [UIScreen mainScreen].bounds.size.width
#define KDeviceHeight [UIScreen mainScreen].bounds.size.height
#define ServiceName @"com.mycompany.yourAppServiceName"
#define DEVICE_IS_IPHONE5 ([[UIScreen mainScreen] bounds].size.height == 568)
#define APPDELEGETE (AppDelegate *)[[UIApplication sharedApplication]delegate]
#define HEADER_HEIGHT 35


@interface myMacros : NSObject

@end

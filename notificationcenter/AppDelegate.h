//
//  AppDelegate.h
//  notificationcenter
//
//  Created by Rita on 14-8-14.
//  Copyright (c) 2014年 Rita. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "MainListViewController.h"
//#import "XMLViewController.h"
#import "MainViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

//按表示符进入界面
-(void)goController:(NSInteger)indexNum;

@property (strong, nonatomic) UIWindow *window;
//主要页面
@property (strong, nonatomic) MainViewController *mainViewController;
@property (strong, nonatomic) UINavigationController *mainNavController;
////主要页面
//@property (strong, nonatomic) MainListViewController *mainListViewController;
//@property (strong, nonatomic) UINavigationController *mainListNavController;
////xml解析页面
//@property (strong, nonatomic) XMLViewController *xmlViewController;
//@property (strong, nonatomic) UINavigationController *XMLNavController;


@end

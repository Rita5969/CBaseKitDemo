//
//  KeyTableViewController.h
//  notificationcenter
//
//  Created by Rita on 14-9-22.
//  Copyright (c) 2014年 Rita. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KeyTableViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (strong,nonatomic) UITableView *tableMain;
@property (strong,nonatomic) NSMutableArray *suoyinCityList;

@end

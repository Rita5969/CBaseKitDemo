//
//  MainListViewController.h
//  notificationcenter
//
//  Created by Rita on 14-8-14.
//  Copyright (c) 2014年 Rita. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QQSectionHeaderView.h"

@interface MainListViewController : UIViewController<QQSectionHeaderViewDelegate,UITableViewDataSource,UITableViewDelegate>{
    UITableView *tableMain;

    NSMutableArray *lists;
}
@property(strong,nonatomic) UITableView *tableMain;

-(void)loadQQData;

@end

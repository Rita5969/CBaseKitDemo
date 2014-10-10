//
//  MJRefreshViewController.h
//  notificationcenter
//
//  Created by Rita on 14-9-12.
//  Copyright (c) 2014年 Rita. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MJRefreshViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>{
    UITableView *tableMain;

}
- (void)headerRereshing;
- (void)footerRereshing;

@end

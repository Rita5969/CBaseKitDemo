//
//  MJRefreshViewController.m
//  notificationcenter
//
//  Created by Rita on 14-9-12.
//  Copyright (c) 2014年 Rita. All rights reserved.
//

#import "MJRefreshViewController.h"
#import "MJRefresh.h"

NSString *const MJTableViewCellIdentifier = @"Cell";

//随机数据
#define MJRandomData [NSString stringWithFormat:@"测试-%d",arc4random_uniform(1000000)]

@interface MJRefreshViewController ()
//存放假数据的数组
@property (strong , nonatomic) NSMutableArray *fakeData;
@end

@implementation MJRefreshViewController
//初始化
-(NSMutableArray *)fakeData{
    if (!_fakeData) {
        self.fakeData = [NSMutableArray array];
        for (int i = 0; i<12; i++) {
            [self.fakeData addObject:MJRandomData];
        }
    }
    return _fakeData;

}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //iOS7的屏幕适配
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 70000
    if ( IOS7_OR_LATER )
    {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.extendedLayoutIncludesOpaqueBars = NO;
        self.modalPresentationCapturesStatusBarAppearance = NO;
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
#endif// #if __IPHONE_OS_VERSION_MAX_ALLOWED >= 70000
    
    
    //背景颜色
    self.view.backgroundColor = [UIColor whiteColor];
    
    //标题栏背景颜色
    if (IOS7_OR_LATER) {
        self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:246.0f/255.0f green:246.0f/255.0f blue:246.0f/255.0f alpha:1];
        self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    }
    else{
        self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:246.0f/255.0f green:246.0f/255.0f blue:246.0f/255.0f alpha:1];
    }
    
    //标题栏字
    [[self navigationItem] setTitle:@"NotificationCenter"];
    //标题栏字体颜色
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRed:42.0f/255.0f green:192.0f/255.0f blue:161.0f/255.0f alpha:1],UITextAttributeTextColor,[UIColor grayColor],UITextAttributeTextShadowColor, nil]];
    
    //主要列表
    tableMain = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, self.view.bounds.size.height)];
    tableMain.autoresizingMask = UIViewAutoresizingFlexibleHeight |UIViewAutoresizingFlexibleWidth;
    tableMain.backgroundColor = [UIColor whiteColor];
    tableMain.delegate = self;
    tableMain.dataSource = self;
    [tableMain registerClass:[UITableViewCell class] forCellReuseIdentifier:MJTableViewCellIdentifier];
    [self.view addSubview:tableMain];
    //开启刷新控件
    [self setupRefresh];
	
}

//集成刷新控件
-(void)setupRefresh{
    //1、下拉刷新
    [tableMain addHeaderWithTarget:self action:@selector(headerRereshing)];
    //一进入程序就自动下拉刷新
    [tableMain headerBeginRefreshing];
    
    //2、上拉加载
    [tableMain addFooterWithTarget:self action:@selector(footerRereshing)];
    
    //设置文字
    tableMain.headerPullToRefreshText = @"下拉可以刷新了";
    tableMain.headerReleaseToRefreshText = @"松开马上刷新";
    tableMain.headerRefreshingText = @"正在刷新，请稍候";
    
    tableMain.footerPullToRefreshText = @"上拉可以加载更多数据了";
    tableMain.footerReleaseToRefreshText = @"松开马上加载更多数据";
    tableMain.footerRefreshingText = @"正在加载，请稍候";
}

//刷新状态
- (void)headerRereshing
{
    // 1.添加假数据
    for (int i = 0; i<5; i++) {
        [self.fakeData insertObject:MJRandomData atIndex:0];
    }
    
    // 2.2秒后刷新表格UI
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 刷新表格
        [tableMain reloadData];
        
        // (最好在刷新表格后调用)调用endRefreshing可以结束刷新状态
        [tableMain headerEndRefreshing];
    });
}

- (void)footerRereshing
{
    // 1.添加假数据
    for (int i = 0; i<5; i++) {
        [self.fakeData addObject:MJRandomData];
    }
    
    // 2.2秒后刷新表格UI
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 刷新表格
        [tableMain reloadData];
        
        // (最好在刷新表格后调用)调用endRefreshing可以结束刷新状态
        [tableMain footerEndRefreshing];
    });
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.fakeData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MJTableViewCellIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = self.fakeData[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    MJTestViewController *test = [[MJTestViewController alloc] init];
//    [self.navigationController pushViewController:test animated:YES];
}

@end

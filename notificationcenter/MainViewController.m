//
//  MainViewController.m
//  notificationcenter
//
//  Created by Rita on 14-9-9.
//  Copyright (c) 2014年 Rita. All rights reserved.
//

#import "MainViewController.h"
#import "MainListViewController.h"
#import "XMLViewController.h"
#import "MJRefreshViewController.h"
#import "ShareViewController.h"
#import "VideoViewController.h"
#import "KeyTableViewController.h"
#import "ComboxViewController.h"
#import "ToastViewController.h"
#import "SQLViewController.h"


static NSString *kTitleKey = @"title";
static NSString *kExplainKey = @"explanation";
static NSString *kViewControllerKey = @"viewController";


@interface MainViewController ()
@property (nonatomic,strong) NSMutableArray *menuList;
@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.menuList = [NSMutableArray array];
    
    [self loadData];
    
    //主要列表
    tableViewMain = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, self.view.bounds.size.height)];
    tableViewMain.autoresizingMask = UIViewAutoresizingFlexibleHeight |UIViewAutoresizingFlexibleWidth;
    tableViewMain.backgroundColor = [UIColor whiteColor];
    tableViewMain.delegate = self;
    tableViewMain.dataSource = self;
    [self.view addSubview:tableViewMain];
    
}

-(void)loadData{
    //－－－－－－开合菜单效果
    MainListViewController *mainListViewController = [[MainListViewController alloc]init];
    [self.menuList addObject:@{
 
                               kTitleKey:NSLocalizedString(@"QQList", @""),
                               kExplainKey:NSLocalizedString(@"开合菜单效果", @""),
                               kViewControllerKey:mainListViewController}];
    
    //－－－－－－XML解析
    XMLViewController *xmlViewController = [[XMLViewController alloc]init];
    [self.menuList addObject:@{
                               
                               kTitleKey:NSLocalizedString(@"XMLTranslation", @""),
                               kExplainKey:NSLocalizedString(@"XML解析示例", @""),
                               kViewControllerKey:xmlViewController}];
    //－－－－－－上拉下拉刷新
    MJRefreshViewController *refreshViewController = [[MJRefreshViewController alloc]init];
    [self.menuList addObject:@{
                               kTitleKey:NSLocalizedString(@"MJRefresh", @""),
                               kExplainKey:NSLocalizedString(@"MJRefresh下拉刷新", @""),
                               kViewControllerKey:refreshViewController}];
    //－－－－－－－微信分享
    ShareViewController *shareViewController = [[ShareViewController alloc]init];
    [self.menuList addObject:@{
                               kTitleKey:NSLocalizedString(@"ShareWeChat", @""),
                               kExplainKey:NSLocalizedString(@"微信分享", @""),
                               kViewControllerKey:shareViewController}];
    //－－－－－－－视频播放器
    VideoViewController *videoViewController = [[VideoViewController alloc]init];
    [self.menuList addObject:@{
                               kTitleKey:NSLocalizedString(@"ALMoviePlayer", @""),
                               kExplainKey:NSLocalizedString(@"视频播放器", @""),
                               kViewControllerKey:videoViewController}];
    //－－－－－－－关键字索引
//    https://github.com/hackiftekhar/IQKeyboardManager
    KeyTableViewController *keyTableView = [[KeyTableViewController alloc]init];
    [self.menuList addObject:@{
                               kTitleKey:NSLocalizedString(@"KeyTable", @""),
                               kExplainKey:NSLocalizedString(@"关键字索引列表", @""),
                               kViewControllerKey:keyTableView}];
    //－－－－－－－各种拖拉框
    ComboxViewController   *comboxView = [[ComboxViewController alloc]init];
    [self.menuList addObject:@{
                               kTitleKey:NSLocalizedString(@"comboxView", @""),
                               kExplainKey:NSLocalizedString(@"拖拉框", @""),
                               kViewControllerKey:comboxView}];
    
    //－－－－－－－各种toast
    ToastViewController   *toastView = [[ToastViewController alloc]init];
    [self.menuList addObject:@{
                               kTitleKey:NSLocalizedString(@"toastView", @""),
                               kExplainKey:NSLocalizedString(@"提示框闪屏", @""),
                               kViewControllerKey:toastView}];
    
    //－－－－－－－SQL数据库的调用
    SQLViewController   *SQLView = [[SQLViewController alloc]init];
    [self.menuList addObject:@{
                               kTitleKey:NSLocalizedString(@"SQLView", @""),
                               kExplainKey:NSLocalizedString(@"SQL数据库增删改查", @""),
                               kViewControllerKey:SQLView}];


}

#pragma mark - UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIViewController *targetViewController = [[self.menuList objectAtIndex:indexPath.row]objectForKey:kViewControllerKey];
    [[self navigationController]pushViewController:targetViewController animated:YES];

}

#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.menuList count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = [[self.menuList objectAtIndex:indexPath.row]objectForKey:kTitleKey];
    cell.detailTextLabel.text = [[self.menuList objectAtIndex:indexPath.row]objectForKey:kExplainKey];
    
    return cell;
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

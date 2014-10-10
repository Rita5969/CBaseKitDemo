//
//  AppDelegate.m
//  notificationcenter
//
//  Created by Rita on 14-8-14.
//  Copyright (c) 2014年 Rita. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate
//@synthesize mainListNavController,mainListViewController;
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor clearColor];
    
    [self goController:2];
    [self.window makeKeyAndVisible];
    
    //向微信注册
    [WXApi registerApp:@"wx11bb3488deb195b8"];
    
    return YES;
}

//重写系统方法
-(BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url{
    return [WXApi handleOpenURL:url delegate:self];
}
-(BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation{
    return [WXApi handleOpenURL:url delegate:self];
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


-(void)goController:(NSInteger)indexNum{
    if (indexNum == 0) {
//        mainListViewController = [[MainListViewController alloc]init];
//        mainListNavController = [[UINavigationController alloc]initWithRootViewController:mainListViewController];
//        self.window.rootViewController = mainListNavController;
    }
    else if(indexNum == 1){
//        _xmlViewController = [[XMLViewController alloc]init];
//        _XMLNavController = [[UINavigationController alloc]initWithRootViewController:_xmlViewController];
//        self.window.rootViewController = _XMLNavController;
    }
    else if(indexNum == 2){
        _mainViewController = [[MainViewController alloc]init];
        _mainNavController = [[UINavigationController alloc]initWithRootViewController:_mainViewController];
        self.window.rootViewController = _mainNavController;
    }
}


@end

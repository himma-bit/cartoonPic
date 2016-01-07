//
//  AppDelegate.m
//  cartoonPic
//
//  Created by yzx on 16/1/7.
//  Copyright © 2016年 鸡冻. All rights reserved.
//

#define KSIZE ([UIScreen mainScreen].bounds.size)

#import "AppDelegate.h"
#import "StrollViewController.h"
#import "DestinationViewController.h"
#import "LoginViewController.h"
#import "MeViewController.h"
#import "OfflineViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    [[UINavigationBar appearance] setBarStyle:UIBarStyleBlack];
    
    
    StrollViewController * stroll =[[StrollViewController alloc]init];
    
    DestinationViewController* dest=[[DestinationViewController alloc]init];
    
    LoginViewController* login=[[LoginViewController alloc]init];
    
    MeViewController* me=[[MeViewController alloc]init];
    
    OfflineViewController* off=[[OfflineViewController alloc]init];
    
    _tab=[[UITabBarController alloc]init];
    _tab.viewControllers=@[[[UINavigationController alloc]initWithRootViewController:stroll], [[UINavigationController alloc]initWithRootViewController:dest], [[UINavigationController alloc]initWithRootViewController:login], [[UINavigationController alloc]initWithRootViewController:me], [[UINavigationController alloc]initWithRootViewController:off]];
    
    for (int i = 0; i < 5; i++) {
        UINavigationController * naVC = _tab.viewControllers[i];
        naVC.navigationBar.translucent = YES;
        [naVC.navigationBar setBackgroundImage:[UIImage imageNamed:@"actionbar_bg.png"] forBarMetrics:UIBarMetricsDefault];
    }
    self.window.rootViewController=_tab;
    _tab.tabBar.hidden=YES;
    
    UIView* view=[_tab.view.subviews objectAtIndex:0];
    view.frame=[UIScreen mainScreen].bounds;
    [self createMyTabbar];//自定义tabBar
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)createMyTabbar{
    UIView* tabbarbg=[[UIView alloc]initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height-40, KSIZE.width, 40)];
    tabbarbg.tag = 110;
    
    NSArray * arrayImg = @[@"tabbar_explore.png", @"tabbar_dest.png", @"tabbar_trip_create.png", @"tabbar_me.png", @"tabbar_offline.png"];
    NSArray * arraySelectImg = @[@"tabbar_explore_hl@2x.png", @"tabbar_dest_hl@2x.png", @"tabbar_trip_create_hl@2x.png", @"tabbar_me_hl@2x.png", @"tabbar_offline_hl@2x.png"];
    
    for (int i = 0; i < 5; i++) {
        UIButton* tabBarBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        tabBarBtn.frame=CGRectMake(KSIZE.width / 5.0 * i, 0, KSIZE.width / 5.0, 40);
        tabBarBtn.tag = i + 1;
        [tabBarBtn setImage:[UIImage imageNamed:arrayImg[i]] forState:UIControlStateNormal];
        [tabBarBtn setImage:[UIImage imageNamed:arraySelectImg[i]] forState:UIControlStateHighlighted];
        [tabBarBtn setImage:[UIImage imageNamed:arraySelectImg[i]] forState:UIControlStateSelected];
        if (i == 0) {
            tabBarBtn.selected = YES;
        }
        [tabBarBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
        [tabbarbg addSubview:tabBarBtn];
        
    }
    
    tabbarbg.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"actionbar_bg.png"]];
    [_tab.view addSubview:tabbarbg];
    
}
- (void)btnClick:(UIButton*)btn{
    UIView *tabbarbg = [_tab.view viewWithTag:110];
    
    for (UIView *view in tabbarbg.subviews) {
        if ([view isKindOfClass:[UIButton class]]) {
            ((UIButton *)view).selected = NO;
        }
    }
    btn.selected = YES;
    [_tab setSelectedIndex:btn.tag-1];
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
//
//  AppDelegate.m
//  Hypnosister
//
//  Created by Jaimie Zhu on 6/18/15.
//  Copyright (c) 2015 Jaimie Zhu. All rights reserved.
//

#import "AppDelegate.h"
#import "HypnosisView.h"
#import "MiniMapView.h"
#import "HypnosisViewController.h"
#import "ReminderViewController.h"
#import "QuizViewController.h"

@interface AppDelegate ()
@property (nonatomic) MiniMapView *miniMap;
@property (nonatomic) HypnosisView *hypnosisView;
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    // register to be allowed to present alert notifications
    UIUserNotificationSettings *settings =
    [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert
                                      categories:nil];
    [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
    
    // create reminder and hypnosis view controllers
    ReminderViewController *rvc = [[ReminderViewController alloc] init];
    HypnosisViewController *hvc = [[HypnosisViewController alloc] init];
    QuizViewController *qvc = [[QuizViewController alloc] init];
    
    // create and configure a tab bar controller
    UITabBarController *tvc = [[UITabBarController alloc] init];
    
    // add other controllers to tvc
    tvc.viewControllers = @[hvc, rvc, qvc];
    
    // make the rootViewController the tvc
    self.window.rootViewController = tvc;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self.miniMap updateWithScrollView:scrollView];
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.hypnosisView;
}

/* BEGIN STUFF THAT WAS WRITTEN FOR ME */

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

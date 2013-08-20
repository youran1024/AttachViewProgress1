//
//  AppDelegate.m
//  MyViewController
//
//  Created by Mr.Yang on 13-7-28.
//  Copyright (c) 2013年 Hunter. All rights reserved.
//

#import "AppDelegate.h"
#import "HTAttachView.h"

@implementation AppDelegate

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    self.window.backgroundColor = [UIColor blackColor];
    NSMutableArray *array = [NSMutableArray array];
    HTProgressView *pro = [[HTProgressView alloc] initWithFrame:CGRectMake(10,10 + 44, 300, 50)];
    [array addObject:pro];
    pro.strokeColor = [UIColor orangeColor];
    pro.fillColor = [UIColor whiteColor];
    pro.strokeWidth = 4.0f;
    
    pro.backgroundColor = [UIColor whiteColor];
    self.window.backgroundColor = [UIColor redColor];
    [self.window addSubview:pro];
    [pro release];
    
    HTProgressArcView *arcView = [[HTProgressArcView alloc] initWithFrame:CGRectMake(10, 100, 50, 50)];
    [self.window addSubview:arcView];
    [arcView release];
    [array addObject:arcView];
    
    HTProgressArcFillView *arcFillView = [[HTProgressArcFillView alloc] initWithFrame:CGRectMake(10, 170, 50, 50)];
    arcFillView.fillColor = [UIColor orangeColor];
    [self.window addSubview:arcFillView];
    [arcFillView release];
    [array addObject:arcFillView];
    
    [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(setProgressValue:) userInfo:array repeats:YES];
    
    return YES;
}

- (void)setProgressValue:(NSTimer *)timer
{
    NSArray *array = timer.userInfo;
    for (HTProgressView *pr in array) {
        pr.progressValue +=  0.1;
        if (pr.progressValue >= 1.2f) {
            pr.progressValue = 0.0f;
        }
    }
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

@end

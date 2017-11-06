//
//  AppDelegate.m
//  W2D1
//
//  Created by Jason Liang on 11/6/17.
//  Copyright © 2017 Jason Liang. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  // Override point for customization after application launch.
  return YES;
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
  NSLog(@"applicationWillEnterForeground");
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
  NSLog(@"applicationDidBecomeActive");
}

- (void)applicationWillResignActive:(UIApplication *)application {
  NSLog(@"applicationWillResignActive");
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
  NSLog(@"applicationDidEnterBackground");
}

- (void)applicationWillTerminate:(UIApplication *)application {
  NSLog(@"applicationWillTerminate");
}


@end

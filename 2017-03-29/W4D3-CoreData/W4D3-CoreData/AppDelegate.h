//
//  AppDelegate.h
//  W4D3-CoreData
//
//  Created by Jason Liang on 3/29/17.
//  Copyright © 2017 jasonliang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end


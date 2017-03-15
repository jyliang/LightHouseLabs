//
//  ModelController.h
//  W2D3-PagingViewController
//
//  Created by Jason Liang on 3/15/17.
//  Copyright © 2017 Jason Liang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DataViewController;

@interface ModelController : NSObject <UIPageViewControllerDataSource>

- (DataViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard;
- (NSUInteger)indexOfViewController:(DataViewController *)viewController;

@end


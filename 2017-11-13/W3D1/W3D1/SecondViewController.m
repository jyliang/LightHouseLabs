//
//  SecondViewController.m
//  W3D1
//
//  Created by Jason Liang on 11/13/17.
//  Copyright © 2017 Jason Liang. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  // create scrollview
  
  UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
  [self.view addSubview:scrollView];
  
  // create 2 subviews of the scrollview, size of the each view is bound of the scroll
  
  // 1 first subview has origin of (0,0)
  // background is red
  
  UIView *firstView = [[UIView alloc] initWithFrame:scrollView.bounds];
  firstView.backgroundColor = [UIColor redColor];
  [scrollView addSubview:firstView];
  
  // 2 second subivew has origin of (width of the scrollview.bounds, 0)
  // background is green
  CGRect secondViewFrame = scrollView.bounds;
  secondViewFrame.origin.x = scrollView.bounds.size.width;
  
  UIView *secondView = [[UIView alloc] initWithFrame:secondViewFrame];
  secondView.backgroundColor = [UIColor greenColor];
  [scrollView addSubview:secondView];
  
  // scrollview.contentsize
  scrollView.contentSize = CGSizeMake(scrollView.bounds.size.width * 2, scrollView.bounds.size.height);
  
  // paging enabled
  
  scrollView.pagingEnabled = YES;
  
  
}


@end

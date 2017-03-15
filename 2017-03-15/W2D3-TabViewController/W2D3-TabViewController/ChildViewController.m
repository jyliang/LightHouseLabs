//
//  ChildViewController.m
//  W2D3-TabViewController
//
//  Created by Jason Liang on 3/15/17.
//  Copyright © 2017 Jason Liang. All rights reserved.
//

#import "ChildViewController.h"

@interface ChildViewController ()

@end

@implementation ChildViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor greenColor];
  NSLog(@"ViewDidLoad");
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  NSLog(@"1 - viewWillAppear");
  
}
- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  NSLog(@"2 - viewDidAppear");
  // 20%
}
- (void)viewWillDisappear:(BOOL)animated {
  [super viewWillDisappear:animated];
  NSLog(@"3 - viewWillDisappear");
}
- (void)viewDidDisappear:(BOOL)animated {
  [super viewDidDisappear:animated];
  NSLog(@"4 - viewDidDisappear");
}

@end

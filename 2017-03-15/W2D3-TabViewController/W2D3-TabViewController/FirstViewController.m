//
//  FirstViewController.m
//  W2D3-TabViewController
//
//  Created by Jason Liang on 3/15/17.
//  Copyright © 2017 Jason Liang. All rights reserved.
//

#import "FirstViewController.h"
#import "ChildViewController.h"
@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  NSLog(@"ViewDidLoad");
  
  // 75%
  [self embedChildViewController];
}


- (void)embedChildViewController {
  ChildViewController *childViewController = [[ChildViewController alloc] init];
  // add the childViewController view
  [self addChildViewController:childViewController];
  childViewController.view.frame = CGRectMake(100, 100, 100, 100);
  [self.view addSubview:childViewController.view];
  
}

- (void)removeChildViewController:(ChildViewController *)childVC {
  [childVC.view removeFromSuperview];
  [childVC removeFromParentViewController];
}


- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}


//- (void)viewWillAppear:(BOOL)animated {
//  [super viewWillAppear:animated];
//  NSLog(@"1 - viewWillAppear");
//  
//}
//- (void)viewDidAppear:(BOOL)animated {
//  [super viewDidAppear:animated];
//  NSLog(@"2 - viewDidAppear");
//  // 20%
//}
//- (void)viewWillDisappear:(BOOL)animated {
//  [super viewWillDisappear:animated];
//  NSLog(@"3 - viewWillDisappear");
//}
//- (void)viewDidDisappear:(BOOL)animated {
//  [super viewDidDisappear:animated];
//  NSLog(@"4 - viewDidDisappear");
//}


@end

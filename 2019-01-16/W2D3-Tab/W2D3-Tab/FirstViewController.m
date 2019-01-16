//
//  FirstViewController.m
//  W2D3-Tab
//
//  Created by Jason Liang on 1/16/19.
//  Copyright © 2019 jasonliang. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@property (weak, nonatomic) IBOutlet UIView *testView;

@end

@implementation FirstViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.testView.layer.cornerRadius = 40;
  self.testView.layer.masksToBounds = YES;
  
  self.testView.frame = CGRectMake(200, 400, 300, 300);
  NSLog(@"viewDidLoad");
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  NSLog(@"viewWillAppear");
}

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  NSLog(@"viewDidAppear");
}

- (void)viewDidDisappear:(BOOL)animated {
  [super viewDidDisappear:animated];
  NSLog(@"viewDidDisappear");
}


@end

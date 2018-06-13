//
//  FirstViewController.m
//  W2D3
//
//  Created by Jason Liang on 6/13/18.
//  Copyright © 2018 jasonliang. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (instancetype)init
{
  self = [super init];
  if (self) {
    
  }
  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  NSLog(@"appear");
}

- (void)viewDidDisappear:(BOOL)animated {
  [super viewDidDisappear:animated];
  NSLog(@"disappear");
}


- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (void)dealloc {
  
}


@end

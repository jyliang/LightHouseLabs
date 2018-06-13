//
//  SecondViewController.m
//  W2D3
//
//  Created by Jason Liang on 6/13/18.
//  Copyright © 2018 jasonliang. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  
  UINib *nib = [UINib nibWithNibName:@"CustomView" bundle:[NSBundle mainBundle]];
  NSArray *views = [nib instantiateWithOwner:nil options:nil];
  UIView *customView = [views firstObject];
  [self.view addSubview:customView];
  
  customView.translatesAutoresizingMaskIntoConstraints = NO;
}


- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}


@end

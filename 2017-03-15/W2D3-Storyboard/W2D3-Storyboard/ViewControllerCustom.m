//
//  ViewControllerCustom.m
//  W2D3-Storyboard
//
//  Created by Jason Liang on 3/15/17.
//  Copyright © 2017 Jason Liang. All rights reserved.
//

#import "ViewControllerCustom.h"

@interface ViewControllerCustom ()
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewControllerCustom

- (void)viewDidLoad {
    [super viewDidLoad];
  self.title = @"SecondViewController";
  self.label.text = self.text;
  
  [self.delegate printResult];
  
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  NSLog(@"1");
}
- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  NSLog(@"2");
}
- (void)viewWillDisappear:(BOOL)animated {
  [super viewWillDisappear:animated];
  NSLog(@"3");
}
- (void)viewDidDisappear:(BOOL)animated {
  [super viewDidDisappear:animated];
  NSLog(@"4");
}



@end

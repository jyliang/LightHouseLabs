//
//  ViewController.m
//  W2D4
//
//  Created by Jason Liang on 7/6/17.
//  Copyright © 2017 Jason. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController

// Life cycle
- (void)loadView {
  if (self.viewLoaded) {
    
  }
  [super loadView];
  if (self.viewLoaded) {
  
  }
}

- (void)viewDidLoad {
  [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
  [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
  [super viewDidDisappear:animated];
}

// Don't call this.
- (void)dealloc {
  
}

// Layout cycle

- (void)viewWillLayoutSubviews {
  [super viewWillLayoutSubviews];
}

- (void)viewDidLayoutSubviews {
  [super viewDidLayoutSubviews];
}

@end

//
//  SecondViewController.m
//  W2D3-Tab
//
//  Created by Jason Liang on 1/16/19.
//  Copyright © 2019 jasonliang. All rights reserved.
//

#import "SecondViewController.h"
#import "CustomControl.h"
@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  //1. extract nib object from xib file
  UINib *nib = [UINib nibWithNibName:@"CustomView" bundle:[NSBundle mainBundle]];
  //2. extract the view object
  
  CustomControl *control = [[CustomControl alloc] init];
  NSArray *nibObjects = [nib instantiateWithOwner:control options:nil];
  UIView *customView = [nibObjects firstObject];
  
  [self.view addSubview:customView];
  
  [control.indicator startAnimating];
  
}


@end

//
//  SecondViewController.m
//  W2D4
//
//  Created by Jason Liang on 8/9/18.
//  Copyright © 2018 jasonliang. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation SecondViewController


- (IBAction)handleTapGesture:(id)sender {
  NSLog(@"Label tapped");
}

- (IBAction)handlePanGesture:(UIPanGestureRecognizer *)sender {
  if (sender.state == UIGestureRecognizerStateChanged) {
    self.label.center = [sender locationInView:self.view];
  }
}


@end

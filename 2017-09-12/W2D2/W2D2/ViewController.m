//
//  ViewController.m
//  W2D2
//
//  Created by Jason Liang on 9/12/17.
//  Copyright © 2017 jason. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *topButton;
@property (weak, nonatomic) IBOutlet UIButton *bottomButton;
@property (weak, nonatomic) IBOutlet UIView *squareView;
@property (nonatomic) UIView *customView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *smallSquareWidthConstraint;

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.view.backgroundColor = [UIColor redColor];
  
  // Do any additional setup after loading the view, typically from a nib.
  
  self.customView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
  self.customView.backgroundColor = [UIColor purpleColor];
  
//  [self.view addSubview:self.customView];
  [self.view insertSubview:self.customView belowSubview:self.squareView];
  
  
  // 2 methods to change the order
//  [self.view bringSubviewToFront:self.squareView];
//  [self.view sendSubviewToBack:self.customView];
  
  
  // Programmatic Layout Constraint

  UIView *newView = [[UIView alloc] init];
  newView.backgroundColor = [UIColor magentaColor];
  [self.squareView addSubview:newView];
  
  // Auto Layout
  newView.translatesAutoresizingMaskIntoConstraints = NO;
  
  NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:newView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.squareView attribute:NSLayoutAttributeLeading multiplier:1.0 constant:16.0];
  NSLayoutConstraint *bottomConstraint = [NSLayoutConstraint constraintWithItem:newView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.squareView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-16.0];
  NSLayoutConstraint *rightConstraint = [NSLayoutConstraint constraintWithItem:newView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.squareView attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:-16.0];
  NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:newView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.squareView attribute:NSLayoutAttributeTop multiplier:1.0 constant:16.0];
  
      leftConstraint.active = YES;
      bottomConstraint.active = YES;
      rightConstraint.active = YES;
      topConstraint.active = YES;
  
//  [NSLayoutConstraint activateConstraints:@[leftConstraint, rightConstraint, bottomConstraint, topConstraint]];
  
}


- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (IBAction)buttonTapped:(id)sender {
  if (sender == _topButton) {
    NSLog(@"top button");
    
//    CGPoint point = CGPointMake(0, 0);
//    CGSize size = CGSizeMake(100, 100);
    
    
    
    [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
      CGRect rect = CGRectMake(0, 0, 100, 100);
      self.squareView.frame = rect;
      [self.view layoutIfNeeded];
    } completion:nil];
    
//    dispatch_block_t animations = ^{
//      CGRect rect = CGRectMake(0, 0, 100, 100);
//      self.squareView.frame = rect;
//      [self.view layoutIfNeeded];
//    };
//    [UIView animateWithDuration:1 animations:animations];
    

    
  } else if (sender == _bottomButton) {
    NSLog(@"bottom button");
    
    [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
      CGRect rect = CGRectMake(0, 300, 200, 200);
      self.squareView.frame = rect;
      [self.view layoutIfNeeded];
    } completion:nil];
  }
}


@end

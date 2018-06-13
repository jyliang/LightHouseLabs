//
//  ViewController.m
//  W2D3-Segue
//
//  Created by Jason Liang on 6/13/18.
//  Copyright © 2018 jasonliang. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
}

//- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
//  return NO;
//}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//  [segue.identifier isEqualToString:@"somesegue"];
  
  SecondViewController *secondVC = (SecondViewController *)segue.destinationViewController;
  secondVC.text = @"AWESOME";
//  [secondVC loadView];
//  secondVC.label.text = @"WT";
  
}


@end

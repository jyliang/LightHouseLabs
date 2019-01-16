//
//  ViewController.m
//  W2D3-PassingData
//
//  Created by Jason Liang on 1/16/19.
//  Copyright © 2019 jasonliang. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
}

- (IBAction)submit {
  [self performSegueWithIdentifier:@"submit" sender:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  
  if ([segue.identifier isEqualToString:@"submit"]) {
    DetailViewController *dvc = (DetailViewController *)segue.destinationViewController;  
    dvc.textInfo = self.textField.text;
    
  }
}


@end

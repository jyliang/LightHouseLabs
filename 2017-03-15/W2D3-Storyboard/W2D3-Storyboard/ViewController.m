//
//  ViewController.m
//  W2D3-Storyboard
//
//  Created by Jason Liang on 3/15/17.
//  Copyright © 2017 Jason Liang. All rights reserved.
//

#import "ViewController.h"
#import "ViewControllerCustom.h"
#import "ChildViewController.h"

@interface ViewController  () <ViewControllerCustomDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIButton *button;

@end

@implementation ViewController

- (void)printResult {
  NSLog(@"printing result from the second viewcontroller");
}

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.navigationController.navigationBar.tintColor = [UIColor redColor];

  self.title = @"FirstViewController";
  self.button.backgroundColor = [UIColor redColor];
  
//  self.button.layer.cornerRadius = 100;
//  self.button.layer.masksToBounds = YES;

  
//  // Create custom nib views:
//  UINib *nib = [UINib nibWithNibName:@"SimpleView" bundle:nil];
//  NSArray *views = [nib instantiateWithOwner:nil options:nil];
//  [self.view addSubview:[views firstObject]];
  [self embedChildViewController];
}

- (void)embedChildViewController {
  ChildViewController *childViewController = [[ChildViewController alloc] init];
  // add the childViewController view
  [self addChildViewController:childViewController]; // Important for lifecycle events.
  childViewController.view.frame = CGRectMake(100, 100, 100, 100);
  [self.view addSubview:childViewController.view];
}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
  if ([identifier isEqualToString:@"SecondViewController"]) {
    return self.textField.text.length > 0;
  }
  
  return YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  if ([segue.identifier isEqualToString:@"SecondViewController"]) {
    ViewControllerCustom *destinationVC = segue.destinationViewController;
    destinationVC.delegate = self;
    destinationVC.text = self.textField.text;
  }
}

- (IBAction)secondButtonTapped:(id)sender {
  [self performSegueWithIdentifier:@"SecondViewController" sender:nil];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}


@end

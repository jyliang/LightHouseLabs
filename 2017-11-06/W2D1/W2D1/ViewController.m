//
//  ViewController.m
//  W2D1
//
//  Created by Jason Liang on 11/6/17.
//  Copyright © 2017 Jason Liang. All rights reserved.
//

#import "ViewController.h"
#import "Coffee.h"
#import "CustomView.h"

@interface ViewController ()

@property(nonatomic, strong) Coffee *coffee;
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property(nonatomic, weak) CustomView *coffeeView;
@end

@implementation ViewController

- (instancetype)initWithCoder:(NSCoder *)coder
{
  self = [super initWithCoder:coder];
  if (self) {
    // model creation
    Coffee *coffee = [[Coffee alloc] init];
    coffee.kind = @"black";
    coffee.details = @"customers' favourite";
    self.coffee = coffee;
  }
  return self;
}

//- (void)loadView {
//  [super loadView];
//
//}

- (IBAction)buttonTapped:(id)sender {
  self.coffee.kind = @"roasted";
  [self.coffeeView configWithCoffee:self.coffee];
  self.coffeeView.backgroundColor = [UIColor redColor];
}

- (BOOL)becomeFirstResponder {
  return [_textField becomeFirstResponder];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  
  // view creation
  CustomView *coffeeView = [[CustomView alloc] initWithFrame:CGRectMake(0, 20, 200, 200)];
  [coffeeView configWithCoffee:self.coffee];
  coffeeView.backgroundColor = [UIColor brownColor];
  coffeeView.userInteractionEnabled = NO;
  self.coffeeView = coffeeView;
  [self.view addSubview:coffeeView];
  
//  [coffeeView becomeFirstResponder];
  
//  [_textField becomeFirstResponder];
  
  
//  UILabel *label = [[UILabel alloc] init];
//  label.text = self.coffee.kind;
//  label.backgroundColor = [UIColor greenColor];
//  label.frame = CGRectMake(100, 100, 200, 400);
//
//  //[label sizeToFit];
//  //label.center = self.view.center;
//  // view insertion into ViewController's root view's subview
//  [self.view addSubview:label];
  
  
  
  
//  UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//  [button setTitle:@"next" forState:UIControlStateNormal];
//  button.frame = CGRectMake(100, 100, 100, 100);
//  button.backgroundColor = [UIColor redColor];
//  button.center = self.view.center;
//  [button addTarget:self action:@selector(showNextViewControlelr) forControlEvents:UIControlEventTouchUpInside];
//  [self.view addSubview:button];

}

- (void)showNextViewControlelr {
  ViewController *vc = [[ViewController alloc] init];
  [self.navigationController pushViewController:vc animated:YES];
  
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

- (void)dealloc {
  
}

@end

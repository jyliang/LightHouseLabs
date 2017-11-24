//
//  ViewController.m
//  W4D5
//
//  Created by Jason Liang on 11/24/17.
//  Copyright © 2017 Jason Liang. All rights reserved.
//

#import "ViewController.h"
// 1.
#import <SDWebImage/UIImageView+WebCache.h>
#import "MaterialButtons.h"
#import "Dog.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  //2.
  UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
  [self.view addSubview:imageView];
  imageView.contentMode = UIViewContentModeScaleAspectFit;
  //3.
  [imageView sd_setImageWithURL:[NSURL URLWithString:@"https://images-na.ssl-images-amazon.com/images/I/6195c4zLayL._SL1000_.jpg"]];
  
  MDCRaisedButton *raisedButton = [[MDCRaisedButton alloc] init];
  [raisedButton setTitle:@"Raised Button" forState:UIControlStateNormal];
  [raisedButton sizeToFit];
  
  CGRect frame = raisedButton.frame;
  frame.origin.y = 100;
  frame.origin.x = (self.view.bounds.size.width - frame.size.width) / 2;
  raisedButton.frame = frame;
  
  [raisedButton addTarget:self
                   action:@selector(tapped:)
         forControlEvents:UIControlEventTouchUpInside];
  
  [self.view addSubview:raisedButton];
  [self testRealm];
}

- (void)tapped:(id)sender {
  NSLog(@"Button was tapped!");
}

#pragma mark - Region 1

- (void)testRealm {
  // Use them like regular Objective‑C objects
  Dog *mydog = [[Dog alloc] init];
  mydog.name = @"Rex";
  mydog.age = 1;
  mydog.picture = nil; // properties are nullable
  NSLog(@"Name of dog: %@", mydog.name);
  
  // Query Realm for all dogs less than 2 years old
  RLMResults<Dog *> *puppies = [Dog objectsWhere:@"age < 2"];
  puppies.count; // => 0 because no dogs have been added to the Realm yet
  
  // Persist your data easily
  RLMRealm *realm = [RLMRealm defaultRealm];
  [realm transactionWithBlock:^{
    [realm addObject:mydog];
  }];
  
  // Queries are updated in realtime
  puppies.count; // => 1
}

- (void)somefunction {}


@end

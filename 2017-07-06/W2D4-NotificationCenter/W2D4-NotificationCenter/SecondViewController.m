//
//  SecondViewController.m
//  W2D4-NotificationCenter
//
//  Created by Jason Liang on 7/6/17.
//  Copyright © 2017 Jason. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation SecondViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleMessage:) name:@"message" object:nil];
  
}

- (void)handleMessage:(NSNotification *)notification {
//  notification.object
  NSString *stringValue = notification.userInfo[@"messageKey"];

  self.label.text = stringValue;
}

- (void)dealloc {
//  [[NSNotificationCenter defaultCenter] removeObserver:self];
  [[NSNotificationCenter defaultCenter] removeObserver:self name:@"message" object:nil];
}


@end

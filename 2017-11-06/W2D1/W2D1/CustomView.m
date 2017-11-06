//
//  CustomView.m
//  W2D1
//
//  Created by Jason Liang on 11/6/17.
//  Copyright © 2017 Jason Liang. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView

- (instancetype)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:frame];
  if (self) {
    self.titleLabel = [[UILabel alloc] init];
    [self addSubview:self.titleLabel];
    self.titleLabel.frame = CGRectMake(0, 0, 200, 100);
    self.subtitleLabel = [[UILabel alloc] init];
    [self addSubview:self.subtitleLabel];
    self.subtitleLabel.frame = CGRectMake(0, 100, 200, 100);
    
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    [self addSubview:self.textField];
  }
  return self;
}

- (void)configWithCoffee:(Coffee *)coffee {
  self.titleLabel.text = coffee.kind;
  self.subtitleLabel.text = coffee.details;
}

- (BOOL)becomeFirstResponder {
  return [self.textField becomeFirstResponder];
}

@end

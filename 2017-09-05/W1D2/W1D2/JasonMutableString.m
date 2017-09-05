//
//  JasonMutableString.m
//  W1D2
//
//  Created by Jason Liang on 9/5/17.
//  Copyright © 2017 jason. All rights reserved.
//

#import "JasonMutableString.h"

@implementation JasonMutableString

- (instancetype)initWithString:(NSString *)aString {
  self = [NSMutableString stringWithString:aString];
  if (self) {
    NSLog(@"yay");
  }
  return self;
}

@end

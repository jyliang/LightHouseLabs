//
//  BaseObject.m
//  W1D3
//
//  Created by Jason Liang on 1/9/19.
//  Copyright © 2019 jasonliang. All rights reserved.
//

#import "BaseObject.h"

// private interface
@interface BaseObject()

- (void)privateMethod;

@end

@implementation BaseObject

- (NSString *)description {
  return self.text;
}

- (void)publicMethod {
  NSLog(@"public");
}

- (void)privateMethod {
  NSLog(@"private");
  self.text = @"2";
}

- (void)printDescription {
  NSLog(@"%@", self.text);
  if ([self.text isEqualToString:@"67657576"]) {
    
  }
}

@end

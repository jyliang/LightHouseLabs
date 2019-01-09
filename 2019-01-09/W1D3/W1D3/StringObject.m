//
//  StringObject.m
//  W1D3
//
//  Created by Jason Liang on 1/9/19.
//  Copyright © 2019 jasonliang. All rights reserved.
//

#import "StringObject.h"

@implementation StringObject

// I can override the init method and return nil, making the custom initializer the only valid init path. This is not common practice.
//- (instancetype)init
//{
//  return nil;
//}

- (instancetype)initWithString:(NSString *)aString;
{
  self = [super init];
  if (self) {
    self.text = aString;
  }
  return self;
}

- (void)myMethod {
  
}

- (NSString *)uppercaseString {
  return @"i do whatever i want";
}

// example of override
- (NSString *)description {
  NSString *baseDescription = [super description];
  baseDescription = [baseDescription stringByAppendingString:@"!!!!"];
  return baseDescription;
}

- (void)testMethod {
  [self myMethod];
  [self uppercaseString];
}

@end

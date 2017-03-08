//
//  StringObjectSub.m
//  W1D3
//
//  Created by Jason Liang on 3/8/17.
//  Copyright © 2017 Jason Liang. All rights reserved.
//

#import "StringObjectSub.h"

@implementation StringObjectSub

- (instancetype)init {
  // Hits here first
  self = [super init];
  // Hits here third
  if (self) {
    NSLog(@"String Object Sub init");
  }
  return self;
}

- (NSString *)getString {
  return @"A string";
}

- (void)printString {
  [super printString];
  NSLog(@"print string2");
}

@end

//
//  StringObject.m
//  W1D3
//
//  Created by Jason Liang on 3/8/17.
//  Copyright © 2017 Jason Liang. All rights reserved.
//

#import "StringObject.h"

//@interface StringObject ()
//
//- (void)privateMethod;
//
//@end

@implementation StringObject

- (void)privateMethod {

}

- (void)methodInsideMyImplementation {
  [self privateMethod];
}

- (instancetype)init {
  // Hits here second
  self = [super init];
  
  if (self != nil) {
    NSLog(@"String Object init");
  }
  
  if (self) {
    NSLog(@"String Object init");
  }
  return self;
}

- (void)printString {
  NSLog(@"print string");
}

@end

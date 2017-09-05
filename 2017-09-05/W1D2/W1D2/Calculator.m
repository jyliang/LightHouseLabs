//
//  Calculator.m
//  W1D2
//
//  Created by Jason Liang on 9/5/17.
//  Copyright © 2017 jason. All rights reserved.
//

#import "Calculator.h"

@implementation Calculator

- (instancetype)initWithIntialSum:(int)sum {
  self = [super init];
  if (self) {
    self.sum2 = sum;
  }
  return self;
}

+ (int)sumsquare:(int)sum withIndex:(int)index {
  return sum + index * index;
}

- (void)sum2squareWithIndex:(int)index {
  self.sum2 = self.sum2 + index * index;
}

@end

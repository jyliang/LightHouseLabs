//
//  Truck.m
//  W1D4
//
//  Created by Jason Liang on 8/2/18.
//  Copyright © 2018 jasonliang. All rights reserved.
//

#import "Truck.h"

@implementation Truck

- (instancetype)init
{
  self = [super init];
  if (self) {
//    _brand = @"Chevy";
  }
  return self;
}

- (void)testItOut {
  _brand = [@"Chevy" mutableCopy];
  self.brand = [@"Ford" mutableCopy];
}

- (void)setBrand:(NSMutableString *)brand {
  _brand = brand;
  NSLog(@"this makes me happy");
}

//- (void)setBrand:(NSString *)brand {
//  _brand = brand;
//}

@end

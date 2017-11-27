//
//  Person.m
//  W5D1
//
//  Created by Jason Liang on 11/27/17.
//  Copyright © 2017 Jason Liang. All rights reserved.
//

#import "Person.h"

@implementation Person

- (instancetype)initWithName:(NSString *)name address:(NSString *)address {
  self = [super init];
  if (self) {
    self.name = name;
    self.address = address;
  }
  return self;
}

@end



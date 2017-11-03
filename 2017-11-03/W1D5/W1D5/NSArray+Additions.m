//
//  NSArray+Additions.m
//  W1D5
//
//  Created by Jason Liang on 11/3/17.
//  Copyright © 2017 Jason Liang. All rights reserved.
//

#import "NSArray+Additions.h"

@implementation NSArray (Additions)

- (void)printEvenIndexObjects {
  //method 1
  int i = 0;
  for (NSNumber *number in self) {
    if (i % 2 == 0) {
      NSLog(@"%@", number);
    }
    i++;
  }
  //method 2
  for (int i = 0; i < self.count; i++) {
    if (i % 2 == 0) {
      NSLog(@"%@", self[i]);
    }
  }
  
  //method 3: best for this case
  for (int i = 0; i < self.count; i+=2) {
    NSLog(@"%@", self[i]);
  }
  
}

@end

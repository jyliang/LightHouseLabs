//
//  Car.m
//  W1D4
//
//  Created by Jason Liang on 8/2/18.
//  Copyright © 2018 jasonliang. All rights reserved.
//

#import "Car.h"

@implementation Car

- (void)updatePedals {
  // 3. Use the delegate
  [self.driver rightFootPosition];
  
  if ([self.driver respondsToSelector:@selector(optionalMethod)]) {
    [self.driver optionalMethod];
  }
  
}

@end

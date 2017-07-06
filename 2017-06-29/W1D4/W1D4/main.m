//
//  main.m
//  W1D4
//
//  Created by Jason Liang on 6/29/17.
//  Copyright © 2017 Jason. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Car.h"

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    
    Car *car = [[Car alloc] init];
    
    [car drive];
    [car driveRealFast];
    
    [car setPointer:car];
    car.pointer = car;
    
    NSDictionary *dictionary = @{@"key1":@1, @"key2":@2};
    
    for (id value in dictionary.allValues) {
      NSLog( @"%@", value);
    }
    
  }
  return 0;
}

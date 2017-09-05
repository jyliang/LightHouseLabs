//
//  main.m
//  W1D2
//
//  Created by Jason Liang on 9/5/17.
//  Copyright © 2017 jason. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JasonMutableString.h"
#import "Calculator.h"

int main(int argc, const char * argv[]) {
  @autoreleasepool {
      // insert code here...
      NSLog(@"Hello, World!");
    
    NSArray *array2 = @[@"1", @"2", @"asdf"]; // dont
    array2[0];
    [array2 objectAtIndex:0];
//    array2[1]; // crash
    
    
    // method 1
    int sum = 0;
    for (int i = 1; i <= 100; i = i + 1) {
      sum = [Calculator sumsquare:sum withIndex:i];
      NSLog(@"%i", sum);
    }
    
    
    // method 2
    Calculator *cal = [[Calculator alloc] initWithIntialSum:0];
    for (int i = 1; i <= 100; i = i + 1) {
      [cal sum2squareWithIndex:i];
      NSLog(@"%i", cal.sum2);
    }

    
    
    // string
    NSString *string1 = @"part1";
    string1 = [string1 stringByAppendingString:@"part2"];
    NSLog(@"%@", string1);
    
    // mutable string
    
//    NSMutableString *string2 = [[JasonMutableString alloc] initWithString:@"part1"];
    
    //method 1
    NSMutableString *string2 = [[NSMutableString alloc] initWithString:@"part1"];

    //method 2
//    NSMutableString *string2 = [NSMutableString stringWithString:@"part1"];
    [string2 appendString:@"part2"];
    NSLog(@"%@", string2);
    
    id stuff = string2;
    NSLog(@"%@", stuff);
    
    NSArray *array = @[@"1", @"2"];
    stuff = array;
    NSLog(@"%@", stuff);
    
  
    
//    stuff = 1; //no no
    
    
    
    
//    NSString *stuff;
//    
//    NSArray *array;
//    
//    
//    NSString *testString = @"test";
//    NSLog(@"%@", testString);
//    
//    if (true) {
//      testString = @"test2";
//      
////      NSString *testString2 = @"test";
//      
//      NSLog(@"%@", testString);
//    }
//    
//    NSLog(@"%@", testString);
    
  }
  return 0;
}

//
//  main.m
//  W1D3-NSSet
//
//  Created by Jason Liang on 3/8/17.
//  Copyright © 2017 Jason Liang. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
  @autoreleasepool {
      // insert code here...
      NSLog(@"Hello, World!");
    
    NSArray *array = @[@"tacos", @"burgers", @"tacos"];
    
    NSMutableSet *set1 = [[NSMutableSet alloc] initWithObjects:@"tacos", @"burgers", nil];
    
    NSMutableSet *set2 = [[NSMutableSet alloc] initWithObjects:@"tacos", @"ramen", nil];
    
    
//    [set1 unionSet:set2];

    [set1 minusSet:set2];
    
//    [set containsObject:@"burgers"];
    
    
    
    
//    NSSet *set2 = [set setByAddingObject:@"ramen"];
    
    
    NSMutableSet *mutableSet = [[NSMutableSet alloc] init];
    mutableSet = [[NSMutableSet alloc] initWithSet:set1];
    
    
    
    [mutableSet addObjectsFromArray:array];
//    [[NSMutableSet alloc] initWithArray:@[@"tacos", @"burgers", @"tacos"]];
    
    [mutableSet addObject:@"burgers"];
    
    
    
    
    
    NSLog(@"%@", mutableSet);
    
  }
    return 0;
}

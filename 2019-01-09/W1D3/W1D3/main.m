//
//  main.m
//  W1D3
//
//  Created by Jason Liang on 1/9/19.
//  Copyright © 2019 jasonliang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StringObject.h"
#import "BaseObject.h"

int main(int argc, const char * argv[]) {
  @autoreleasepool {
      // insert code here...
      NSLog(@"Hello, World!");
    
//    StringObject *str = [[StringObject alloc] initWithString:@"asdf"];
//    NSLog(@"%@", str);
    
    BaseObject *bobj = [[BaseObject alloc] init];
    bobj.text = @"hello 2019";
    NSLog(@"%@", bobj);
    
    [bobj publicMethod];
    
    [bobj printDescription];
    
    StringObject *sobj;
    //base case
    sobj = [[StringObject alloc] init];
    sobj.text = @"hello 2019";
    //customize init
    sobj = [[StringObject alloc] initWithString:@"hello 2019"];
    
    NSLog(@"%@", sobj);
    
    NSObject *o = [NSNull null];
    
    
    NSMutableSet *mutableSet2 = [[NSMutableSet alloc] initWithObjects:@"jason",@"paul",@"david", nil];
    NSLog(@"%@", mutableSet2);
    
    NSMutableSet *mutableSet = [[NSMutableSet alloc] initWithArray:@[@"jason", @"jason", @"jason", @"amand"]];
    [mutableSet addObject:@"jason"];
//    [mutableSet addObject:@"paul"];
    
    // method 1
    [mutableSet addObjectsFromArray:@[@"david",@"david"]];
    // method 2
    for (NSString *item in @[@"david",@"david"]) {
      [mutableSet addObject:item];
    }
    
    
    [mutableSet addObject:@[@"david",@"david",@"paul"]];
    [mutableSet addObject:@[@"david",@"david",@"paul"]];
    [mutableSet addObject:@[@"david",@"david2",@"paul"]];
    [mutableSet addObject:[NSNumber numberWithInt:123]];
    
    
    NSLog(@"%@", mutableSet);
    
    if ([mutableSet2 isSubsetOfSet:mutableSet]) {
      NSLog(@"mutableSet2 is a subset of mutableSet");
    }
    
    [mutableSet unionSet:mutableSet2];
    NSLog(@"%@", mutableSet);
    
  }
  return 0;
}

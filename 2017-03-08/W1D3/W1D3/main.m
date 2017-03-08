//
//  main.m
//  W1D3
//
//  Created by Jason Liang on 3/8/17.
//  Copyright © 2017 Jason Liang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StringObjectSub.h"

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    
    StringObject *o = [[StringObject alloc] init];
    [o publicMethod];
    [o printString];
    
    
    

//    [o privateMethod];
    
    
      // insert code here...
      NSLog(@"Hello, World!");
    
    
    long number1;
    NSLog(@"%ld", number1);
    
    number1 = 2;
    NSLog(@"%ld", number1);
    
    
    StringObjectSub *obj;
//    StringObjectSub *obj = nil;
//    NULL
//    NSNull
    
    
//    obj = [NSNull null];
    
    //equvilaent statements:
    
//    BOOL check;
    NSInteger somenumber;
//    0 = false
    somenumber = 1;
    
    if (somenumber) {
      NSLog(@"number is not 0");
    } else {
      NSLog(@"number is 0");
    }
    
    if (obj != nil) {
      NSLog(@"obj is nil");
    } else {
      NSLog(@"obj is not nil");
    }
    
    
    
    if ( [obj getString] == nil) {
      NSLog(@"get string returns nil");
    }
    
    NSLog(@"%@", [obj getString]);
    
    obj = [[StringObjectSub alloc] init];
    
    [obj printString];
    
    // Objects:
//    NSObject
    
//    NSString
//    NSArray
//    NSCharacterSet
    
    // Primitive Types:
//    NSInteger
    
    
    
  }
    return 0;
}

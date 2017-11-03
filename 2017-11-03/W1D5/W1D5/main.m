//
//  main.m
//  W1D5
//
//  Created by Jason Liang on 11/3/17.
//  Copyright © 2017 Jason Liang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Sleep.h"
#import "NSArray+Additions.h"
#import "CustomArray.h"
#import "Room.h"
#import "Jail.h"

int main(int argc, const char * argv[]) {
  @autoreleasepool {
      // insert code here...
      NSLog(@"Hello, World!");

    CGPoint point = CGPointMake(0, 0);
    NSValue *valueObj = [NSValue valueWithPoint:point];
    CGPoint pointValue = [valueObj pointValue];
    
    float num1 = 1.2;
    CGFloat num2 = 1.4;
    num1 / (float)num2;
    
//    [[NSNumber numberWithBool:YES] boolValue];
//
//    @YES
    
    Room *room = [[Room alloc] init];
    Jail *jail = [[Jail alloc] init];
    
    Sleep *sleep = [[Sleep alloc] init];
    
    sleep.delegate = jail;
    
    if ([sleep.delegate hasBed]) {
      //do something
    }
    
    // deal with optionals
    if ([sleep.delegate respondsToSelector:@selector(hasAC)]) {
      if ([sleep.delegate hasAC]) {
        
      }
    }
    
    
    
//    NSArray *numbers = @[@1,@2,@3,@4,@5,@6,@7];
//    [numbers printEvenIndexObjects];
//    // Print 1, 3, 5, 7
//
//    CustomArray *myNumbers = [[CustomArray alloc] initWithArray:@[@1,@2,@3]];
//    [myNumbers printEvenIndexObjects];
    
    
//    Sleep *sleep = [[Sleep alloc] init];
//    //isKindOfClass
//    //isMemberOfClass
//    NSLog(@"sleep isKindOfClass : %i NSObject", [sleep isKindOfClass:[NSObject class]]);
//    NSLog(@"sleep isMemberOfClass : %i Sleep", [sleep isMemberOfClass:[NSObject class]]);
//
//    [sleep activateSelector];
//
//    [sleep performSelector:@selector(activateSelector)];
//
//    SEL sleep1HourSelector = @selector(sleepFor1Hour);
//    SEL sleepSelector = @selector(sleep:);
//
//    if ([sleep respondsToSelector:sleep1HourSelector]) {
//      [sleep performSelector:@selector(sleepFor1Hour)];
//    }
//
//    if ([sleep respondsToSelector:sleepSelector]) {
//      [sleep performSelector:@selector(sleep:) withObject:@1];
//    }
    
    
  }
  return 0;
}

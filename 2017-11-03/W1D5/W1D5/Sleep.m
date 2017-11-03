//
//  Sleep.m
//  W1D5
//
//  Created by Jason Liang on 11/3/17.
//  Copyright © 2017 Jason Liang. All rights reserved.
//

#import "Sleep.h"

@implementation Sleep

- (void)activateSelector {
  NSLog(@"selector activated");

  SEL sleep1HourSelector = @selector(sleepFor1Hour);
  SEL sleepSelector = @selector(sleep:);
  
  if ([self respondsToSelector:sleep1HourSelector]) {
    [self performSelector:@selector(sleepFor1Hour)];
  }
  
  if ([self respondsToSelector:sleepSelector]) {
    [self performSelector:@selector(sleep:) withObject:@1];
  }
  

}

- (void)sleepFor1Hour {
  NSLog(@"sleeping for 1 hour");
}

- (void)sleep:(NSNumber *)hours {
  NSUInteger h = [hours unsignedLongLongValue];
  NSLog(@"sleeping for %lu hours", h);
}

@end

@implementation Sleep (Additions)



@end

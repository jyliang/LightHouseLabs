//
//  Animal.m
//  W4D4-Archiving
//
//  Created by Jason Liang on 2/2/17.
//  Copyright © 2017 Jason Liang. All rights reserved.
//

#import "Animal.h"

@implementation Animal

- (instancetype)initWithCoder:(NSCoder *)coder
{
  self = [super init];
  if (self) {
    _kind = [coder decodeObjectForKey:@"kind"];
  }
  return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
  [coder encodeObject:self.kind forKey:@"kind"];
}

@end

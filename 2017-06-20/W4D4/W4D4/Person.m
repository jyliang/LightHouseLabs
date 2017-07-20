//
//  Person.m
//  W4D4
//
//  Created by Jason Liang on 7/20/17.
//  Copyright © 2017 Jason. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)encodeWithCoder:(NSCoder *)aCoder {
  [aCoder encodeObject:_firstName forKey:@"firstName"];
  [aCoder encodeObject:_lastName forKey:@"lastName"];
  [aCoder encodeObject:_idNumber forKey:@"idNumber"];
}

- (instancetype)initWithCoder:(NSCoder *)coder {
  self = [super init];
  if (self) {
    _firstName = [coder decodeObjectForKey:@"firstName"];
    _lastName = [coder decodeObjectForKey:@"lastName"];
    _idNumber = [coder decodeObjectForKey:@"idNumber"];
  }
  return self;
}

@end

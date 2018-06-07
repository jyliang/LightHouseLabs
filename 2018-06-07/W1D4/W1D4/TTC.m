//
//  TTC.m
//  W1D4
//
//  Created by Jason Liang on 6/7/18.
//  Copyright © 2018 Jason Liang. All rights reserved.
//

#import "TTC.h"

@implementation TTC {
//  NSString *_name;
  NSString *_anotherIVar;
}

- (void)someOtherMethod {
  self.name = @"asdf";
  _name = @"asdf";
}

- (NSString *)name {
  if (!_name) {
    _name = @"expansive name string that takes a lot of memory space";
  }
  return _name;
}

//- (void)setName:(NSString *)name {
//  _name = name;
//  _anotherIVar = name;
//}

@end

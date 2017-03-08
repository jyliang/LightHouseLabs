//
//  Animal.m
//  W1D3
//
//  Created by Jason Liang on 3/8/17.
//  Copyright © 2017 Jason Liang. All rights reserved.
//

#import "Animal.h"

@interface Animal()

@property (nonatomic, strong) NSString *type;

- (void)someMethod;

@end

@implementation Animal

- (instancetype)initWithType:(NSString *)type {
  // must call [super init] here?
  // Making sure the object is created properly
  self = [super init];
  if (self) {
    //custom stuff here
    _type = type;
  }
  return self;
}


@end

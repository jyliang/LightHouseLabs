//
//  CustomArray.m
//  W1D5
//
//  Created by Jason Liang on 11/3/17.
//  Copyright © 2017 Jason Liang. All rights reserved.
//

#import "CustomArray.h"

@interface CustomArray()
@property(nonatomic) NSArray *array;
@end

@implementation CustomArray

- (instancetype)initWithArray:(NSArray *)array;
{
  self = [super init];
  if (self) {
    _array = array;
  }
  return self;
}

- (void)printEvenIndexObjects {
  //method 3: best for this case
  for (int i = 0; i < _array.count; i+=2) {
    NSLog(@"%@", _array[i]);
  }
}

@end

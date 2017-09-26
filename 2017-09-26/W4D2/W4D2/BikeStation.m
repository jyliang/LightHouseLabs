//
//  BikeStation.m
//  W4D2
//
//  Created by Jason Liang on 9/26/17.
//  Copyright © 2017 jason. All rights reserved.
//

#import "BikeStation.h"

@implementation BikeStation

- (instancetype)initWithCoordinate:(CLLocationCoordinate2D)aCoordinate
                          andTitle:(NSString * _Nullable)aTitle
                       andSubtitle:(NSString * _Nullable)aSubtitle {
  self = [super init];
  if (self) {
    _coordinate = aCoordinate;
    _title = aTitle;
    _subtitle = aSubtitle;
  }
  return self;
}


@end

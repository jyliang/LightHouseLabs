//
//  LocationManager.m
//  W4D2
//
//  Created by Jason Liang on 9/26/17.
//  Copyright © 2017 jason. All rights reserved.
//

#import "LocationManager.h"
//#import <CoreLocation/CoreLocation.h> //OLD
@import CoreLocation;

@interface LocationManager() <CLLocationManagerDelegate>

@property(nonatomic, strong) CLLocationManager *clLocationManager;

@property(nonatomic, strong) CLLocation *lastLocation;

@end

@implementation LocationManager

- (instancetype)init {
  self = [super init];
  if (self) {
    _clLocationManager = [[CLLocationManager alloc] init];
    _clLocationManager.delegate = self;
  }
  return self;
}

- (void)requestLocationPermissionIfNeeded {
  if ([CLLocationManager locationServicesEnabled]) {
    CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
    if (status == kCLAuthorizationStatusNotDetermined) {
      // we can ask for it
      [_clLocationManager requestWhenInUseAuthorization];
    } else if (status == kCLAuthorizationStatusAuthorizedAlways
               || status == kCLAuthorizationStatusAuthorizedWhenInUse) {
      [_clLocationManager startUpdatingLocation];
    }
  }
}

#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
  NSLog(@"status changed to %d", status);
  [_clLocationManager startUpdatingLocation];
  
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
  CLLocation *location = [locations firstObject];
  if (location) {
    if (self.lastLocation) {
      CLLocationDistance distance = [location distanceFromLocation:self.lastLocation];
      if (distance < 100) {
        return;
      }
    }
    self.lastLocation = location;
    [self.delegate passCurrentLocation:location];
  }
}

@end

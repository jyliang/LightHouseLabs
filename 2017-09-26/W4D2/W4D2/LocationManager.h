//
//  LocationManager.h
//  W4D2
//
//  Created by Jason Liang on 9/26/17.
//  Copyright © 2017 jason. All rights reserved.
//

#import <Foundation/Foundation.h>
@import CoreLocation;

// protocol
@protocol MyLocationManagerDelegate <NSObject>

- (void)passCurrentLocation: (CLLocation*)location;

@end


// location manager interface
@interface LocationManager : NSObject

@property(nonatomic, weak) id<MyLocationManagerDelegate> delegate;

- (void)requestLocationPermissionIfNeeded;

@end

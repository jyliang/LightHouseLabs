//
//  BikeStation.h
//  W4D2
//
//  Created by Jason Liang on 9/26/17.
//  Copyright © 2017 jason. All rights reserved.
//

#import <Foundation/Foundation.h>
@import CoreLocation;
@import MapKit;

@interface BikeStation : NSObject <MKAnnotation>

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, readonly, copy, nullable) NSString *title;
@property (nonatomic, readonly, copy, nullable) NSString *subtitle;

- (instancetype _Nullable )initWithCoordinate:(CLLocationCoordinate2D)aCoordinate
                                     andTitle:(NSString * _Nullable)aTitle
                                  andSubtitle:(NSString * _Nullable)aSubtitle;

@end

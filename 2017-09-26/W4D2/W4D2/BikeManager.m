//
//  BikeManager.m
//  W4D2
//
//  Created by Jason Liang on 9/26/17.
//  Copyright © 2017 jason. All rights reserved.
//

#import "BikeManager.h"
#import "BikeStation.h"

@implementation BikeManager

+ (void)nearbyBikes:(CLLocation*)currentLocation limit:(int)limit block:(void (^)(NSArray * , NSError *error))completionBlock {
  NSString *urlString= @"https://tor.publicbikesystem.net/ube/gbfs/v1/en/station_information";
  
  NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
  
  NSURLSession *session = [NSURLSession sharedSession];
  NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
    
    if (!error) {
      NSError *myJSONSerializationError = nil;
      
      NSDictionary *JSON = [NSJSONSerialization JSONObjectWithData:data options:0 error:&myJSONSerializationError];
      
      NSDictionary *responseDict = JSON[@"data"];
      NSArray *locationsArray = responseDict[@"stations"];
      
      NSMutableArray *stations = [NSMutableArray array];
      
      for (NSDictionary *eachLocation in locationsArray){
        NSString *name = eachLocation[@"name"];
        NSString *address = eachLocation[@"address"];
        NSNumber *lat = eachLocation[@"lat"];
        NSNumber *lng = eachLocation[@"lon"];
        
        BikeStation *station = [[BikeStation alloc] initWithCoordinate:CLLocationCoordinate2DMake([lat doubleValue], [lng doubleValue]) andTitle:name andSubtitle:address];
        
        [stations addObject:station];
        
      }
      
      [stations sortUsingComparator:^NSComparisonResult(BikeStation *station1, BikeStation *station2) {
        CLLocation *location1 = [[CLLocation alloc] initWithLatitude:station1.coordinate.latitude
                                                           longitude:station1.coordinate.longitude];
        CLLocationDistance distance1 = [currentLocation distanceFromLocation:location1];
        
        CLLocation *location2 = [[CLLocation alloc] initWithLatitude:station2.coordinate.latitude
                                                           longitude:station2.coordinate.longitude];
        CLLocationDistance distance2 = [currentLocation distanceFromLocation:location2];
        
        if (distance1 < distance2) {
          return NSOrderedAscending;
        } else {
          return NSOrderedDescending;
        }
      }];
      
      NSArray *limitedStations = [stations subarrayWithRange:NSMakeRange(0, MIN(limit, stations.count))];
      
      
      completionBlock(limitedStations, nil);
      
    }else {
      completionBlock(nil, error);
    }
    
  }];
  
  [task resume];
}

@end

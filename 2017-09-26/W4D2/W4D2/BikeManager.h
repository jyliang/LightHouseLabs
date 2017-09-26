//
//  BikeManager.h
//  W4D2
//
//  Created by Jason Liang on 9/26/17.
//  Copyright © 2017 jason. All rights reserved.
//

#import <Foundation/Foundation.h>
@import CoreLocation;
@interface BikeManager : NSObject


+ (void)nearbyBikes:(CLLocation*)currentLocation limit:(int)limit block:(void (^)(NSArray * , NSError *error))completionBlock;

@end

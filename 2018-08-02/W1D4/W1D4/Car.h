//
//  Car.h
//  W1D4
//
//  Created by Jason Liang on 8/2/18.
//  Copyright © 2018 jasonliang. All rights reserved.
//

#import <Foundation/Foundation.h>

// 1. Declare protocol
@protocol CarDriver <NSObject>

@required
- (void)rightFootPosition;

@optional
- (void)optionalMethod;

@end


@protocol ManualCarDriver <CarDriver>

- (void)moveClutch;

@end

@interface Car : NSObject

// 2. Declare class var to hold object that conforms to CarDriver protocol
@property (nonatomic, strong) id<CarDriver> driver;

- (void)updatePedals;

@end

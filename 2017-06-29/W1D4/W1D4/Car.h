//
//  Car.h
//  W1D4
//
//  Created by Jason Liang on 6/29/17.
//  Copyright © 2017 Jason. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CarDelegate <NSObject>

- (void)drive;

@end

@protocol SportsCarDelegate <NSObject, CarDelegate>

- (void)driveRealFast;

@end

@interface Car : NSObject <SportsCarDelegate>

@property(nonatomic, weak) id<SportsCarDelegate> delegate;

@property(nonatomic) id pointer;
//@property(nonatomic) NSArray array;

@end

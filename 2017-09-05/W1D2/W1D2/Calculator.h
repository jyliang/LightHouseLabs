//
//  Calculator.h
//  W1D2
//
//  Created by Jason Liang on 9/5/17.
//  Copyright © 2017 jason. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Calculator : NSObject

@property(nonatomic) int sum2;

- (instancetype)initWithIntialSum:(int)sum;

+ (int)sumsquare:(int)sum withIndex:(int)index;

- (void)sum2squareWithIndex:(int)index;

@end

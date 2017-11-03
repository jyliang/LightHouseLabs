//
//  Sleep.h
//  W1D5
//
//  Created by Jason Liang on 11/3/17.
//  Copyright © 2017 Jason Liang. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SleepDelegate <NSObject>

@required
- (BOOL)hasBed;

@optional
- (BOOL)hasAC;

@end

@interface Sleep : NSObject

@property(nonatomic, weak) id<SleepDelegate> delegate;

- (void)activateSelector;

@end

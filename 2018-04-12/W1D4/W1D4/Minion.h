//
//  Minion.h
//  W1D4
//
//  Created by Jason Liang on 4/12/18.
//  Copyright © 2018 jasonliang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"

@protocol MinionDelegate
- (void)increaseHealth;
@end

@interface Minion : NSObject

@property(nonatomic, weak) id <MinionDelegate> delegate;

- (void)dealDamage;

@end

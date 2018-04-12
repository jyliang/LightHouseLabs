//
//  Player.h
//  W1D4
//
//  Created by Jason Liang on 4/12/18.
//  Copyright © 2018 jasonliang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Minion.h"

@class Player;

@protocol PlayerDelegate3
- (void)anotherMethod2;
@end

@protocol PlayerDelegate2
- (void)anotherMethod;
@end

@protocol PlayerDelegate <PlayerDelegate2, PlayerDelegate3>

- (int)getHealth;
- (NSString *)getName;
- (void)takaDamage:(Player *)player;

@end

@interface Player : NSObject <MinionDelegate>

@property(nonatomic, assign) int health;
@property(nonatomic, strong) NSString *name;
@property(nonatomic, weak) id <PlayerDelegate> playerDelegate;
@property(nonatomic, strong) Minion *minion;

- (void)showResult;

@end

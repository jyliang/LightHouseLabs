//
//  Player.m
//  W1D4
//
//  Created by Jason Liang on 4/12/18.
//  Copyright © 2018 jasonliang. All rights reserved.
//

#import "Player.h"

@interface Player()

@end

@implementation Player {
//    int _health; //0
////    NSMutableArray *array; //nil
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.minion = [[Minion alloc] init];
        self.minion.delegate = self;
    }
    return self;
}

- (void)increaseHealth {
    self.health += 1;
}

- (void)setPlayerDelegate:(id<PlayerDelegate>)playerDelegate {
    _playerDelegate = playerDelegate;
    self.health = playerDelegate.getHealth;
    self.name = playerDelegate.getName;
}

- (void)showResult {
    NSLog(@"%@ - %d", self.playerDelegate.getName, self.playerDelegate.getHealth);
}

//
//- (NSString *)getName{
//    return _name;
//}
//
//- (void)setHealth:(int)health {
//    _health = health;
//    NSLog(@"health is set to %d", health);
////    self.health = health;
////    [self setHealth:health];
//}
//
//- (int)health {
//    return 100;
//}
//
//- (void)someFunction {
////    _health
////    self.health
//
//    self.health = 1;
//    [self setHealth:1];
//
//    NSLog(@"%d", self.health);
////    NSLog(@"%d", [self getHealth]);
//
//}

@end

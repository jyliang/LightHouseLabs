//
//  Minion.m
//  W1D4
//
//  Created by Jason Liang on 4/12/18.
//  Copyright © 2018 jasonliang. All rights reserved.
//

#import "Minion.h"

@implementation Minion

- (void)dealDamage {
    NSLog(@"Minion deal some damage, and increase health");
//    self.player.health += 1;
    [self.delegate increaseHealth];
}

@end

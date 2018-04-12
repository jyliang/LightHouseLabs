//
//  Teacher.m
//  W1D4
//
//  Created by Jason Liang on 4/12/18.
//  Copyright © 2018 jasonliang. All rights reserved.
//

#import "Teacher.h"

@implementation Teacher

- (int)getHealth {
    return 10000;
}

- (NSString *)getName {
    return @"Teacher";
}

- (void)takaDamage:(Player *)player {
    player.health = player.health - 1;
}

@end

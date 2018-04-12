//
//  Student.m
//  W1D4
//
//  Created by Jason Liang on 4/12/18.
//  Copyright © 2018 jasonliang. All rights reserved.
//

#import "Student.h"

@implementation Student

- (int)getHealth {
    return 100;
}

- (NSString *)getName {
    return @"Student";
}

- (void)takaDamage:(Player *)player {
    player.health = player.health - 20;
}

@end

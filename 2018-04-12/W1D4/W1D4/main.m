//
//  main.m
//  W1D4
//
//  Created by Jason Liang on 4/12/18.
//  Copyright © 2018 jasonliang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"
#import "Student.h"
#import "Teacher.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Player *player = [[Player alloc] init];
        player.health = 10;
        
        [player showResult];
        
        Student *student = [[Student alloc] init];
        player.playerDelegate = student;
        [player showResult];
        
        Teacher *teacher = [[Teacher alloc] init];
        player.playerDelegate = teacher;
        [player showResult];
        
        [player.playerDelegate takaDamage:player];
        
        NSLog(@"player health is %d", player.health);
        
        
    }
    return 0;
}

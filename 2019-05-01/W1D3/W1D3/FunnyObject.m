//
//  FunnyObject.m
//  W1D3
//
//  Created by Jason Liang on 2019-05-01.
//  Copyright © 2019 jasonliang. All rights reserved.
//

#import "FunnyObject.h"

@implementation FunnyObject

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.myCode = @"hey";
//        [self theMostPowerfulMethodTheOutsidersWontSee];
//        [self performSelector:@selector(theMostPowerfulMethodTheOutsidersWontSee) withObject:nil afterDelay:0];
    }
    
    return self;
}

- (void)test {
    self.myCode = @"abc";
}

- (NSString *)myCode {
    NSString *original = [super myCode];
    return [original stringByAppendingString:@"is funny"];
}

@end

//
//  BaseObject.m
//  W1D3
//
//  Created by Jason Liang on 2019-05-01.
//  Copyright © 2019 jasonliang. All rights reserved.
//

#import "BaseObject.h"

@interface BaseObject()

- (void)theMostPowerfulMethodTheOutsidersWontSee;

@end

@implementation BaseObject

- (instancetype)initWithMyCode:(NSString *)myCode
{
    self = [super init];
    if (self) {
        _myCode = myCode;
        self.myCode = myCode;
    }
    return self;
}

- (NSString *)myCode {
    return [_myCode stringByAppendingString:@" "];
}

@end

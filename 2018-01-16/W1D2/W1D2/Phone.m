//
//  Phone.m
//  W1D2
//
//  Created by Jason Liang on 1/16/18.
//  Copyright © 2018 Jaosn Liang. All rights reserved.
//

#import "Phone.h"

@implementation Phone

- (instancetype)init {
    self = [super init];
    if (self) {
        NSLog(@"can only exist if self exsits");

    }
    return self;
}

- (instancetype)initWithModelName:(NSString *)modelName
{
    self = [super init];
    if (self) {
        self.modelName = modelName; //preferred
//        _modelName = modelName;// more efficient
    }
    return self;
}


- (void)printModelName {
    NSLog(@"%@", self.modelName);
}

@end

//
//  main.m
//  W1D2
//
//  Created by Jason Liang on 1/16/18.
//  Copyright © 2018 Jaosn Liang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Phone.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        Phone *phone1 = [[Phone alloc] init];
        phone1.modelName = @"iPhoneX"; //preference
        [phone1 setModelName:@"iPhoneX"]; //consistency
        [phone1 performSelector:@selector(setModelName:) withObject:@"iPhoneX"]; //message based
        NSLog(@"%@", phone1.modelName);
        
//        SEL setModelSelector = @selector(setModelName:);
     
        Phone *phone2 = [[Phone alloc] initWithModelName:@"iPhone8Plus"];
        NSLog(@"%@", phone2.modelName);
        
        NSArray *phones = @[phone1, phone2];
        for (Phone *phone in phones) {
            NSLog(@"phone is %@", phone.modelName);
        }
        
        phones = [phones arrayByAddingObjectsFromArray:@[[[Phone alloc] initWithModelName:@"iPhone8"]]];
        
        for (Phone *phone in phones) {
            NSLog(@"phone is %@", phone.modelName);
        }
        
        NSLog(@"%@", phones);
        
        NSMutableArray *phonesMutable = [[NSMutableArray alloc] initWithArray:phones];
        
        [phonesMutable removeObjectAtIndex:1];
        
        for (Phone *phone in phonesMutable) {
            NSLog(@"phone is %@", phone.modelName);
        }
        
        NSArray *mixedBag = @[phone1, phone2, @1, [NSNumber numberWithBool:YES], @YES];
        NSLog(@"%@", mixedBag);
        for (id item in mixedBag) {
            NSLog(@"%@", item);
        }
        
        
        
    }
    return 0;
}

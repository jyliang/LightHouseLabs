//
//  main.m
//  W1D3
//
//  Created by Jason Liang on 2019-05-01.
//  Copyright © 2019 jasonliang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FunnyObject.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"Hello, World!");
        
        FunnyObject *fo = [[FunnyObject alloc] initWithMyCode:@"Canada’s spring"];
//        fo.myCode = @"Jason";
        NSLog(@"%@", fo.myCode);
        
        //        [NSNull null]; useful
        //        NULL; useless
        //        nil; nil
        
        NSSet *set1 = [NSSet setWithObjects:@"1", @"2", @"1", [NSNumber numberWithInt:1], [NSString stringWithFormat:@"1"], [NSNull null], nil];
        NSLog(@"%@", set1);
        
        id obj = [NSNull null];
        [NSNull isEqual:obj];
        
        NSMutableSet *set2 = [[NSMutableSet alloc] initWithSet:set1];
        [set2 addObject:@"asdfasdf"];
        [set2 removeObject:@"1"];
        
        [set1 allObjects];
        
        NSOrderedSet *orderedSet;
        
        NSLog(@"%@", set2);
        
        [set2 minusSet:set1];
        
        NSLog(@"%@", set2);
        
        
    }
    return 0;
}

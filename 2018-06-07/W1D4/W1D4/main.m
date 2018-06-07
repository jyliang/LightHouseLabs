//
//  main.m
//  W1D4
//
//  Created by Jason Liang on 6/7/18.
//  Copyright © 2018 Jason Liang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TTC.h"
#import "Bus.h"
#import "Subway.h"
#import "StreetCar.h"

int main(int argc, const char * argv[]) {
  @autoreleasepool {
      // insert code here...
      NSLog(@"Hello, World!");
    TTC *ttc = [[TTC alloc] init];
    NSLog(@"%@", ttc.name);
    ttc.name = @"TTC";
    [ttc setName:@"TTC"];
    NSLog(@"%@", ttc.name);
    
    
    
    Bus *bus = [[Bus alloc] init];
    Subway *subway = [[Subway alloc] init];
    StreetCar *streetCar = [[StreetCar alloc] init];
    
    ttc.delegate = bus;

    // this is not very useful:
    if ([bus conformsToProtocol:@protocol(TTCDelegate)]) {}
    
    // Check optional protocol methods, see if it's implemented or not.
    if ([ttc.delegate respondsToSelector:@selector(chargeFare)]) {
      [ttc.delegate chargeFare];
    }
    
    [ttc.delegate drive];
    
    ttc.delegate = subway;
    [ttc.delegate drive];
    
    ttc.delegate = streetCar;
    [ttc.delegate drive];
    
    
    NSDictionary *dictionary = @{@"key1":@"value1", @"key2":@"value2"};
    dictionary = [[NSDictionary alloc] initWithObjectsAndKeys:@"value1", @"key1", @"value2", @"key2", nil];
    
    NSLog(@"%@", [dictionary objectForKey:@"key1"]);
    NSLog(@"%@", [dictionary objectForKey:@"key2"]);
    NSLog(@"%@", [dictionary objectForKey:@"key"]);
    
    NSMutableDictionary *mutableDictionary = [[NSMutableDictionary alloc] initWithDictionary:dictionary];
    [mutableDictionary setObject:@"value3" forKey:@"key3"];
    [mutableDictionary removeObjectForKey:@"key2"];
    
//    mutableDictionary = [@{} mutableCopy];
    
    [mutableDictionary allKeys];
    
    NSLog(@"values in mutabledictionary:");
    for (NSString *key in [mutableDictionary allKeys]) {
      NSLog(@"%@", mutableDictionary[key]);
    }
    
    NSMutableArray *array = [@[] mutableCopy];
    
    array[0] = @"asdf";
    array[array.count] = @"asdf";
    NSLog(@"%@", array);
    
    
    
  }
  return 0;
}

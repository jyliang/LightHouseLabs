//
//  main.m
//  W1D4
//
//  Created by Jason Liang on 8/2/18.
//  Copyright © 2018 jasonliang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Truck.h"
#import "Car.h"
#import "Student.h"
#import "Teacher.h"

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    
    NSDictionary *dictionary = @{@"key1":@"value", @"key2":@"value2"};
    
    NSLog(@"%@", [dictionary objectForKey:@"key1"]);
    NSLog(@"%@", dictionary[@"key1"]);
    
    NSMutableDictionary *mutableDictionary = [[NSMutableDictionary alloc] initWithDictionary:dictionary];
    
    [mutableDictionary setObject:@"value2" forKey:@"key2"];
    mutableDictionary[@"key2"] = @"value2";
    
    for (NSString *key in [dictionary allKeys]) {
      NSLog(@"key: %@, values : %@", key, dictionary[key]);
    }
    
    // Part 2 Protocol:
    Car *car = [[Car alloc] init];
    [car updatePedals];
    
    Student *student = [[Student alloc] init];
    car.driver = student;
    [car updatePedals];
    
    Teacher *teacher = [[Teacher alloc] init];
    car.driver = teacher;
    [car updatePedals];
    
    
    
    
    // Part 1:
    Truck *truck = [[Truck alloc] init];
    
    truck.tires = @[@"snow", @"snow"];
    
    NSLog(@"%@", truck.tires);
    
    
    NSMutableString *brand = [@"Ford" mutableCopy];
    truck.brand = brand;
    NSLog(@"%@", truck.brand);
    brand = nil;
    NSLog(@"%@", truck.brand);
    
    NSArray *tires = @[@"snow"];
    truck.tires = [tires copy];
//    [truck setBrand:brand];
    
    NSLog(@"%@", truck.brand);
    NSLog(@"%@", [truck brand]);
  }
  return 0;
}

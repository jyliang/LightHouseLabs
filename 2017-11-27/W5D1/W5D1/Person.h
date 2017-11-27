//
//  Person.h
//  W5D1
//
//  Created by Jason Liang on 11/27/17.
//  Copyright © 2017 Jason Liang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class Cat;

@interface Person : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy, nullable) NSString *address;
@property (nonatomic, copy, nullable) NSArray<Cat *> *pets;

- (instancetype)initWithName:(NSString *)name address:(NSString * _Nullable)address NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END

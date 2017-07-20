//
//  Person.h
//  W4D4
//
//  Created by Jason Liang on 7/20/17.
//  Copyright © 2017 Jason. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject <NSCoding>

@property(nonatomic, copy) NSString *firstName;
@property(nonatomic, copy) NSString *lastName;
@property(nonatomic, copy) NSNumber *idNumber;

@end

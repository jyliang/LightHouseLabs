//
//  Dog.h
//  W4D5
//
//  Created by Jason Liang on 11/24/17.
//  Copyright © 2017 Jason Liang. All rights reserved.
//

#import <Realm/Realm.h>

@interface Dog : RLMObject
@property NSString *name;
@property NSData   *picture;
@property NSInteger age;
@end

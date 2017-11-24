//
//  Person.h
//  W4D5
//
//  Created by Jason Liang on 11/24/17.
//  Copyright © 2017 Jason Liang. All rights reserved.
//

#import <Realm/Realm.h>
#import "Dog.h"

RLM_ARRAY_TYPE(Dog)
@interface Person : RLMObject
@property NSString             *name;
@property RLMArray<Dog *><Dog> *dogs;
@end

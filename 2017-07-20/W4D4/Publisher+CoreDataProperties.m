//
//  Publisher+CoreDataProperties.m
//  W4D4
//
//  Created by Jason Liang on 7/20/17.
//  Copyright © 2017 Jason. All rights reserved.
//

#import "Publisher+CoreDataProperties.h"

@implementation Publisher (CoreDataProperties)

+ (NSFetchRequest<Publisher *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Publisher"];
}

@dynamic name;
@dynamic books;

@end

//
//  Entity+CoreDataProperties.m
//  W4D3-CoreData
//
//  Created by Jason Liang on 3/29/17.
//  Copyright © 2017 jasonliang. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "Entity+CoreDataProperties.h"

@implementation Entity (CoreDataProperties)

+ (NSFetchRequest<Entity *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Entity"];
}

@dynamic attribute;

@end

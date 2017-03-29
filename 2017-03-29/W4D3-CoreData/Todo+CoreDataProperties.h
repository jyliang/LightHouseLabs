//
//  Todo+CoreDataProperties.h
//  W4D3-CoreData
//
//  Created by Jason Liang on 3/29/17.
//  Copyright © 2017 jasonliang. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "Todo+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Todo (CoreDataProperties)

+ (NSFetchRequest<Todo *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *title;
@property (nullable, nonatomic, copy) NSString *todoDescription;
@property (nonatomic) int16_t priority;
@property (nonatomic) BOOL completed;

@end

NS_ASSUME_NONNULL_END

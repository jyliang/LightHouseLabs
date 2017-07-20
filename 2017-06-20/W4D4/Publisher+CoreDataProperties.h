//
//  Publisher+CoreDataProperties.h
//  W4D4
//
//  Created by Jason Liang on 7/20/17.
//  Copyright © 2017 Jason. All rights reserved.
//

#import "Publisher+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Publisher (CoreDataProperties)

+ (NSFetchRequest<Publisher *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, retain) NSSet<Book *> *books;

@end

@interface Publisher (CoreDataGeneratedAccessors)

- (void)addBooksObject:(Book *)value;
- (void)removeBooksObject:(Book *)value;
- (void)addBooks:(NSSet<Book *> *)values;
- (void)removeBooks:(NSSet<Book *> *)values;

@end

NS_ASSUME_NONNULL_END

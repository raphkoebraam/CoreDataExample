//
//  RSList+CDHelperMethods.h
//  CoreData
//
//  Created by Raphael Silva on 3/12/14.
//  Copyright (c) 2014 Raphael Silva. All rights reserved.
//

#import "RSList.h"

@interface RSList (CDHelperMethods)

+ (NSArray *)allListsInManagedObjectContext:(NSManagedObjectContext *)context;
+ (NSInteger)numberOfListsInManagedObjectContext:(NSManagedObjectContext *)context;
+ (void)createListWithTitle:(NSString *)title inManagedObjectContext:(NSManagedObjectContext *)context;
+ (void)removeListWithTitle:(NSString *)title inManagedObjectContext:(NSManagedObjectContext *)context;

@end

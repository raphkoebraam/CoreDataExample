//
//  RSList+CDHelperMethods.m
//  CoreData
//
//  Created by Raphael Silva on 3/12/14.
//  Copyright (c) 2014 Raphael Silva. All rights reserved.
//

#import "RSList+CDHelperMethods.h"

@implementation RSList (CDHelperMethods)

+ (RSList *)listWithTitle:(NSString *)title inManagedObjectContext:(NSManagedObjectContext *)context
{
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"RSList"];
    request.predicate = [NSPredicate predicateWithFormat:@"title = %@", title];
    
    NSError *error;
    
    NSArray *matches = [context executeFetchRequest:request error:&error];
    
    if (error || !matches || [matches count] > 1) {
        // handle error
    }
    
    return [matches firstObject];
}


+ (void)createListWithTitle:(NSString *)title inManagedObjectContext:(NSManagedObjectContext *)context
{
    RSList *newList = [NSEntityDescription insertNewObjectForEntityForName:@"RSList" inManagedObjectContext:context];
    newList.title = title;
    
    NSError *error;
    if (![context save:&error]) {
        // handle error
    }
}


+ (void)removeListWithTitle:(NSString *)title inManagedObjectContext:(NSManagedObjectContext *)context
{
    RSList *listToBeDeleted = [RSList listWithTitle:title inManagedObjectContext:context];
    [context deleteObject:listToBeDeleted];
    
    NSError *error;
    if (![context save:&error]) {
        // handle error
    }
}


+ (NSArray *)allListsInManagedObjectContext:(NSManagedObjectContext *)context
{
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"RSList"];
    
    NSError *error;
    
    NSArray *matches = [context executeFetchRequest:request error:&error];
    
    return matches;
}


+ (NSInteger)numberOfListsInManagedObjectContext:(NSManagedObjectContext *)context
{
    return [[self allListsInManagedObjectContext:context] count];
}


@end

//
//  RSTask+CDHelperMethods.m
//  CoreData
//
//  Created by Raphael Silva on 3/12/14.
//  Copyright (c) 2014 Raphael Silva. All rights reserved.
//

#import "RSTask+CDHelperMethods.h"

@implementation RSTask (CDHelperMethods)

+ (RSTask *)taskWithTitle:(NSString *)title inList:(RSList *)list inManagedObjectContext:(NSManagedObjectContext *)context
{    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"RSTask"];
    request.predicate = [NSPredicate predicateWithFormat:@"title = %@ AND whichList = %@", title, list.title];
    
    NSError *error;
    
    NSArray *matches = [context executeFetchRequest:request error:&error];
    
    if (error || !matches || [matches count] > 1) {
        // handle error
    }
    
    return [matches firstObject];
}


+ (RSTask *)createTaskWithTitle:(NSString *)title inList:(RSList *)list inManagedObjectContext:(NSManagedObjectContext *)context
{
    RSTask *task = [RSTask taskWithTitle:title inList:list inManagedObjectContext:context];
    
    if (!task) {
        task = [NSEntityDescription insertNewObjectForEntityForName:@"RSTask" inManagedObjectContext:context];
        task.title = title;
        task.whichList = list;
        
        NSError *error;
        
        if (![context save:&error]) {
            NSLog(@"O dado não foi salvo! %s", __PRETTY_FUNCTION__);
            return nil;
        }
    }
    
    return task;
}


+ (void)removeListWithTitle:(NSString *)title inList:(RSList *)list inManagedObjectContext:(NSManagedObjectContext *)context
{
    RSTask *listToBeDeleted = [RSTask taskWithTitle:title inList:list inManagedObjectContext:context];
    [context deleteObject:listToBeDeleted];
    
    NSError *error;
    if (![context save:&error]) {
        // handle error
    }
}


@end

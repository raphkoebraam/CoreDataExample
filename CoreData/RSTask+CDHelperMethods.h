//
//  RSTask+CDHelperMethods.h
//  CoreData
//
//  Created by Raphael Silva on 3/12/14.
//  Copyright (c) 2014 Raphael Silva. All rights reserved.
//

#import "RSTask.h"
#import "RSList.h"

@interface RSTask (CDHelperMethods)

+ (RSTask *)createTaskWithTitle:(NSString *)title inList:(RSList *)list inManagedObjectContext:(NSManagedObjectContext *)context;
+ (void)removeListWithTitle:(NSString *)title inList:(RSList *)list inManagedObjectContext:(NSManagedObjectContext *)context;

@end

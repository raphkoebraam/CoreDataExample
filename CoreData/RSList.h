//
//  RSLists.h
//  CoreData
//
//  Created by Raphael Silva on 3/12/14.
//  Copyright (c) 2014 Raphael Silva. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class RSTask;

@interface RSList : NSManagedObject

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSSet *tasks;
@end

@interface RSList (CoreDataGeneratedAccessors)

- (void)addTasksObject:(RSTask *)value;
- (void)removeTasksObject:(RSTask *)value;
- (void)addTasks:(NSSet *)values;
- (void)removeTasks:(NSSet *)values;

@end

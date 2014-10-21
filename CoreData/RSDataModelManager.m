//
//  RSDataModelManager.m
//  CoreData
//
//  Created by Raphael Silva on 21/10/14.
//  Copyright (c) 2014 Raphael Silva. All rights reserved.
//

#import "RSDataModelManager.h"

@interface RSDataModelManager ()

@property (nonatomic, strong) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, strong) NSManagedObjectContext *mainContext;
@property (nonatomic, strong) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@end


@implementation RSDataModelManager

static RSDataModelManager *coreDataModelInstance = nil;

+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    return [RSDataModelManager sharedDataModel];
}


+ (instancetype)sharedDataModel
{
    if (coreDataModelInstance == nil) {
        coreDataModelInstance = [[super allocWithZone:nil] init];
        
        [coreDataModelInstance mainContext];
    }
    
    return coreDataModelInstance;
}


- (NSString *)modelName
{
    return @"CoreDataModel";
}


- (NSString *)pathToModel
{
    return [[NSBundle mainBundle] pathForResource:[self modelName]
                                           ofType:@"momd"];
}


- (NSString *)storeFilename
{
    return [[self modelName] stringByAppendingPathExtension:@"sqlite"];
}


- (NSString *)pathToLocalStore
{
    return [[self documentsDirectory] stringByAppendingPathComponent:[self storeFilename]];
}


- (NSString *)documentsDirectory
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    return documentsDirectory;
}


- (NSManagedObjectContext *)mainContext
{
    if (_mainContext == nil) {
        _mainContext = [[NSManagedObjectContext alloc] init];
        _mainContext.persistentStoreCoordinator = [self persistentStoreCoordinator];
    }
    
    return _mainContext;
}


- (NSManagedObjectModel *)managedObjectModel
{
    if (_managedObjectModel == nil) {
        NSURL *storeURL = [NSURL fileURLWithPath:[self pathToModel]];
        _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:storeURL];
    }
    
    return _managedObjectModel;
}


- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator == nil) {
        NSLog(@"SQLITE STORE PATH: %@", [self pathToLocalStore]);
        NSURL *storeURL = [NSURL fileURLWithPath:[self pathToLocalStore]];
        NSPersistentStoreCoordinator *psc = [[NSPersistentStoreCoordinator alloc]
                                             initWithManagedObjectModel:[self managedObjectModel]];
        NSDictionary *options = @{NSMigratePersistentStoresAutomaticallyOption: [NSNumber numberWithBool:YES],
                                  NSInferMappingModelAutomaticallyOption: [NSNumber numberWithBool:YES]};

        NSError *e = nil;
        if (![psc addPersistentStoreWithType:NSSQLiteStoreType
                               configuration:nil
                                         URL:storeURL
                                     options:options
                                       error:&e]) {
            NSDictionary *userInfo = [NSDictionary dictionaryWithObject:e forKey:NSUnderlyingErrorKey];
            NSString *reason = @"Could not create persistent store.";
            NSException *exc = [NSException exceptionWithName:NSInternalInconsistencyException
                                                       reason:reason
                                                     userInfo:userInfo];
            @throw exc;
        }
        
        _persistentStoreCoordinator = psc;
    }
    
    return _persistentStoreCoordinator;
}

@end

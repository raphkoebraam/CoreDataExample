//
//  RSTasks.h
//  CoreData
//
//  Created by Raphael Silva on 3/12/14.
//  Copyright (c) 2014 Raphael Silva. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class RSList;

@interface RSTask : NSManagedObject

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) RSList *whichList;

@end

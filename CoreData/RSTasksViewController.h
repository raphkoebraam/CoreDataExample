//
//  RSTasksViewController.h
//  CoreData
//
//  Created by Raphael Silva on 3/13/14.
//  Copyright (c) 2014 Raphael Silva. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RSList+CDHelperMethods.h"

@interface RSTasksViewController : UITableViewController

@property (nonatomic, strong) RSList *currentList;

@end

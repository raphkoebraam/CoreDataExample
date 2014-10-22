//
//  RSNewTaskViewController.m
//  CoreData
//
//  Created by Raphael Silva on 3/13/14.
//  Copyright (c) 2014 Raphael Silva. All rights reserved.
//

#import "RSNewTaskViewController.h"
#import "RSTask+CDHelperMethods.m"
#import "RSDataModelManager.h"

@interface RSNewTaskViewController ()

@property (nonatomic, weak) IBOutlet UITextField *taskNameTextField;

@end

@implementation RSNewTaskViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - IBActions

- (IBAction)saveButton:(id)sender
{
    if (![self.taskNameTextField.text isEqualToString:@""]) {        
        [RSTask createTaskWithTitle:self.taskNameTextField.text
                             inList:self.currentList
             inManagedObjectContext:[[RSDataModelManager sharedDataModel] mainContext]];
        
        [self.navigationController popViewControllerAnimated:YES];
    } else {
        [self alert:@"Insert a name for the task."];
    }
}


- (IBAction)cancelButton:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark - Alert Method

- (void)alert:(NSString *)message
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}

@end

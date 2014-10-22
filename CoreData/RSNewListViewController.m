//
//  RSNewListViewController.m
//  CoreData
//
//  Created by Raphael Silva on 3/12/14.
//  Copyright (c) 2014 Raphael Silva. All rights reserved.
//

#import "RSNewListViewController.h"
#import "RSList+CDHelperMethods.h"
#import "RSDataModelManager.h"

@interface RSNewListViewController ()

@property (nonatomic, weak) IBOutlet UITextField *listNameTextField;

@end

@implementation RSNewListViewController

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
    if (![self.listNameTextField.text isEqualToString:@""]) {
        [RSList createListWithTitle:self.listNameTextField.text inManagedObjectContext:[[RSDataModelManager sharedDataModel] mainContext]];
        [self.navigationController popViewControllerAnimated:YES];
    } else {
        [self alert:@"Insert a name for the to-do list."];
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

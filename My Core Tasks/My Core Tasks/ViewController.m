//
//  ViewController.m
//  My Core Tasks
//
//  Created by Merritt Tidwell on 9/6/14.
//  Copyright (c) 2014 Merritt Tidwell. All rights reserved.
//

#import "ViewController.h"
#import <CoreData/CoreData.h>
@interface ViewController ()
@property(strong) NSManagedObject * savingData;

@end

@implementation ViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// brings NSManagedObject from the app delegate
- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    
    return context;
    
}

- (IBAction)pressMe:(id)sender {
    
    //new box
    NSManagedObjectContext * newContext = [self managedObjectContext];
    
    
    //add AND save stuff to the box
    NSManagedObject *newTodoThing = [NSEntityDescription insertNewObjectForEntityForName:@"ToDo" inManagedObjectContext:newContext];
    
    
    [newTodoThing setValue:self.toDoText.text forKey:@"name"];
    [newTodoThing setValue:self.dateText.text forKey:@"date"];
    
    
    NSError *error = nil;
    // Save the object to persistent store
    if (![newContext save:&error]) {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
    
    self.toDoText.text = @"";
    
[self.navigationController popViewControllerAnimated:YES];}
@end

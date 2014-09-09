//
//  tasksdisplayTVC.m
//  My Core Tasks
//
//  Created by Merritt Tidwell on 9/6/14.
//  Copyright (c) 2014 Merritt Tidwell. All rights reserved.
//

#import "tasksdisplayTVC.h"
#import <CoreData/CoreData.h>
#import "AppDelegate.h"
@interface tasksdisplayTVC ()


@property(strong) NSManagedObject * savingData;

@end

@implementation tasksdisplayTVC



// brings NSManagedObject from the app delegate
- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    
    return context;
    
}
- (void)viewDidLoad {
    
    
    
    
    [super viewDidLoad];
    //[self.tableView reloadData];


    //new box
    NSManagedObjectContext * newContext = [self managedObjectContext];

    
//    //add AND save stuff to the box
//    NSManagedObject *newTodoThing = [NSEntityDescription insertNewObjectForEntityForName:@"ToDo" inManagedObjectContext:newContext];
//    
//    
//    [newTodoThing setValue:@"Clean Room" forKey:@"name"];
//    [newTodoThing setValue:@"Tomorrow" forKey:@"date"];
//   
    
    NSError *error = nil;
    // Save the object to persistent store
    if (![newContext save:&error]) {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
    
    
    NSManagedObjectContext * context = [self managedObjectContext];

    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"ToDo"];
    self.thingsToDo = [[context executeFetchRequest:fetchRequest error:nil] mutableCopy];
    


    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSManagedObjectContext * context = [self managedObjectContext];

    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"ToDo"];
    self.thingsToDo = [[context executeFetchRequest:fetchRequest error:nil] mutableCopy];
    [self.tableView reloadData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return self.thingsToDo.count;
}






- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    // Configure the cell...
    NSManagedObject *device = [self.thingsToDo objectAtIndex:indexPath.row];
    
    
    [cell.textLabel setText:[NSString stringWithFormat:@"%@ %@", [device valueForKey:@"name"], [device valueForKey:@"date"]]];
    
    
    [cell.detailTextLabel setText:[device valueForKey:@"date"]];
    
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)addToDoButton:(id)sender {
}
@end

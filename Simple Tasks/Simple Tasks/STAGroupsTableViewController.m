//
//  STAGroupsTableViewController.m
//  Simple Tasks
//
//  Created by Merritt Tidwell on 7/30/14.
//  Copyright (c) 2014 Merritt Tidwell. All rights reserved.
//

#import "STAGroupsTableViewController.h"
#import "STAItemsTableViewController.h"
#import "STANewGroupViewController.h"
@interface STAGroupsTableViewController ()

@end

@implementation STAGroupsTableViewController

{
    NSMutableArray * groups;
}




- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self)
    {
   
    
        self.tableView.separatorInset = UIEdgeInsetsMake(0,0,0,0);
        
        groups = ([self loadGroupData]) ? [self loadGroupData] : [@[] mutableCopy];
    
        
//        NSMutableArray * loadGroupsArray = [self loadGroupData];
//        if (loadGroupsArray)
//        {
//            groups= loadGroupsArray;
//        }
    }
    
    
    
    
    return self;
}

- (void)viewDidLoad
{
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:(@"cell")];

    
    UIBarButtonItem * addNewGroup =[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewGroupClicked)];
    

    
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    self.navigationItem.rightBarButtonItem = addNewGroup;
}


-(void)addNewGroupClicked

{
 
    STANewGroupViewController * addNewGroupVC =[[STANewGroupViewController alloc]init];
    
    //this allows us to the new group view controller to access to new array via the property//
    
    addNewGroupVC.groups = groups;
    
    
    [self.navigationController presentViewController:addNewGroupVC animated: YES completion:nil];
    
   
    
    
    // save should create a new mutable dictionary and adds it to the groups array
    
    // save & cancel "dismiss" the VC
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//#warning Potentially incomplete method implementation.
//    // Return the number of sections.
//    return 0;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return groups.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = groups[indexPath.row][@"name"];
    
    // Configure the cell...
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath

{
    STAItemsTableViewController * itemsTVC =[[STAItemsTableViewController alloc]init];
    itemsTVC.groupInfo = groups[indexPath.row];
    self.tableView.rowHeight= 80;
    [self.navigationController pushViewController:itemsTVC animated:YES];

}


-(void)viewWillAppear:(BOOL)animated
{
    
    [super viewWillAppear:animated];
    
    NSLog(@"%@",groups);
    
    
    [self.tableView reloadData];

   [ self saveGroupData];
    
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        // Delete the row from the data source
        
        [groups removeObjectAtIndex:indexPath.row];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
  
    }

    [self saveGroupData];

}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)saveGroupData
{
    NSData * groupData = [NSKeyedArchiver archivedDataWithRootObject:groups];
    
    [groupData writeToFile:[self groupFilePath] atomically:YES];
}
-(NSMutableArray *) loadGroupData
{
    return [NSKeyedUnarchiver unarchiveObjectWithFile:[self groupFilePath]];
            

}

-(NSString *)groupFilePath
{
    NSArray * documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString * path = documentDirectories[0];
    
    return [path stringByAppendingPathComponent:@"group.data"];
}

-(BOOL)prefersStatusBarHidden{return YES; }



@end

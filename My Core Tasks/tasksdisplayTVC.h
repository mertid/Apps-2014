//
//  tasksdisplayTVC.h
//  My Core Tasks
//
//  Created by Merritt Tidwell on 9/6/14.
//  Copyright (c) 2014 Merritt Tidwell. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <CoreData/CoreData.h>

@interface tasksdisplayTVC : UITableViewController
- (IBAction)addToDoButton:(id)sender;

@property (nonatomic,strong) NSMutableArray * thingsToDo;
@end

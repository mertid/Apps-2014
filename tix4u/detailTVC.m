//
//  detailTVC.m
//  tix4u
//
//  Created by Merritt Tidwell on 10/6/14.
//  Copyright (c) 2014 Merritt Tidwell. All rights reserved.
//

#import "detailTVC.h"

@interface detailTVC ()

@end

@implementation detailTVC

{
    NSArray * items;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:0.804f green:0.914f blue:0.918f alpha:1.0f];
    self.navigationController.navigationBarHidden = true;

    items = @[@"ayyyy",@"livin"];
    
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return items.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *CellIdentifier = @"cell";


    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];

    // Configure the cell...
    
    cell.textLabel.text = items[indexPath.row];
    
    
    return cell;

}





@end

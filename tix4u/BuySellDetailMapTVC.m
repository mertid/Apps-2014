//
//  BuySellDetailMapTableViewController.m
//  tix4u
//
//  Created by Merritt Tidwell on 10/1/14.
//  Copyright (c) 2014 Merritt Tidwell. All rights reserved.
//

#import "BuySellDetailMapTVC.h"

@interface BuySellDetailMapTVC ()

@end

@implementation BuySellDetailMapTVC
{
    NSArray * items;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    items = @[];
    self.view.backgroundColor = [UIColor colorWithRed:0.804f green:0.914f blue:0.918f alpha:1.0f];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    cell.textLabel.text = items[indexPath.row];
    return cell;
}


@end

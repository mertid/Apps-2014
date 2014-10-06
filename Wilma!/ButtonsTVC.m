//
//  ButtonsTVC.m
//  Wilma!
//
//  Created by Merritt Tidwell on 10/4/14.
//  Copyright (c) 2014 Merritt Tidwell. All rights reserved.
//

#import "ButtonsTVC.h"
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width



@interface ButtonsTVC ()

@end

@implementation ButtonsTVC

{

    NSArray * buttonColors;
    

}


-(void)viewDidAppear:(BOOL)animated

{

    NSIndexPath * indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
 
    UIView * headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320,70)];
    self.tableView.tableHeaderView = headerView;
    headerView.backgroundColor = [UIColor redColor];
    
    buttonColors = [@[[UIColor colorWithRed:0.467f green:0.839f blue:0.141f alpha:1.0f], [UIColor colorWithRed:0.886f green:0.000f blue:0.090f alpha:1.0f], [UIColor colorWithRed:0.980f green:0.953f blue:0.200f alpha:1.0f], [UIColor colorWithRed:0.102f green:0.573f blue:0.847f alpha:1.0f],[UIColor colorWithRed:0.988f green:0.557f blue:0.157f alpha:1.0f],[UIColor colorWithRed:0.749f green:0.384f blue:0.902f alpha:1.0f]]mutableCopy];
    
    
    UILabel * logo = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2 - 80, 15, 160, headerView.frame.size.height/2)];
    logo.text = @"Wilma";
    logo.textAlignment = YES;
    logo.font = [UIFont fontWithName:@"helvetica-light" size:32];
    logo.textColor = [UIColor whiteColor];
    [self.view addSubview:logo];
    

    
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return buttonColors.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"pebbleCell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    cell.backgroundColor = buttonColors [indexPath.row];
    cell.textLabel.text = @"RENE is cool";
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.textAlignment = YES;
    cell.textLabel.font = [UIFont fontWithName:@"Helvetica" size:35];
    
    
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    NSLog(@"button pressed");

}


-(BOOL)prefersStatusBarHidden{
    return YES;
}



@end

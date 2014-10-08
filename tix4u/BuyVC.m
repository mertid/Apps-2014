//
//  BuyVC.m
//  tix4u
//
//  Created by Merritt Tidwell on 10/8/14.
//  Copyright (c) 2014 Merritt Tidwell. All rights reserved.
//

#import "BuyVC.h"
#import <Parse/Parse.h>

@interface BuyVC ()

@end

@implementation BuyVC

- (void)viewDidLoad {
  
    self.view.backgroundColor = [UIColor magentaColor];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

/*
-(void)saveToParseBuy{
    
    PFObject * buyerInfo = [PFObject objectWithClassName:@"Buying"];
    [buyerInfo setObject: selectedTicket forKey:@"NumberOfTicketsBuying"];
    [buyerInfo setObject: selectedEvent forKey:@"Event"];
    [buyerInfo setObject:[PFUser currentUser] forKey:@"BuyerID"];
    
    [buyerInfo saveInBackground];
    NSLog(@"Save to Parse Buyer");
}
*/

@end

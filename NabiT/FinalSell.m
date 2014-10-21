//
//  FinalSell.m
//  NabiT
//
//  Created by Merritt Tidwell on 10/14/14.
//  Copyright (c) 2014 Merritt Tidwell. All rights reserved.
//

#import "FinalSell.h"
#import <Parse/Parse.h>
#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height

@interface FinalSell ()

@end

@implementation FinalSell{
    UIButton * ticketsSold;
    UIButton * removeTicket;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.view.backgroundColor = [UIColor colorWithRed:0.133f green:0.847f blue:0.459f alpha:1.0f];
    
    
    ticketsSold = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/8, SCREEN_HEIGHT/8, 250, 250)];
    ticketsSold.layer.cornerRadius = 250/2;
    ticketsSold.backgroundColor = [UIColor whiteColor];
    [ticketsSold setTitle:@"sold" forState:UIControlStateNormal];
    ticketsSold.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:55];
    [ticketsSold setTitleColor:[UIColor colorWithRed:0.133f green:0.847f blue:0.459f alpha:1.0f] forState:UIControlStateNormal];
    
    
    [self.view addSubview:ticketsSold];
    [ticketsSold addTarget:self action:@selector(ticketsSoldButtonWasPressed) forControlEvents:UIControlEventTouchUpInside];
    
    removeTicket = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/8, SCREEN_HEIGHT/2, 250, 250)];
    removeTicket.backgroundColor = [UIColor colorWithRed:0.114f green:0.694f blue:0.855f alpha:1.0f];
    removeTicket.layer.cornerRadius = 250/2;
    [removeTicket setTitle:@"remove" forState:UIControlStateNormal];
    removeTicket.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:55];
    [self.view addSubview:removeTicket];

    [removeTicket addTarget:self action:@selector(removeTicketButtonWasPressed) forControlEvents:UIControlEventTouchUpInside];
    

    

}
-(void)ticketsSoldButtonWasPressed{
    
    NSLog(@" DELETE button pressed");
    
    [self.finalSeller deleteInBackground];
    
    
    
}

-(void)removeTicketButtonWasPressed
{


    [self.finalSeller deleteInBackground];


}

@end

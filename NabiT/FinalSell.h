//
//  FinalSell.h
//  NabiT
//
//  Created by Merritt Tidwell on 10/14/14.
//  Copyright (c) 2014 Merritt Tidwell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface FinalSell : UIViewController




- (IBAction)ticketsSold:(id)sender;

@property(strong,nonatomic) PFObject * finalSeller;

@end

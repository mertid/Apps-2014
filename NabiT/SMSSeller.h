//
//  SMSSeller.h
//  NabiT
//
//  Created by Merritt Tidwell on 10/14/14.
//  Copyright (c) 2014 Merritt Tidwell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface SMSSeller : UIViewController
@property (strong,nonatomic) PFObject * sellerInfo;
@property (strong, nonatomic) IBOutlet UILabel *sellerNameDetailLabel;
@property (strong, nonatomic) IBOutlet UILabel *numberOfTicketsDetail;
@property (strong, nonatomic) IBOutlet UILabel *sectionDetail;
@property (strong, nonatomic) IBOutlet UILabel *eventDetail;
@property (strong, nonatomic) IBOutlet UILabel *priceLabel;

@end

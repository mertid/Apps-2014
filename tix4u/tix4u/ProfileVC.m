//
//  ProfileVC.m
//  tix4u
//
//  Created by Merritt Tidwell on 10/2/14.
//  Copyright (c) 2014 Merritt Tidwell. All rights reserved.
//

#import "ProfileVC.h"
#import <FacebookSDK/FacebookSDK.h>
#import <Parse/Parse.h>
#import "Constants.h"

@interface ProfileVC ()

@end

@implementation ProfileVC
{
    PFImageView * profileImgView;
    UILabel * ticketsSold;
    UILabel * ticketLabel;
    UILabel * ticketbought;
    UILabel * numberofticketsbought;
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    self.navigationController.navigationBarHidden = true;
    
    profileImgView = [[PFImageView alloc] initWithFrame:CGRectMake(65,50,200,200)];
    profileImgView.layer.cornerRadius = 100;
    profileImgView.clipsToBounds = YES;
    [self.view addSubview:profileImgView];
    
    // Set name button properties and avatar image
    [self setProfileImageFromFile:[[PFUser currentUser] objectForKey:kPAPUserProfilePicSmallKey]];

    ticketLabel = [[UILabel alloc]initWithFrame:CGRectMake(25, 270, 110, 50)];

    ticketLabel.text = @"Ticket's Sold";
    ticketLabel.font = [UIFont fontWithName:@"helvetica-light" size:18];
    
    [self.view addSubview:ticketLabel];
    ticketsSold = [[UILabel alloc]initWithFrame:CGRectMake(35, 280, 150, 150)];
    ticketsSold.text = @"55";
    ticketsSold.textColor = [UIColor redColor];
    ticketsSold.font = [UIFont fontWithName: @"helvetica-light" size:65];
    [self.view addSubview:ticketsSold];
    
    
    ticketbought = [[UILabel alloc]initWithFrame:CGRectMake(170, 270, 140, 50)];
    ticketbought.text = @"Ticket's Bought";
    ticketbought.font = [UIFont fontWithName:@"helvetica-light" size:18];
    [self.view addSubview:ticketbought];
    
    numberofticketsbought = [[UILabel alloc]initWithFrame:CGRectMake(195, 280, 150, 150)];
    numberofticketsbought.text = @"20";
    numberofticketsbought.textColor = [UIColor blueColor];
    numberofticketsbought.font = [UIFont fontWithName:@"helvetica-light" size:65];
    [self.view addSubview:numberofticketsbought];
    


}

- (void)setProfileImageFromFile:(PFFile *)file {
    
    if (!file) {
        return;
    }
    
    profileImgView.image = [UIImage imageNamed:@"AvatarPlaceholder.png"];
    profileImgView.file = file;
    [profileImgView loadInBackground];
}

@end

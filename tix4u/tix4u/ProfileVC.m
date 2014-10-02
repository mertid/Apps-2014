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
    PFImageView* profileImgView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden = true;
    
    profileImgView = [[PFImageView alloc] initWithFrame:CGRectMake(50,50,200,200)];
    [self.view addSubview:profileImgView];
    
    // Set name button properties and avatar image
    [self setProfileImageFromFile:[[PFUser currentUser] objectForKey:kPAPUserProfilePicSmallKey]];
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

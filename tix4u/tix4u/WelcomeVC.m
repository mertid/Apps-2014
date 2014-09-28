//
//  WelcomeVC.m
//  tix4u
//
//  Created by Merritt Tidwell on 9/28/14.
//  Copyright (c) 2014 Merritt Tidwell. All rights reserved.
//

#import "WelcomeVC.h"
#import <Parse/Parse.h>
#import "AppDelegate.h"
#import "LoginVC.h"
#import "Constants.h"
#import <FacebookSDK/FacebookSDK.h>
#import "Utility.h"

@interface WelcomeVC () <PFLogInViewControllerDelegate>

@end

@implementation WelcomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // If not logged in, present login view controller
    if (![PFUser currentUser]) {

        LoginVC *loginVC = [[LoginVC alloc] init];
        [loginVC setDelegate:self];
        loginVC.fields = PFLogInFieldsFacebook;
        loginVC.facebookPermissions = @[ @"user_about_me" ];
        
        [self.navigationController presentViewController:loginVC animated:YES completion:nil];
         
        return;
    }
    // Present Anypic UI
    
    NSLog(@"Ok user is already logged in");
    UIViewController* test = [[UIViewController alloc] init];
    test.view.backgroundColor = [UIColor greenColor];
    [self presentViewController:test animated:YES completion:nil];
    
    // Refresh current user with server side data -- checks if user is still valid and so on
    [[PFUser currentUser] refreshInBackgroundWithTarget:self selector:@selector(refreshCurrentUserCallbackWithResult:error:)];
    
}

- (void)refreshCurrentUserCallbackWithResult:(PFObject *)refreshedObject error:(NSError *)error {
    // A kPFErrorObjectNotFound error on currentUser refresh signals a deleted user
    if (error && error.code == kPFErrorObjectNotFound) {
        NSLog(@"User does not exist - log them out!");
        return;
    }
    
    // Check if user is missing a Facebook ID
    if (![Utility userHasValidFacebookData:[PFUser currentUser]]) {
        
        NSLog(@"Current user is missing their Facebook ID");
        [FBRequestConnection startForMeWithCompletionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
            if (!error) {
                if ([[UIApplication sharedApplication].delegate respondsToSelector:@selector(facebookRequestDidLoad:)]) {
                    [[UIApplication sharedApplication].delegate performSelector:@selector(facebookRequestDidLoad:) withObject:result];
                }
            } else {
                if ([[UIApplication sharedApplication].delegate respondsToSelector:@selector(facebookRequestDidFailWithError:)]) {
                    [[UIApplication sharedApplication].delegate performSelector:@selector(facebookRequestDidFailWithError:) withObject:error];
                }
            }
        }];
    }
}

#pragma mark - PFLogInViewControllerDelegate

-(void)logInViewController:(PFLogInViewController *)logInController didFailToLogInWithError:(NSError *)error
{
    NSLog(@"Uhoh error couldn't login %@", error.userInfo);
}

-(void)logInViewController:(PFLogInViewController *)logInController didLogInUser:(PFUser *)user
{
    // user has logged in - we need to fetch all of their Facebook data before we let them in
    NSString *facebookId = [user objectForKey:kPAPUserFacebookIDKey];
    NSLog(@"Woohohooo logged in usr has facebook id %@", facebookId);
    
    [FBRequestConnection startForMeWithCompletionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
        if (!error) {
            [self facebookRequestDidLoad:result];
        } else {
            [self facebookRequestDidFailWithError:error];
        }
    }];
}

- (void)facebookRequestDidLoad:(id)result {
    // This method is called twice - once for the user's /me profile, and a second time when obtaining their friends. We will try and handle both scenarios in a single method.
    PFUser *user = [PFUser currentUser];
    
    NSArray *data = [result objectForKey:@"data"];
    
    if (!data) {
        
        NSLog(@"ok creating profile");
        
        if (user) {
            NSString *facebookName = result[@"name"];
            if (facebookName && [facebookName length] != 0) {
                [user setObject:facebookName forKey:kPAPUserDisplayNameKey];
            } else {
                [user setObject:@"Someone" forKey:kPAPUserDisplayNameKey];
            }
            
            NSString *facebookId = result[@"id"];
            if (facebookId && [facebookId length] != 0) {
                [user setObject:facebookId forKey:kPAPUserFacebookIDKey];
            }
            
            [user saveEventually];
        }
        
    }
}

- (void)facebookRequestDidFailWithError:(NSError *)error {
    NSLog(@"Facebook error: %@", error);
    
    if ([PFUser currentUser]) {
        if ([[error userInfo][@"error"][@"type"] isEqualToString:@"OAuthException"]) {
            NSLog(@"The Facebook token was invalidated. Need to log out.");
            
        }
    }
}


@end

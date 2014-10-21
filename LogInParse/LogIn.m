//
//  LogIn.m
//  LogInParse
//
//  Created by Merritt Tidwell on 10/13/14.
//  Copyright (c) 2014 Merritt Tidwell. All rights reserved.
//

#import "LogIn.h"
#import <Parse/Parse.h>
@interface LogIn ()

@end

@implementation LogIn

- (void)viewDidLoad {
    [super viewDidLoad];
   // Do any additional setup after loading the view.

    PFUser * user = [PFUser currentUser];
    if (user.username != nil) {
        [self performSegueWithIdentifier:@"login" sender:self];
    }


}


-(void)checkFieldsComplete {
if ([_userNameField.text isEqualToString:@""] || [_passwordField.text isEqualToString:@""] || [_emailField.text isEqualToString:@""] || [_phoneField.text isEqualToString:@""]){
    UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"OOOPSSS" message:@"You Need to Complete All Fields" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
    
    [alert show];
}

else {
    [self checkPasswordsMatch];
}
}
-(void) checkPasswordsMatch{
    if (![_passwordField.text isEqualToString:_reEnterPassword.text]) {
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"OOOPSSS" message:@"Passwords Don't Match" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        
        [alert show];

    }
    else{
        [self registerNewUser];

    }
}

-(void)registerNewUser
{
    PFUser * newUser = [PFUser user];
    newUser.username = _userNameField.text;
    newUser.password = _passwordField.text;
    newUser.email = _emailField.text;
    // how do i register the phone number?
    
    [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            NSLog(@"registration success");
    
        /// this is where the code for the segue for story board should be
        
        }else
        {
            NSLog(@"error registering");
        }
        
        
    }];
    
    

}


- (IBAction)registerButton:(id)sender {

    [self checkFieldsComplete];
    [_emailField resignFirstResponder];
    [_userNameField resignFirstResponder];
    [_reEnterPassword resignFirstResponder];
    [_passwordField resignFirstResponder];
    [_phoneField resignFirstResponder];

}

@end

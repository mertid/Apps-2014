//
//  LogIn.m
//  NabiT
//
//  Created by Merritt Tidwell on 10/13/14.
//  Copyright (c) 2014 Merritt Tidwell. All rights reserved.
//

#import "LogIn.h"
#import  <Parse/Parse.h>
#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height
@interface LogIn ()<UITextFieldDelegate>



@end

@implementation LogIn {

    UITextField * userNameField;
    UITextField * passwordField;
    UITextField * reEnterPasswordField;
    UITextField * phoneNumberField;
    UIButton * registerButton;
}

- (void)viewDidLoad {
   
  
    self.navigationController.navigationBarHidden = true;
    
    self.view.backgroundColor = [UIColor colorWithRed:0.992f green:0.557f blue:0.341f alpha:1.0f];
    
    userNameField = [[UITextField alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/22, SCREEN_HEIGHT/12, SCREEN_WIDTH - 30 , 50)];
    userNameField.layer.cornerRadius = 5;
    userNameField.backgroundColor = [UIColor whiteColor];
    UIColor *color = [UIColor colorWithRed:0.992f green:0.557f blue:0.341f alpha:1.0f];

    userNameField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"  username" attributes:@{NSForegroundColorAttributeName: color}];

    userNameField.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:22];

    userNameField.delegate = self;
    
    [self.view addSubview:userNameField];
    
    
    
    
    [super viewDidLoad];
    
    
    
    passwordField = [[UITextField alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/22, SCREEN_HEIGHT/5.2, SCREEN_WIDTH - 30 , 50)];


    passwordField.backgroundColor = [UIColor whiteColor];
    passwordField.layer.cornerRadius = 5;
    passwordField.delegate= self;
    passwordField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"  password" attributes:@{NSForegroundColorAttributeName: color}];

    passwordField.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:22];

    

    [self.view addSubview:passwordField];
    
    
    reEnterPasswordField = [[UITextField alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/22, SCREEN_HEIGHT/3.3, SCREEN_WIDTH - 30 , 50)];

    reEnterPasswordField.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:22];

    reEnterPasswordField.layer.cornerRadius = 5;
    reEnterPasswordField.backgroundColor =[UIColor whiteColor];
    reEnterPasswordField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"  confirm password" attributes:@{NSForegroundColorAttributeName: color}];
    
    [self.view addSubview:reEnterPasswordField];

    reEnterPasswordField.delegate= self;
    
    phoneNumberField = [[UITextField alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/22, SCREEN_HEIGHT/2.5, SCREEN_WIDTH - 30 , 50)];

    phoneNumberField.layer.cornerRadius = 5;
    phoneNumberField.backgroundColor =[UIColor whiteColor];
    phoneNumberField.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:22];

    phoneNumberField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"  phone number" attributes:@{NSForegroundColorAttributeName: color}];

    
    [self.view addSubview:phoneNumberField];
    [phoneNumberField setKeyboardType:UIKeyboardTypeNumberPad];

    phoneNumberField.delegate = self;
    
    
    registerButton = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/22, SCREEN_HEIGHT/2, SCREEN_WIDTH - 30 , 50)];

    registerButton.backgroundColor =[UIColor clearColor];
    registerButton.layer.borderWidth = 1;
    registerButton.layer.borderColor = [UIColor whiteColor].CGColor;
    registerButton.layer.cornerRadius = 5;
    [registerButton setTitle:@"register" forState:UIControlStateNormal];
    registerButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:22];
    [registerButton addTarget:self action:@selector(registerButtonWasPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registerButton];
    
    
    
    
    
    // Do any additional setup after loading the view.
}

-(void)viewDidAppear:(BOOL)animated
{

    
    PFUser * user = [PFUser currentUser];
    if (user.username != nil) {
        [self performSegueWithIdentifier:@"Login" sender:self];
    }


}

-(void)checkFieldsComplete {
    if ([userNameField.text isEqualToString:@""] || [passwordField.text isEqualToString:@""] || [phoneNumberField.text isEqualToString:@""])
    
    {
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"OOOPSSS" message:@"You Need to Complete All Fields" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        
        [alert show];
    }
    
    else {
        [self checkPasswordsMatch];
    }
}
-(void) checkPasswordsMatch{
    if (![passwordField.text isEqualToString:reEnterPasswordField.text]) {
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
    newUser.username = userNameField.text;
    newUser.password = passwordField.text;
    newUser[@"phone"] = phoneNumberField.text;
    
    
    [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            NSLog(@"registration success");
            
            [self performSegueWithIdentifier:@"Login" sender:self];
           
            
        }else
        {
            NSLog(@"error registering");
        }
        
        
    }];
    
    
    
}


-(void)registerButtonWasPressed{
    [userNameField resignFirstResponder];
    [passwordField resignFirstResponder];
    [reEnterPasswordField resignFirstResponder];
    [phoneNumberField resignFirstResponder];
    [self checkFieldsComplete];
    
    
}

@end

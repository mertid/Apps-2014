//
//  LoginVC.m
//  tix4u
//
//  Created by Merritt Tidwell on 9/28/14.
//  Copyright (c) 2014 Merritt Tidwell. All rights reserved.
//

#import "LoginVC.h"

@interface LoginVC ()

@end

@implementation LoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSString *text = NSLocalizedString(@"Sign up and start sharing your story with your friends.", @"Sign up and start sharing your story with your friends.");
    
    CGSize textSize = [text boundingRectWithSize:CGSizeMake(255.0f, CGFLOAT_MAX)
                                         options:NSStringDrawingUsesLineFragmentOrigin // wordwrap?
                                      attributes:@{NSFontAttributeName:[UIFont fontWithName:@"HelveticaNeue-Medium" size:18.0f]}
                                         context:nil].size;
    
    UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake( ([UIScreen mainScreen].bounds.size.width - textSize.width)/2.0f, 160.0f, textSize.width, textSize.height)];
    [textLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Medium" size:18.0f]];
    [textLabel setLineBreakMode:NSLineBreakByWordWrapping];
    [textLabel setNumberOfLines:0];
    [textLabel setText:text];
    [textLabel setTextColor:[UIColor colorWithRed:214.0f/255.0f green:206.0f/255.0f blue:191.0f/255.0f alpha:1.0f]];
    [textLabel setBackgroundColor:[UIColor clearColor]];
    [textLabel setTextAlignment:NSTextAlignmentCenter];
    
    self.logInView.backgroundColor = [UIColor magentaColor];
    [self.logInView setLogo:nil];
    [self.logInView addSubview:textLabel];
    
    self.fields = PFLogInFieldsUsernameAndPassword;
    self.logInView.usernameField.placeholder = @"Enter your email";
    NSLog(@"presented loginVC now .... ");
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return toInterfaceOrientation == UIInterfaceOrientationPortrait;
}

@end

//
//  BuyvsSell.m
//  NabiT
//
//  Created by Merritt Tidwell on 10/13/14.
//  Copyright (c) 2014 Merritt Tidwell. All rights reserved.
//

#import "BuyvsSell.h"
#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height



@interface BuyvsSell ()

@end

@implementation BuyvsSell
{
    UIButton * buyButton;
    UIButton * sellButton;

}


- (void)viewDidLoad {
    [super viewDidLoad];
     
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];

    
    
    buyButton = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/8, SCREEN_HEIGHT/8, 250, 250)];
    buyButton.layer.cornerRadius = 250/2;
    buyButton.backgroundColor = [UIColor colorWithRed:0.122f green:0.710f blue:0.871f alpha:1.0f];
    [buyButton setTitle:@"buy" forState:UIControlStateNormal];
    buyButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:55];
    

    
    
    [self.view addSubview:buyButton];
    [buyButton addTarget:self action:@selector(buyButtonWasPressed) forControlEvents:UIControlEventTouchUpInside];
    
    sellButton = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/8, SCREEN_HEIGHT/2, 250, 250)];
    sellButton.layer.cornerRadius = 250/2;
    [sellButton setTitle:@"sell" forState:UIControlStateNormal];
     sellButton.backgroundColor = [UIColor colorWithRed:0.161f green:0.839f blue:0.475f alpha:1.0f];
    [self.view addSubview:sellButton];
    sellButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:55];
    
    
    [sellButton addTarget:self action:@selector(sellButtonWasPressed) forControlEvents:UIControlEventTouchUpInside];

    
}



-(void)buyButtonWasPressed
{

    [self performSegueWithIdentifier:@"buy" sender:self];


}

-(void)sellButtonWasPressed{
    
    [self performSegueWithIdentifier:@"sell" sender:self];

    
}

@end

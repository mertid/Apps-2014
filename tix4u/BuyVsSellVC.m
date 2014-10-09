//
//  BuyVsSellVC.m
//  tix4u
//
//  Created by Merritt Tidwell on 10/8/14.
//  Copyright (c) 2014 Merritt Tidwell. All rights reserved.
//

#import "BuyVsSellVC.h"
#import "SellVC.h"
#import "BuyVC.h"

@interface BuyVsSellVC ()

@end

@implementation BuyVsSellVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    UIButton * sellButton = [[UIButton alloc]initWithFrame:(CGRectMake(60, 65, 160, 160))];
    sellButton.backgroundColor = [UIColor clearColor];
    [sellButton setTitle: @"SELL" forState:UIControlStateNormal];
    [sellButton setTitleColor:[UIColor blueColor]
                       forState:UIControlStateNormal];
    sellButton.layer.cornerRadius = 160/2;
    sellButton.layer.borderWidth = 2;
    sellButton.layer.borderColor = [UIColor redColor].CGColor;
    [sellButton addTarget:self action:@selector(sellButtonWasPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:sellButton];
    
    
    UIButton * buyButton = [[UIButton alloc]initWithFrame:(CGRectMake(60, 310, 160, 160))];
    buyButton.backgroundColor = [UIColor clearColor];
    buyButton.layer.cornerRadius = 160/2;
    buyButton.layer.borderColor = [UIColor darkGrayColor].CGColor;
    buyButton.layer.borderWidth = 2;
    
    [buyButton setTitle: @"BUY" forState:UIControlStateNormal];
    [buyButton setTitleColor:[UIColor blueColor]
                       forState:UIControlStateNormal];
    [buyButton addTarget:self action:@selector(buyButtonWasPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buyButton];
    
    
}

-(void)sellButtonWasPressed{
    SellVC * sellVc = [[SellVC alloc]init];
    [self.navigationController presentViewController:sellVc animated:NO completion:nil];
    NSLog(@"sell button pressed");
}



-(void)buyButtonWasPressed{
    
    BuyVC * buyVC = [[BuyVC alloc]init];
    [self.navigationController presentViewController:buyVC animated:NO completion:nil];
    

}

@end

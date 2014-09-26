//
//  ViewController.m
//  CrystalBall
//
//  Created by Merritt Tidwell on 9/20/14.
//  Copyright (c) 2014 Merritt Tidwell. All rights reserved.
//

#import "ViewController.h"
#import "CrystalBall.h"
@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
  
    
    [super viewDidLoad];
  
    self.crystalBall = [[CrystalBall alloc]init];
    
    UIImage * backgroundImage = [UIImage imageNamed:@"background"];

    UIImageView * imageview = [[UIImageView alloc]initWithImage:backgroundImage];
    
    [self.view insertSubview:imageview atIndex:0];
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)buttonPressed {
    
    self.predictionLabel.text = [self.crystalBall randomPrediction];

}
@end

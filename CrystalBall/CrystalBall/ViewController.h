//
//  ViewController.h
//  CrystalBall
//
//  Created by Merritt Tidwell on 9/20/14.
//  Copyright (c) 2014 Merritt Tidwell. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CrystalBall;

@interface ViewController : UIViewController

- (IBAction)buttonPressed;

@property (strong, nonatomic) IBOutlet UILabel *predictionLabel;

@property (strong, nonatomic) CrystalBall * crystalBall;


@end


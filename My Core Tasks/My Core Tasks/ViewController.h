//
//  ViewController.h
//  My Core Tasks
//
//  Created by Merritt Tidwell on 9/6/14.
//  Copyright (c) 2014 Merritt Tidwell. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

- (IBAction)pressMe:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *dateText;

@property (weak, nonatomic) IBOutlet UITextField *toDoText;
@end


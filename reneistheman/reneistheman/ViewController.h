//
//  ViewController.h
//  reneistheman
//
//  Created by Merritt Tidwell on 9/1/14.
//  Copyright (c) 2014 Merritt Tidwell. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

- (IBAction)myButton:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *myLabel;
- (IBAction)yourButton:(UIButton *)sender;



@property (weak, nonatomic) IBOutlet UITextField *myText;
@property (weak, nonatomic) IBOutlet UILabel *myLabel2;
@property (weak, nonatomic) IBOutlet UITextField *textLabel;



@property (nonatomic) NSString * aRandomString;

@end


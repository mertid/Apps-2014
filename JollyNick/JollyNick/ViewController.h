//
//  ViewController.h
//  JollyNick
//
//  Created by Merritt Tidwell on 12/22/14.
//  Copyright (c) 2014 Merritt Tidwell. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, strong) NSArray * santaQuotes;

@property (strong, nonatomic) IBOutlet UILabel *santaLabel;
@property (strong, nonatomic) IBOutlet UIImageView *backgroundImage;


-(void)makeQuote;

@end


//
//  ViewController.m
//  JollyNick
//
//  Created by Merritt Tidwell on 12/22/14.
//  Copyright (c) 2014 Merritt Tidwell. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    self.santaQuotes = [[NSArray alloc]initWithObjects:@"HO,HO,HO",
                        @"I am watching you",
                        @"Leave me some cookies",
                        @"Rudolph needs a carrot",nil];
    

    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)makeQuote{

    int random = arc4random_uniform(self.santaQuotes.count);
    self.santaLabel.text = [self.santaQuotes objectAtIndex:random];

    [UIView animateWithDuration:3.0 animations:^{
        self.santaLabel.alpha = 1;
    }];
    
    
}

# pragma marks - motion events

-(void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event{

    NSLog(@"motion began");
    self.santaLabel.text = nil;
    self.santaLabel.alpha = 0;
}

-(void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event

{
    
    if (motion == UIEventSubtypeMotionShake) {
        [self makeQuote];
       
    }
    NSLog(@"motion ended");
    

}
-(void)motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event{

    NSLog(@"motion canceled");

}

# pragma marks - touch events

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{

    self.santaLabel.text = nil;
    self.santaLabel.alpha = 0;

}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self makeQuote];
}
    
@end

//
//  ViewController.m
//  reneistheman
//
//  Created by Merritt Tidwell on 9/1/14.
//  Copyright (c) 2014 Merritt Tidwell. All rights reserved.
//

#import "ViewController.h"
#import "anotherVCClassViewController.h"

@interface ViewController ()

@end

@implementation ViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.myLabel.textColor = [UIColor blackColor];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (IBAction)myButton:(id)sender {
    
    if (self.myLabel.textColor == [UIColor blackColor]) {
        self.myLabel.textColor = [UIColor redColor];

    }else if(self.myLabel.textColor == [UIColor redColor])
             {
             
                 self.myLabel.textColor = [UIColor greenColor];
             
             
             }else if(self.myLabel.textColor == [UIColor greenColor])
    {
        
        self.myLabel.textColor = [UIColor blackColor];
        
        
    }
    
    
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Make sure your segue name in storyboard is the same as this line
    if ([[segue identifier] isEqualToString:@"theTunnel"])
    {
        self.aRandomString = self.myText.text;
        
        anotherVCClassViewController * moveToTheOtherVC = [[anotherVCClassViewController alloc]init];
        
        moveToTheOtherVC.thatStringfromTheOtherView =self.myText.text;
        
        
        
        
        
        
        
        
        
    }
}
- (IBAction)yourButton:(UIButton *)sender {
    
    //self.myLabel2.text = self.myText.text;
    
    //self.textLabel.text = self.myText.text;
    

    
}
@end

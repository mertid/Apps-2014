//
//  ViewController.m
//  calculatorApp
//
//  Created by Merritt Tidwell on 1/20/15.
//  Copyright (c) 2015 Merritt Tidwell. All rights reserved.
//

#import "ViewController.h"

int Method;
float runningTotal;
int selectedNumber;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}



-(IBAction)btnPressed:(UIButton *)sender{

    
    NSLog(@"button was pressed - %@", sender.titleLabel.text);

    NSString * inputString = sender.titleLabel.text;
    selectedNumber = [inputString intValue];
   
    _numberLabel.text = [NSString stringWithFormat:@"%d", selectedNumber] ;
    
    
    
    

}

- (IBAction)divideButtonPressed:(id)sender {

    if (runningTotal == 0) {
        runningTotal = selectedNumber;
    }else{
        switch (Method) {
            case 1:
                runningTotal = runningTotal / selectedNumber;
                break;
            case 2:
                runningTotal = runningTotal * selectedNumber;
                break;
            case 3:
                runningTotal = runningTotal - selectedNumber;
                break;
            case 4:
                runningTotal = runningTotal + selectedNumber;
                break;
            default:
                break;
                
        }
    }
    
    
    
    Method = 1;
        selectedNumber = 0;


}

- (IBAction)timesButtonPressed:(id)sender {

    
    
    
    if (runningTotal == 0) {
        runningTotal = selectedNumber;
    }else{
        switch (Method) {
            case 1:
                runningTotal = runningTotal / selectedNumber;
                break;
            case 2:
                runningTotal = runningTotal * selectedNumber;
                break;
            case 3:
                runningTotal = runningTotal - selectedNumber;
                break;
            case 4:
                runningTotal = runningTotal + selectedNumber;
                break;
            default:
              break;
        
        }
        }
    
    Method = 2;
    selectedNumber = 0;





}

- (IBAction)subtractButtonPressed:(id)sender {

    
    if (runningTotal == 0) {
        runningTotal = selectedNumber;
    }else{
        switch (Method) {
            case 1:
                runningTotal = runningTotal / selectedNumber;
                break;
            case 2:
                runningTotal = runningTotal * selectedNumber;
                break;
            case 3:
                runningTotal = runningTotal - selectedNumber;
                break;
            case 4:
                runningTotal = runningTotal + selectedNumber;
                break;
            default:
                break;
                
        }
    }
    
    
    Method = 3;
    selectedNumber = 0;

}

- (IBAction)plusButtonPressed:(id)sender {

    if (runningTotal == 0) {
        runningTotal = selectedNumber;
    }else{
        switch (Method) {
            case 1:
                runningTotal = runningTotal / selectedNumber;
                break;
            case 2:
                runningTotal = runningTotal * selectedNumber;
                break;
            case 3:
                runningTotal = runningTotal - selectedNumber;
                break;
            case 4:
                runningTotal = runningTotal + selectedNumber;
                break;
            default:
                break;
                
        }

    }
    
    Method = 4;
    selectedNumber = 0;

}

- (IBAction)equalButtonPressed:(id)sender {


    if (runningTotal == 0) {
        runningTotal = selectedNumber;
    }else{
        switch (Method) {
            case 1:
                runningTotal = runningTotal / selectedNumber;
                break;
            case 2:
                runningTotal = runningTotal * selectedNumber;
                break;
            case 3:
                runningTotal = runningTotal - selectedNumber;
                break;
            case 4:
                runningTotal = runningTotal + selectedNumber;
                break;
            default:
                break;
                
        }

    
    }
    
    Method = 0;
    selectedNumber = 0;
    _numberLabel.text = [NSString stringWithFormat:@"%.1f", runningTotal];


}
- (IBAction)allClearPressed:(id)sender {

    Method = 0;
    runningTotal = 0;
    _numberLabel.text = [NSString stringWithFormat:@"0"];



}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

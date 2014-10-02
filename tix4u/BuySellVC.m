//
//  BuySellViewController.m
//  tix4u
//
//  Created by Merritt Tidwell on 10/1/14.
//  Copyright (c) 2014 Merritt Tidwell. All rights reserved.
//

#import "BuySellVC.h"
#import "MapVC.h"

@interface BuySellVC()
{

    NSArray * _ticketData;

    NSArray * _rateData;
    
    NSArray * _eventData;
    
    
}
@end

@implementation BuySellVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIButton * sellButton = [[UIButton alloc]initWithFrame:(CGRectMake(20, 85, 130, 60))];
    sellButton.backgroundColor = [UIColor clearColor];
    [sellButton setTitle: @"SELL" forState:UIControlStateNormal];
    
    sellButton.layer.cornerRadius = 20;
    sellButton.layer.borderWidth = 2;
    sellButton.layer.borderColor = [UIColor redColor].CGColor;
    [sellButton addTarget:self action:@selector(sellButtonWasPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:sellButton];
    
    UIButton * buyButton = [[UIButton alloc]initWithFrame:(CGRectMake(170, 85, 130, 60))];
    buyButton.backgroundColor = [UIColor clearColor];
    buyButton.layer.cornerRadius = 20;
    buyButton.layer.borderColor = [UIColor darkGrayColor].CGColor;
    buyButton.layer.borderWidth = 2;
    [buyButton setTitle: @"BUY" forState:UIControlStateNormal];

    [buyButton addTarget:self action:@selector(buyButtonWasPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buyButton];


    self.ticketPicker = [[UIPickerView alloc]initWithFrame:(CGRectMake(55, 175, 50, 50))];
    self.ticketPicker.showsSelectionIndicator = YES;
//    [self.view addSubview:self.ticketPicker];
    _ticketData = @[@"Tickets",@"1", @"2", @"3", @"4", @"5", @"6", @"7" , @"8"];
    self.ticketPicker.delegate = self;
    self.ticketPicker.dataSource = self;
    self.ticketPicker.tag = 0;
    
   
    self.ratePicker = [[UIPickerView alloc]initWithFrame:CGRectMake(215, 175, 50, 50)];
   self.ratePicker.showsSelectionIndicator = YES;
//    [self.view addSubview:self.ratePicker];
    _rateData = @[@"Rating",@"1", @"2", @"3", @"4", @"5"];
    self.ratePicker.delegate = self;
    self.ratePicker.dataSource = self;
    self.ratePicker.tag = 1;
  
    self.eventPicker = [[UIPickerView alloc]initWithFrame:CGRectMake(60, 300, 200, 50)];
    self.eventPicker.showsSelectionIndicator = YES;
//    [self.view addSubview:self.eventPicker];
    self.eventPicker.delegate = self;
    self.eventPicker.dataSource = self;
    self.eventPicker.tag = 2;
    
    _eventData = @[@"Places",@"your moms party", @"your dad's house"];
    
    
                        
   
    
    
    
    
    // Do any additional setup after loading the view.


    

}

-(void)sellButtonWasPressed{
    
    NSLog(@"sell button was pressed");
    [self.view addSubview:self.ticketPicker];
    [self.view addSubview:self.ratePicker];
    [self.view addSubview:self.eventPicker];
}

-(void)buyButtonWasPressed {

    [self.view addSubview:self.ticketPicker];
    [self.view addSubview:self.ratePicker];
    [self.view addSubview:self.eventPicker];

    
    NSLog(@"buy button was pressed");

}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{

    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    switch (pickerView.tag) {
        case 0:
            
            return _ticketData.count;
            break;
            
        case 1:
            
            return _rateData.count;
            break;
            
        case 2:
            
            return _eventData.count;
            break;
            
        default:
            break;
    }
    
    return 0;

}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component

{
    switch (pickerView.tag) {
        case 0:
            
            return _ticketData[row];
            break;
            
        case 1:
            
            return _rateData[row];
            break;
            
        case 2:
            
            return _eventData[row];
            break;
            
        default:
            break;
    }
    
    return @"";
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{


    //NSLog(@"buttons were selected");
    
   // NSLog(@"%d",(int)[self.ticketPicker selectedRowInComponent:0]);
  //  NSLog(@"%d",(int)[self.ratePicker selectedRowInComponent:0]);
   // NSLog(@"%d",(int)[self.eventPicker selectedRowInComponent:0]);

    if(([self.ticketPicker selectedRowInComponent:0] && [self.ratePicker selectedRowInComponent:0] && [self.eventPicker selectedRowInComponent:0]) > 0) {
    
        MapVC * mapVC = [[MapVC alloc]init];
        mapVC.view.backgroundColor = [UIColor clearColor];
        [self presentViewController: mapVC animated:YES completion:nil];

        
        
        
    }
    
}







@end

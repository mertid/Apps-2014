//
//  BuySellViewController.m
//  tix4u
//
//  Created by Merritt Tidwell on 10/1/14.
//  Copyright (c) 2014 Merritt Tidwell. All rights reserved.
//

#import "BuySellVC.h"
#import "MapVC.h"
#import <Parse/Parse.h>
@interface BuySellVC () <UITextFieldDelegate>
{

    NSArray * _numberOfTicket;

    NSArray * _row;
    
    NSArray * _section;
    
    NSDate * _eventDate;
    NSArray * _eventName;
    NSString * selectedTicket;
    NSString * selectedRow;
    NSString * selectedEvent;
    
}
@end

@implementation BuySellVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden = true;
    
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
    _numberOfTicket = @[@"1",@"2"];
    self.ticketPicker.delegate = self;
    self.ticketPicker.dataSource = self;
    self.ticketPicker.tag = 0;
    
   
    self.ratePicker = [[UIPickerView alloc]initWithFrame:CGRectMake(215, 175, 50, 50)];
   self.ratePicker.showsSelectionIndicator = YES;
//    [self.view addSubview:self.ratePicker];
    _section= @[@"1", @"3"];
    self.ratePicker.delegate = self;
    self.ratePicker.dataSource = self;
    self.ratePicker.tag = 1;
  
    self.eventPicker = [[UIPickerView alloc]initWithFrame:CGRectMake(60, 300, 200, 50)];
    self.eventPicker.showsSelectionIndicator = YES;
//    [self.view addSubview:self.eventPicker];
    self.eventPicker.delegate = self;
    self.eventPicker.dataSource = self;
    self.eventPicker.tag = 2;
    
    _eventName = @[@"other", @"another place", @"other", @"this one produce something"];
    

    
}

-(void)sellButtonWasPressed{
    
    NSLog(@"sell button was pressed");
    [self.view addSubview:self.ticketPicker];
    [self.view addSubview:self.ratePicker];
    [self.view addSubview:self.eventPicker];
}

-(void)buyButtonWasPressed {

//    [self.view addSubview:self.ticketPicker];
//    [self.view addSubview:self.ratePicker];
//    [self.view addSubview:self.eventPicker];

    
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
            
            return  _numberOfTicket.count;
            break;
            
        case 1:
            
            return   _section.count;
            break;
            
        case 2:
            
            return  _eventName.count;
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
            
            return  _eventName[row];
            break;
            
        case 1:
            
            return _section[row];
            break;
            
        case 2:
            
            return _eventName[row];
            break;
            
        default:
            break;
    }
    
    return @"";
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    NSLog(@"%d",pickerView.tag);
    switch (pickerView.tag) {
        case 0:
            
      selectedTicket =  _numberOfTicket[row];
           break;
            
        case 1:
            
         selectedRow = _section[row];
            break;
            
        case 2:
            
           selectedEvent = _eventName[row];
            NSLog(@"%@", selectedEvent);
            
            break;
            
        default:
            break;
    }
    
    if ([self.eventPicker selectedRowInComponent:0] == 3)
       {
           [self showTextField];
       }
else if (([self.ticketPicker selectedRowInComponent:0] && [self.ratePicker selectedRowInComponent:0] && [self.eventPicker selectedRowInComponent:0]) > 0)
    {
        NSLog(@"self ticker running");
        MapVC * mapVC = [[MapVC alloc]init];
        mapVC.view.backgroundColor = [UIColor clearColor];
        
        [self presentViewController: mapVC animated:YES completion:nil];

        [self saveToParseSell];
       
    }
    

}



-(void)saveToParseSell
{
   
    
    PFObject * sellerInfo = [PFObject objectWithClassName:@"Selling"];
    [sellerInfo setObject: selectedTicket forKey:@"NumberOfTicketsSelling"];
    [sellerInfo setObject: selectedEvent forKey:@"Event"];
    [sellerInfo setObject: selectedRow forKey:@"Row"];
    
  //    [sellerInfo setObject:_row forKey:@"Row"];
    // [sellerInfo setObject:_eventDate forKey:@"Date"];
    NSLog(@"save to parseseller");
    
    [sellerInfo setObject:[PFUser currentUser].objectId forKey:@"SellerID"];
    
    [sellerInfo saveInBackground];

}

-(void)saveToParseBuy{
 
    PFObject * buyerInfo = [PFObject objectWithClassName:@"Buying"];
    [buyerInfo setObject: selectedTicket forKey:@"NumberOfTicketsBuying"];
    [buyerInfo setObject: selectedEvent forKey:@"Event"];
    [buyerInfo setObject:[PFUser currentUser] forKey:@"BuyerID"];

    [buyerInfo saveInBackground];
    NSLog(@"Save to Parse Buyer");
}

-(void)showTextField
{
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(10, 200, 300, 40)];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.font = [UIFont systemFontOfSize:15];
    textField.placeholder = @"other Venue";
    textField.autocorrectionType = UITextAutocorrectionTypeNo;
    textField.keyboardType = UIKeyboardTypeDefault;
    textField.returnKeyType = UIReturnKeyDone;
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    textField.delegate = self;

    [self.view addSubview:textField];


}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}


@end

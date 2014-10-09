//
//  BuyVC.m
//  tix4u
//
//  Created by Merritt Tidwell on 10/8/14.
//  Copyright (c) 2014 Merritt Tidwell. All rights reserved.
//

#import "BuyVC.h"
#import <Parse/Parse.h>
#import "MapVC.h"

@interface BuyVC () <UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate>

@end

@implementation BuyVC
{
    NSArray * _numberOfTicket;
    NSArray * _eventName;
    NSString * selectedTicket;
    NSString * selectedEvent;


}

- (void)viewDidLoad {
  
    self.view.backgroundColor = [UIColor whiteColor];
 
    //cancel Button
    
    UIButton * cancelButton = [[UIButton alloc]initWithFrame:(CGRectMake(35, 40, 30, 30))];
    cancelButton.backgroundColor = [UIColor redColor];
    [cancelButton addTarget:self action:@selector(cancelButtonWasPressed) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:cancelButton];
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //Ticket Picker
    self.ticketPicker = [[UIPickerView alloc]initWithFrame:(CGRectMake(120, 55, 50, 50))];
    self.ticketPicker.showsSelectionIndicator = YES;
    _numberOfTicket = @[@"1",@"2",@"3",@"4"];
    self.ticketPicker.delegate = self;
    self.ticketPicker.dataSource = self;
    self.ticketPicker.tag = 0;
    [self.view addSubview:self.ticketPicker];
    
    //Ticket Label
    
    UILabel * ticketLabel = [[UILabel alloc]initWithFrame:CGRectMake(110, 55, 100, 60)];
    ticketLabel.text = @"Tickets";
    ticketLabel.textColor = [UIColor redColor];
    ticketLabel.font = [UIFont fontWithName:@"Helvetica" size:28];
    [self.view addSubview:ticketLabel];
    
    //Event Picker
    
    self.eventPicker = [[UIPickerView alloc]initWithFrame:CGRectMake(60, 350, 200, 50)];
    self.eventPicker.showsSelectionIndicator = YES;
    _eventName = @[@"other", @"another place", @"other", @"this one produce something"];
    
    self.eventPicker.delegate = self;
    self.eventPicker.dataSource = self;
    self.eventPicker.tag = 1;
    [self.view addSubview:self.eventPicker];
    
    //Event Label
    UILabel * eventLabel = [[UILabel alloc]initWithFrame:CGRectMake(70, 370, 200, 50)];
    eventLabel.text = @"Choose Your Event";
    eventLabel.textColor = [UIColor redColor];
    [self.view addSubview:eventLabel];
    
}
#pragma mark - UIPickerView Delegate
    
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}


-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    switch (pickerView.tag) {
        case 0:
            
            return   _numberOfTicket.count;
            break;
            
        case 1:
            
            return   _eventName.count;
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
            
            return  _numberOfTicket[row];
            break;
            
        case 1:
            
            return _eventName[row];
            break;
            
            
        default:
            break;
    }
    
    return @"";
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    NSLog(@"%d", (int)pickerView.tag);
    switch (pickerView.tag) {
        case 0:
            
            selectedTicket =  _numberOfTicket[row];
            break;
            
        case 1:
            
            selectedEvent = _eventName[row];
            break;
            
            
        default:
            break;
    }
    
        if ([self.eventPicker selectedRowInComponent:0] == 3)
        {
            [self showTextField];
        }
        else if (([self.ticketPicker selectedRowInComponent:0] && [self.eventPicker selectedRowInComponent:0] && [self.eventPicker selectedRowInComponent:0]) > 0)
        {
            NSLog(@"self ticker running");
            MapVC * mapVC = [[MapVC alloc]init];
            mapVC.view.backgroundColor = [UIColor clearColor];
            [self presentViewController: mapVC animated:YES completion:nil];
            [self saveToParseBuy];
            
        }
        
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
#pragma mark - TextField Delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}



-(void)saveToParseBuy{
    
    PFObject * buyerInfo = [PFObject objectWithClassName:@"Buying"];
    [buyerInfo setObject: selectedTicket forKey:@"NumberOfTicketsBuying"];
    [buyerInfo setObject: selectedEvent forKey:@"Event"];
    [buyerInfo setObject:[PFUser currentUser] forKey:@"BuyerID"];
    [buyerInfo saveInBackground];
    NSLog(@"Save to Parse Buyer");
}


-(void)cancelButtonWasPressed{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end

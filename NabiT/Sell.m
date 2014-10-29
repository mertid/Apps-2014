//
//  Sell.m
//  NabiT
//
//  Created by Merritt Tidwell on 10/13/14.
//  Copyright (c) 2014 Merritt Tidwell. All rights reserved.
//

#import "Sell.h"
#import <Parse/Parse.h>
#import "FinalSell.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "FinalSell.h"
#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height

@interface Sell () <UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate,CLLocationManagerDelegate>

@property (strong,nonatomic) NSString * selectedTicket;
@property(strong,nonatomic) NSString * selectedEvent;
@property(strong, nonatomic) NSString * selectedPrice;
@property(strong, nonatomic) NSString * sectionText;


@end

@implementation Sell


{

    NSArray * _numberOfTicket;
    NSArray * _eventNames;
    NSArray * _rangeOfPrices;
    CLLocationManager * locationManager;
    CLLocation *currentLocation;
    PFObject * TicketsForSale;
    UIButton * listTicketsButton;
    UILabel * sellLabel;
    
    UITextField * sectionDetailText;
    UITextField *  eventTextLabel;

    UIPickerView * priceRangePicker;
    UIPickerView * numberofTicketsPicker;
    
    
    UILabel * ticketCountLabel;
    UILabel * priceRangeLabel;
  
    
    UIView * whiteView;
}


- (void)viewDidLoad {
    [super viewDidLoad];

    
    [self.navigationController.navigationBar setTranslucent:YES];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.view.backgroundColor = [UIColor clearColor];
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [[UIImage alloc] init];
    self.navigationController.navigationBar.backgroundColor = [UIColor clearColor];
    
    UIColor *color = [UIColor colorWithRed:0.153f green:0.812f blue:0.459f alpha:1.0f];

    
    self.view.backgroundColor = [UIColor colorWithRed:0.153f green:0.812f blue:0.459f alpha:1.0f];
 
    
    float w = self.view.bounds.size.width;
    float h = self.view.bounds.size.height;
    
    whiteView = [[UIView alloc]initWithFrame:CGRectMake(0, (h/2), w, (h/2))];
    whiteView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:whiteView];
    
    sellLabel = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2.7, SCREEN_HEIGHT/8,100, 60)];
    sellLabel.text = @"sell";
    sellLabel.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:65];
    sellLabel.textColor = [UIColor whiteColor];
    [self.view addSubview:sellLabel];
   
    listTicketsButton = [[UIButton alloc]initWithFrame:CGRectMake((SCREEN_WIDTH/20) , SCREEN_HEIGHT-60, (SCREEN_WIDTH)-35, 50)];
    listTicketsButton.backgroundColor = [UIColor colorWithRed:0.153f green:0.812f blue:0.459f alpha:1.0f];
    listTicketsButton.layer.cornerRadius = 8;
    [self.view addSubview:listTicketsButton];
    [listTicketsButton setTitle:@"list tickets" forState:UIControlStateNormal];
    
    [listTicketsButton addTarget:self action:@selector(listTicketButtonWasPressed)
                forControlEvents:UIControlEventTouchUpInside];
    listTicketsButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:30];

    eventTextLabel = [[UITextField alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/14, SCREEN_HEIGHT/3.2, SCREEN_WIDTH - 40, 40)];
    eventTextLabel.backgroundColor = [UIColor whiteColor];
    eventTextLabel.layer.cornerRadius = 8;
    eventTextLabel.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"  event" attributes:@{NSForegroundColorAttributeName: color}];

    eventTextLabel.placeholder = @"  event";
    eventTextLabel.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:22];

    
    
    
    [self.view addSubview:eventTextLabel];
    
    sectionDetailText = [[UITextField alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/14, SCREEN_HEIGHT/2.5, SCREEN_WIDTH-40, 40)];
    sectionDetailText.backgroundColor = [UIColor whiteColor];
    sectionDetailText.layer.cornerRadius = 8;
    sectionDetailText.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"  section" attributes:@{NSForegroundColorAttributeName: color}];
    sectionDetailText.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:22];

    
    [self.view addSubview:sectionDetailText];
    
    
    
    
    

    locationManager = [[CLLocationManager alloc]init];
    locationManager.delegate = self;
    locationManager.distanceFilter = kCLDistanceFilterNone; // whenever we move
    locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters; // 100 m
    
    [locationManager requestWhenInUseAuthorization];
    [locationManager startUpdatingLocation];

    //[self currentLocation];
    //NSLog(@"%@", [self currentLocation]);

    
 // Number of Ticket Picker
    
    numberofTicketsPicker = [[UIPickerView alloc]initWithFrame:CGRectMake((SCREEN_WIDTH/40)-30, SCREEN_HEIGHT/1.8, 200, 200)];
    
    [self.view addSubview:numberofTicketsPicker];
    
    numberofTicketsPicker.delegate = self;
    numberofTicketsPicker.dataSource = self;
    numberofTicketsPicker.tag = 0;
    _numberOfTicket = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8"];
    
// Event Picker
    
    
    
    
    
// Price Picker
    
    priceRangePicker = [[UIPickerView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2.5, SCREEN_HEIGHT/1.8, 200, 200)];
    
    [self.view addSubview:priceRangePicker];
    priceRangePicker.delegate = self;
    priceRangePicker.dataSource = self;
    priceRangePicker.tag = 1;
    _rangeOfPrices = @[@"0-25", @"25-50", @"50-75", @"75-100", @"100-125", @"125 plus"];


    sectionDetailText.delegate = self;
    eventTextLabel.delegate = self;
 
    
    priceRangeLabel = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/1.8, SCREEN_HEIGHT/2.2, 200, 200)];
    priceRangeLabel.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:30];
    priceRangeLabel.text = @"price range";
    [self.view addSubview:priceRangeLabel];
    
   
    
    ticketCountLabel = [[UILabel alloc]initWithFrame:CGRectMake((SCREEN_WIDTH/40), SCREEN_HEIGHT/2.2, 200, 200)];
    ticketCountLabel.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:30];
    ticketCountLabel.text = @"ticket count";
    [self.view addSubview:ticketCountLabel];
    
    
    
    
    
    
    
}
- (NSString *)currentLocation {
    return [NSString stringWithFormat:@"latitude: %f longitude: %f", locationManager.location.coordinate.latitude, locationManager.location.coordinate.longitude];
    

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
            return _rangeOfPrices.count;
            break;
        
        default:
            break;
            
   }

    
    return 1;

}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    switch (pickerView.tag) {
        case 0:
            
            return  _numberOfTicket[row];
            break;
            
        case 1:
            return _rangeOfPrices[row];
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
            
            self.selectedTicket =  _numberOfTicket[row];
            break;
       
            
        case 1:
            self.selectedPrice = _rangeOfPrices[row];
            break;
            default:
            break;
    }
}

-(void)saveToParseSell
{

    long row = [numberofTicketsPicker selectedRowInComponent:0];
    long row2 = [priceRangePicker selectedRowInComponent:0];
    NSLog(@"Selected Ticket %@",[_numberOfTicket objectAtIndex:row]);
 
    
     TicketsForSale = [PFObject objectWithClassName:@"TicketsForSale"];
    [TicketsForSale setObject: [_numberOfTicket objectAtIndex:row] forKey: @"NumberOfTicketsSelling"];
    [TicketsForSale setObject:[_rangeOfPrices objectAtIndex:row2] forKey:@"PriceForTicket"];
    [TicketsForSale setObject:[PFUser currentUser] forKey:@"SellerID"];
    [TicketsForSale setObject:[PFUser currentUser] forKey:@"Username"];
    [TicketsForSale setObject:eventTextLabel.text forKey:@"Event"];
    [TicketsForSale setObject:sectionDetailText.text forKey:@"Section"];
    
    NSLog(@"%@",TicketsForSale);
    
    [PFGeoPoint geoPointForCurrentLocationInBackground:^(PFGeoPoint *geoPoint, NSError *error) {
        if (!error) {
            //        PFGeoPoint *geoPoint = [PFGeoPoint geoPointWithLatitude:currentLocation.coordinate.latitude longitude:currentLocation.coordinate.longitude];
            
            [TicketsForSale setObject:geoPoint forKey:@"Location"];
            
            [TicketsForSale saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                if (succeeded) {
                    NSLog(@"Successfully saved tickets!");
                } else {
                    NSLog(@"Couldn't save sellers tickets!");
                }
                
                if (error != nil) {
                    NSLog(@"An error occurred %@", error.userInfo);
                }
            }];
            
            
        }
    }];

    
 
}

-(void)listTicketButtonWasPressed
{
    [self saveToParseSell];
    
    FinalSell * finalsellVC = [[FinalSell alloc]init];

    finalsellVC.finalSeller = TicketsForSale;
    [self presentViewController:finalsellVC animated:NO completion:nil];

    
    
}




- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    [sectionDetailText resignFirstResponder];
   
    [eventTextLabel resignFirstResponder];
    return YES;
}
- (IBAction)backButton:(id)sender {
 
    
    [self dismissViewControllerAnimated:YES completion:nil];


}


@end

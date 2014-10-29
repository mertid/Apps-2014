//
//  buildAVenueVC.m
//  spot1
//
//  Created by Merritt Tidwell on 10/28/14.
//  Copyright (c) 2014 Merritt Tidwell. All rights reserved.
//

#import "buildAVenueVC.h"
#import <Parse/Parse.h>
#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface buildAVenueVC () <UITextFieldDelegate,CLLocationManagerDelegate>

@end

@implementation buildAVenueVC  {


    UITextField * tailgateName;
    PFObject * venueInfo;
    UIButton * createVenue;
    CLLocationManager * locationManager;
    


}

- (void)viewDidLoad {
    [super viewDidLoad];
  
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    tailgateName = [[UITextField alloc]initWithFrame:CGRectMake(80, 100, 150, 45)];
    tailgateName.delegate = self;
    tailgateName.placeholder = @"name your tailgate";
    [self.view addSubview:tailgateName];
    
    createVenue = [[UIButton alloc]initWithFrame:CGRectMake(80, 250, 150, 45)];
    createVenue.backgroundColor = [UIColor blackColor];
    [createVenue setTitle:@"Create a Spot" forState:UIControlStateNormal];
    [self.view addSubview:createVenue];
    [createVenue addTarget:self action:@selector(createVenueButtonWasPressed) forControlEvents:UIControlEventTouchUpInside];
    
    
    locationManager = [[CLLocationManager alloc]init];
    locationManager.delegate = self;
    locationManager.distanceFilter = kCLDistanceFilterNone; // whenever we move
    locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters; // 100 m
    
    [locationManager requestWhenInUseAuthorization];
    [locationManager startUpdatingLocation];

    
}
-(void)createVenueButtonWasPressed{

    [self saveToParse];

   
    ViewController *viewController = [[ViewController alloc] init];
    [self presentViewController:viewController animated:YES completion:nil];
    

    
    

}


-(void)saveToParse{
    
   
    NSLog(@"button was pressed");
    
    venueInfo = [PFObject objectWithClassName:@"VenueDetails"];
    [venueInfo setObject:tailgateName.text forKey:@"TailgateName"];

    
    
    [PFGeoPoint geoPointForCurrentLocationInBackground:^(PFGeoPoint *geoPoint, NSError *error) {
        if (!error) {
            //        PFGeoPoint *geoPoint = [PFGeoPoint geoPointWithLatitude:currentLocation.coordinate.latitude longitude:currentLocation.coordinate.longitude];
            
            [venueInfo setObject:geoPoint forKey:@"VenueLocation"];
            
            [venueInfo saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                if (succeeded) {
                    NSLog(@"Successfully saved Venue Location!");
                } else {
                    NSLog(@"Couldn't save Venue Location!");
                }
                
                if (error != nil) {
                    NSLog(@"An error occurred %@", error.userInfo);
                }
            }];
           
            
            
            
            
            
            
        }
    }];
    
    
    
    
}



@end

//
//  MapViewController.m
//  tix4u
//
//  Created by Merritt Tidwell on 10/1/14.
//  Copyright (c) 2014 Merritt Tidwell. All rights reserved.
//

#import "MapVC.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import <Parse/Parse.h>
#import "detailTVC.h"
@interface MapVC() <MKMapViewDelegate, CLLocationManagerDelegate>

@end

@implementation MapVC
{
    MKMapView * myMapView;
    detailTVC * tableVC;
    CLLocationManager * locationManager;
}

- (void)viewDidLoad {
 
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = true;


    myMapView = [[MKMapView alloc] initWithFrame:CGRectMake(0, 0, 320, 280)];
    myMapView.delegate = self;
    [self.view addSubview:myMapView];
    myMapView.showsUserLocation = YES;
    myMapView.delegate = self;
    
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    [locationManager startUpdatingLocation];
    
    
    }

-(void)viewWillAppear:(BOOL)animated
{
    
    tableVC = [[detailTVC alloc]init];

    
    tableVC.tableView.frame = CGRectMake(0, 260, 320, 300);
    
    tableVC.tableView.backgroundColor = [UIColor whiteColor];
    
    [tableVC.tableView setSeparatorColor:[UIColor colorWithRed:0.000f green:0.651f blue:0.910f alpha:1.0f]];
    
    [self.view addSubview:tableVC.tableView];
    
    
    //ask heidi for help!
    
  //  PFQuery *query = [PFQuery queryWithClassName:@"Selling"];
    
    
   
}




@end

//
//  ViewController.m
//  Mapple
//
//  Created by Merritt Tidwell on 8/28/14.
//  Copyright (c) 2014 Merritt Tidwell. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController () <CLLocationManagerDelegate, MKMapViewDelegate>

@end

@implementation ViewController
{
    MKMapView * mapView;
    CLLocationManager * locationManager;
    

}
            
- (void)viewDidLoad {
   
    
    [super viewDidLoad];
  
    mapView = [[MKMapView alloc]initWithFrame:CGRectMake(0, 0, 320, [UIScreen mainScreen].bounds.size.height/2.0)];
    
    mapView.showsUserLocation = YES;
    mapView.delegate = self;
    mapView.userTrackingMode = YES;
    [self.view addSubview:mapView];
    
    locationManager = [[CLLocationManager alloc]init];
    locationManager.delegate = self;
    [locationManager startUpdatingLocation];
    [locationManager requestAlwaysAuthorization];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations

{
    for (CLLocation * location in locations)  {
       
        MKCoordinateRegion region = MKCoordinateRegionMake(location.coordinate, <#MKCoordinateSpan span#>)


}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

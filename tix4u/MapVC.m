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
#import "Annotation.h"

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

  //  self.navigationController.navigationBarHidden = true;
 
    
    myMapView = [[MKMapView alloc] initWithFrame:CGRectMake(0, 0, 320, 280)];
    myMapView.delegate = self;
    [self.view addSubview:myMapView];
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
   [locationManager requestWhenInUseAuthorization];
    
    myMapView.showsUserLocation = YES;
//    myMapView.userTrackingMode = MKUserTrackingModeFollow;
   
    [locationManager startUpdatingLocation];
    
    }


-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    for (CLLocation* location in locations)
    {
        NSLog(@"%f, %f", location.coordinate.latitude, location.coordinate.longitude);
        
        
        MKCoordinateRegion region = MKCoordinateRegionMake(location.coordinate, MKCoordinateSpanMake(1.0, 1.0));
        [myMapView setRegion:region animated:YES];
        
        for (int i = 0; i < 10; i++)
        {
            
            Annotation * annotation = [[Annotation alloc] init];
            
            float randomLat = (arc4random_uniform(100) - 50.0) / 100 + location.coordinate.latitude;
            
            float randomLong = (arc4random_uniform(100) - 50.0) / 100 + location.coordinate.longitude;
            
            CLLocationCoordinate2D  randomCoordinate = CLLocationCoordinate2DMake(randomLat, randomLong);
            
            
            CLLocation *  randomLocation = [[CLLocation alloc] initWithLatitude:randomCoordinate.latitude longitude:randomCoordinate.longitude];
            
            CLGeocoder * geoCoder = [[CLGeocoder alloc] init];
           
            
            [annotation setCoordinate:randomCoordinate];
        
            
            [geoCoder reverseGeocodeLocation:randomLocation completionHandler:^(NSArray *placemarks, NSError *error) {
                
                for (CLPlacemark * placemark in placemarks)
                {
                    //  NSLog(@"%@", placemark.addressDictionary);
                    
                    
                    [annotation setTitle:placemark.addressDictionary[@"City"]];
                    
                }
                
                
            }];
            
            [annotation setTitle:@"Title"];
            
            [myMapView addAnnotation: annotation];
            
            
        }
        
        
    }
    
    [locationManager stopUpdatingLocation];
}


// this is where i would find locations of users


- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    
    Annotation * ann = annotation;
    
    if  (mapView.userLocation.location.coordinate.latitude == ann.coordinate.latitude && mapView.userLocation.location.coordinate.longitude == ann.coordinate.longitude)
    {
        
        
        
        
    } else {
        
        MKPinAnnotationView * annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"pin"];
        
        annotationView.draggable = YES;
        
        
        NSArray * markers = @[@(MKPinAnnotationColorRed),@(MKPinAnnotationColorPurple),@(MKPinAnnotationColorGreen)];
        
        int randomMarker = arc4random_uniform((int)markers.count);
        
        annotationView.pinColor = (MKPinAnnotationColor)[markers[randomMarker] intValue];
        
        annotationView.canShowCallout = YES;
    
        
        return annotationView;
        
    }
    
    return nil;
    
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

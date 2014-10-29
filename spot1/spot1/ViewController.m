//
//  ViewController.m
//  spot1
//
//  Created by Merritt Tidwell on 10/27/14.
//  Copyright (c) 2014 Merritt Tidwell. All rights reserved.
//
//create a pfobject to see if users are there.
// they can either check in or nt c

//times out


#import "ViewController.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "Annotation.h"
#import <Parse/Parse.h>
#import "buildAVenueVC.h"
#import "TailGateDetail.h"
#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height

@interface ViewController () <MKMapViewDelegate, CLLocationManagerDelegate>

@end

@implementation ViewController{

    MKMapView * mapView;
    CLLocationManager * locationManager;
    UIButton * annotateButton;
    PFObject * venueInfo;
    NSMutableArray * venuesInfo;
    PFObject * tailgateOption;
    Annotation * annotation;

    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    mapView = [[MKMapView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    mapView.delegate = self;
    mapView.showsUserLocation = YES;
    mapView.zoomEnabled = YES;
    [self.view addSubview:mapView];
    
   
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    [locationManager requestWhenInUseAuthorization];
    [locationManager startUpdatingLocation];

    
    
    annotateButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 30, 40, 40)];
    annotateButton.backgroundColor = [UIColor blackColor];
    [annotateButton addTarget:self action:@selector(buttonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:annotateButton];
    
    


   [self getAllVenues];

}
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    if ([locations count] < 1) {
        return;
    }
    
    [locationManager stopUpdatingLocation];
    
    CLLocation* location = locations[0];
    NSLog(@"Actually found more than one (aka) %d locations", (int)[locations count]);
    [self showUserLocation:location];
    
}




-(void)showUserLocation:(CLLocation*)location
{
    MKCoordinateRegion region = MKCoordinateRegionMake(location.coordinate, MKCoordinateSpanMake(1.0, 1.0));
    [mapView setRegion:region animated:YES];
}

-(void)populatePinsOnMapForEvents
{
    [mapView removeAnnotations:mapView.annotations];
    
    for (venueInfo in venuesInfo) {
        
        PFGeoPoint * location = venueInfo[@"VenueLocation"];
        
        NSLog(@"location %@",location);
  
    annotation = [[Annotation alloc] init];
        CLLocationCoordinate2D venueCoord = CLLocationCoordinate2DMake(location.latitude, location.longitude);
        //        CLLocation *  eventLoc = event.getLocation;
        //        CLGeocoder * geoCoder = [[CLGeocoder alloc] init];
        
        
        annotation.title = venueInfo[@"TailgateName"];
    
        
        
        [annotation setCoordinate:venueCoord];
        
        [mapView addAnnotation: annotation];
    }
}



- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
 //   Annotation * ann = annotation;
    
    if  (mapView.userLocation.location.coordinate.latitude == annotation.coordinate.latitude
         && mapView.userLocation.location.coordinate.longitude == annotation.coordinate.longitude)
    {
        
    } else {
        MKPinAnnotationView * annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"pin"];
        annotationView.draggable = NO;
        
        NSArray * markers =
        
            @[@(MKPinAnnotationColorRed),
              @(MKPinAnnotationColorPurple),
              @(MKPinAnnotationColorGreen)];
      
        int randomMarker = arc4random_uniform((int)markers.count);
      
        
        annotationView.pinColor = (MKPinAnnotationColor)[markers[randomMarker] intValue];
        annotationView.canShowCallout = YES;
       
        UIButton* rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        annotationView.rightCalloutAccessoryView = rightButton;
     
        return annotationView;
    }
    return nil;
}




-(void)getAllVenues
{
    
    // only query tickets that use currents users location and current users category wants//
    
    
    PFQuery *query = [PFQuery queryWithClassName:@"VenueDetails"];
    [query includeKey:@"objectID"];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        venuesInfo = [objects mutableCopy];
        for (int i=0; i<objects.count; i++) {
            tailgateOption = objects[i];
            NSLog(@"first tailagate option %@", tailgateOption);
        }
        [self populatePinsOnMapForEvents];
        
    }];
    
    NSLog(@" first after loop tailagate option %@", tailgateOption);

}



- (void)mapView:(MKMapView *)mapView
didSelectAnnotationView:(MKAnnotationView *)view
{

    
    
    
   // TailGateDetail * TailGateVc = [[TailGateDetail alloc]init];
    
    
    //self presentViewController:TailGateVc animated:NO completion:nil];
    

  
    
    NSLog(@" did select accesorry%@",tailgateOption[@"TailgateName"]);

    


}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view
calloutAccessoryControlTapped:(UIControl *)control
{
 
    
    
    
  
}





-(void)buttonPressed{

   
    buildAVenueVC *viewController = [[buildAVenueVC alloc] init];
    [self presentViewController:viewController animated:YES completion:nil];
    
    
}








@end

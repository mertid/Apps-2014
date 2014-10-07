//
//  MCSViewController.m
//  My Cool Spots
//
//  Created by Merritt Tidwell on 8/18/14.
//  Copyright (c) 2014 Merritt Tidwell. All rights reserved.
//

#import "MCSViewController.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "MCSAnnotation.h"
#import "MCSTableTableViewController.h"

@interface MCSViewController () <CLLocationManagerDelegate, MKMapViewDelegate>

@end

@implementation MCSViewController
{
    MKMapView * myMapView;
    CLLocationManager * locationManager;
    MKMapCamera * mapCamera;
    MCSTableTableViewController * tableVC;


}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImageView * logo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"4^2"]];
    
    logo.frame = CGRectMake(0, 20, 70, 70);
    
    logo.center = self.navigationController.navigationBar.center;
    
    [self.navigationController.navigationBar addSubview:logo];

    
    
    myMapView = [[MKMapView alloc] initWithFrame:CGRectMake(0, 0, 320, 280)];
    
    myMapView.delegate = self;
    [self.view addSubview:myMapView];
    myMapView.showsUserLocation = YES;
    myMapView.delegate = self;
 
    //    mapView.userTrackingMode = YES;
    
    tableVC = [[MCSTableTableViewController alloc]init];
    
    tableVC.tableView.frame = CGRectMake(0, 320, 320, 280);
    
    tableVC.tableView.backgroundColor = [UIColor whiteColor];
    
    [tableVC.tableView setSeparatorColor:[UIColor colorWithRed:0.000f green:0.651f blue:0.910f alpha:1.0f]];
    
    [self.view addSubview:tableVC.tableView];
    
 
    
    
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    [locationManager startUpdatingLocation]; }

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    for (CLLocation* location in locations)
    {
        NSLog(@"%f, %f", location.coordinate.latitude, location.coordinate.longitude);
        
        //call ForSquareRequest and create annotations foe each venue
        
        //
        
        MKCoordinateRegion region = MKCoordinateRegionMake(location.coordinate, MKCoordinateSpanMake(1.0, 1.0));
        [myMapView setRegion:region animated:YES];
        
        for (int i = 0; i < 10; i++)
        {
            
            MCSAnnotation * annotation = [[MCSAnnotation alloc] init];
            
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

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    
    MCSAnnotation * ann = annotation;
    
    if  (mapView.userLocation.location.coordinate.latitude == ann.coordinate.latitude && mapView.userLocation.location.coordinate.longitude == ann.coordinate.longitude)
    {
        
        
        
        
    } else {
        
        MKPinAnnotationView * annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"pin"];
        
        annotationView.draggable = YES;
        
        
        NSArray * markers = @[
                              r
                              [UIImage imageNamed:@"pink"],
                              [UIImage imageNamed:@"blue"],
                              [UIImage imageNamed:@"green"]
                              ];
        
        
        
        int randomMarker = arc4random_uniform((int)markers.count);
        
        annotationView.image = markers[randomMarker];
        
        annotationView.canShowCallout = YES;
        
        
        UIButton * rightCallout = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        
        [rightCallout addTarget:self action:@selector(showDetailVC) forControlEvents:UIControlEventTouchUpInside];
        
        
        annotationView.rightCalloutAccessoryView = rightCallout;
        
        
        return annotationView;
        
    }
    
    return nil;
    
}
- (void)showDetailVC
{
    UIViewController * detailvc = [[UIViewController alloc] init];
    detailvc.view.backgroundColor = [UIColor whiteColor];
    
    [self.navigationController pushViewController:detailvc animated:YES];
    




}

-(BOOL)prefersStatusBarHidden

{return YES;
}

@end

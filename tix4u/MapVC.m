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
#import "Annotation.h"
#import "tix4u-swift.h"

@interface MapVC() <MKMapViewDelegate, CLLocationManagerDelegate, UITableViewDelegate, UITableViewDataSource>

@end

@implementation MapVC
{
    __weak IBOutlet UITableView *salesTableView;
    MKMapView * myMapView;
    CLLocationManager * locationManager;
    NSArray* sellersInfo;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden = false;
    
    salesTableView.delegate = self;
    salesTableView.dataSource = self;
    //[salesTableView registerClass:[SaleCell class] forCellReuseIdentifier:@"saleCell"];
    salesTableView.rowHeight = 55;
    
    float w = self.view.bounds.size.width;
    float h = self.view.bounds.size.height;
    
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    [locationManager requestWhenInUseAuthorization];
    
    myMapView = [[MKMapView alloc] initWithFrame:CGRectMake(0, 0, w, h/2)];
    myMapView.delegate = self;
    myMapView.showsUserLocation = YES;
    [self.view addSubview:myMapView];
    
    [locationManager startUpdatingLocation];
    
    [self getAllSellingTickets];
    
    UIButton * cancelButton = [[UIButton alloc]initWithFrame:(CGRectMake(35, 40, 30, 30))];
    cancelButton.backgroundColor = [UIColor redColor];
    [cancelButton addTarget:self action:@selector(cancelButtonWasPressed) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:cancelButton];
}

-(void)getAllSellingTickets
{
    /*
    [EventfulRequest eventfulRequest:@"events/search" parameters:@"category=music&location=Atlanta&date=Today" completion:^(NSArray * events) {
        if (events.count > 0) {
            sellersInfo = events;
            [salesTableView reloadData];
            [self populatePinsOnMapForEvents];
        } else {
            NSLog(@"No events were found");
        }
    }];
    */
    
    PFQuery *query = [PFQuery queryWithClassName:@"Selling"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        sellersInfo = objects;
        for (int i=0; i<objects.count; i++) {
            PFObject* saleOption = objects[i];
            NSLog(@"%@", saleOption);
        }
        [salesTableView reloadData];
    }];
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
    
    [self populatePinsOnMapForEvents];
}

-(void)showUserLocation:(CLLocation*)location
{
    MKCoordinateRegion region = MKCoordinateRegionMake(location.coordinate, MKCoordinateSpanMake(1.0, 1.0));
    [myMapView setRegion:region animated:YES];
}

-(void)populatePinsOnMapForEvents
{
    [myMapView removeAnnotations:myMapView.annotations];
    
    for (Event* event in sellersInfo) {
        
        Annotation * annotation = [[Annotation alloc] init];
        CLLocationCoordinate2D eventCoord = [event getCoordinate];
        CLLocation *  eventLoc = event.getLocation;
        CLGeocoder * geoCoder = [[CLGeocoder alloc] init];
        [annotation setCoordinate:eventCoord];
        
        [geoCoder reverseGeocodeLocation:eventLoc completionHandler:^(NSArray *placemarks, NSError *error) {
            
            for (CLPlacemark * placemark in placemarks)
            {
                //  NSLog(@"%@", placemark.addressDictionary);
                [annotation setTitle:placemark.addressDictionary[@"City"]];
            }
        }];
        
        [annotation setTitle:event.title];
        [myMapView addAnnotation: annotation];
    }
}

// this is where i would find locations of users
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    Annotation * ann = annotation;
    
    if  (mapView.userLocation.location.coordinate.latitude == ann.coordinate.latitude
         && mapView.userLocation.location.coordinate.longitude == ann.coordinate.longitude)
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

-(void)cancelButtonWasPressed
{
    [self dismissViewControllerAnimated:YES completion:nil];

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SaleCell* cell = [salesTableView dequeueReusableCellWithIdentifier:@"saleCell" forIndexPath: indexPath];
    
    PFObject* sellingOption = sellersInfo[indexPath.row];
    
    cell.ticketLabel.text = @"Tickets";
    cell.ratingLabel.text = @"My seller is aweseome";
    cell.sectionLable.text = sellingOption[@"Section"];
    cell.sellerNameLabel.text = sellingOption[@"SellerID"];
    
    //   cell.profileImage.image =
    //        let seller = sellersInfo[indexPath.row]
    //println("eventInfo \(eventInfo)")
    // let mainText = sellerInfo.title //"\(eventInfo.latitude), \(eventInfo.longitude)"
    // cell.textLabel?.text = mainText
    // cell.detailTextLabel?.text = eventInfo.venueName
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return sellersInfo.count;
}

@end

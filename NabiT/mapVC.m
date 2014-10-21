//
//  mapVC.m
//  NabiT
//
//  Created by Merritt Tidwell on 10/13/14.
//  Copyright (c) 2014 Merritt Tidwell. All rights reserved.
//

#import "mapVC.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import <Parse/Parse.h>
#import "SaleCell.h"
#import "SMSSeller.h"
#import "Annotation.h"
#import "Sell.h"
@interface mapVC () <UITableViewDataSource, UITableViewDelegate,CLLocationManagerDelegate, MKMapViewDelegate>

@end

@implementation mapVC{
    MKMapView * myMapView;
    CLLocationManager * locationManager;
    NSMutableArray * sellersInfo;
    NSArray * sellers;
   // NSString * SellerName;
}



- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.navigationController.navigationBarHidden = true;
    
    // Do any additional setup after loading the view.
    self.salesTableView.delegate = self;
    self.salesTableView.dataSource = self;
    self.salesTableView.backgroundColor = [UIColor colorWithRed:0.118f green:0.714f blue:0.878f alpha:1.0f];
    
    
    float w = self.view.bounds.size.width;
    float h = self.view.bounds.size.height;
   
    myMapView = [[MKMapView alloc] initWithFrame:CGRectMake(0, 0, w, h/2)];
    myMapView.delegate = self;
    myMapView.showsUserLocation = YES;
    myMapView.zoomEnabled = YES;
    [self.view addSubview:myMapView];
    
    
    
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    [locationManager requestWhenInUseAuthorization];
    [locationManager startUpdatingLocation];
    
    [self getAllSellingTickets];

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
    [myMapView setRegion:region animated:YES];
}

-(void)populatePinsOnMapForEvents
{
    [myMapView removeAnnotations:myMapView.annotations];
    
    for (PFObject * sellerInfo in sellersInfo) {
        
        PFGeoPoint * location = sellerInfo[@"Location"];
        
        NSLog(@"location %@",location);
        
        Annotation * annotation = [[Annotation alloc] init];
        CLLocationCoordinate2D eventCoord = CLLocationCoordinate2DMake(location.latitude, location.longitude);
//        CLLocation *  eventLoc = event.getLocation;
//        CLGeocoder * geoCoder = [[CLGeocoder alloc] init];
        
        
        
        [annotation setCoordinate:eventCoord];
        
//        [geoCoder reverseGeocodeLocation:eventLoc completionHandler:^(NSArray *placemarks, NSError *error) {
//            
//            for (CLPlacemark * placemark in placemarks)
//            {
//                //  NSLog(@"%@", placemark.addressDictionary);
//                [annotation setTitle:placemark.addressDictionary[@"Event"]];
//            }
//        }];
        
  //      [annotation setTitle:event.title];
        [myMapView addAnnotation: annotation];
    }
}


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




-(void)getAllSellingTickets
{
    
    // only query tickets that use currents users location and current users category wants//
    
    
    
    PFQuery *query = [PFQuery queryWithClassName:@"TicketsForSale"];
    [query includeKey:@"SellerID"];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        sellersInfo = [objects mutableCopy];
        for (int i=0; i<objects.count; i++) {
            PFObject* saleOption = objects[i];
            NSLog(@"%@", saleOption);
        }
        [self.salesTableView reloadData];
        [self populatePinsOnMapForEvents];

    }];
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SaleCell* cell = [self.salesTableView dequeueReusableCellWithIdentifier:@"saleCell" forIndexPath: indexPath];
    
    PFObject* sellingOption = sellersInfo[indexPath.row];

    PFObject* seller = sellingOption[@"SellerID"];

  //  cell.sellerNameLabel.text = seller[@"username"];
   // cell.priceLabel.text = sellingOption[@"PriceForTicket"];
    cell.eventsLabel.text = sellingOption[@"Event"];
    cell.numberOfTicketsLabel.text = sellingOption[@"NumberOfTicketsSelling"];
   
    
    
    // cell.sectionLabel.text = sellingOption[@"Section"];
    
    
    NSLog(@"username is %@",seller[@"username"]);
    NSLog(@"phone is %@", seller[@"phone"]);
    
    
       return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
  
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return sellersInfo.count;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    NSIndexPath * indexPath = [self.salesTableView indexPathForCell:(UITableViewCell *)sender];
    
    PFObject* sellingOption = sellersInfo[indexPath.row];

    SMSSeller * sellerVC = (SMSSeller *)[segue destinationViewController];
    
    
    sellerVC.sellerInfo = sellingOption;
}

- (IBAction)backButtonPressed:(id)sender {


    [self dismissViewControllerAnimated:YES completion:nil];

}


@end

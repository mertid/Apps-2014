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
#import "BuySellDetailMapTVC.h"
#import "tabBar.h"



@interface MapVC() <MKMapViewDelegate, CLLocationManagerDelegate>

@end

@implementation MapVC
{
    MKMapView * myMapView;
    BuySellDetailMapTVC * tableVC;
    CLLocationManager * locationManager;
    tabBar * mytabBar;
    
}

- (void)viewDidLoad {
 

    [super viewDidLoad];

    
    myMapView = [[MKMapView alloc] initWithFrame:CGRectMake(0, 0, 320, 280)];
    myMapView.delegate = self;
    [self.view addSubview:myMapView];
    myMapView.showsUserLocation = YES;
    myMapView.delegate = self;
    
    tableVC = [[BuySellDetailMapTVC alloc]init];
    
    tableVC.tableView.frame = CGRectMake(0, 260, 320, 300);
    
    tableVC.tableView.backgroundColor = [UIColor whiteColor];
    
    [tableVC.tableView setSeparatorColor:[UIColor colorWithRed:0.000f green:0.651f blue:0.910f alpha:1.0f]];
    
    [self.view addSubview:tableVC.tableView];
    
    
    
    
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    [locationManager startUpdatingLocation];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

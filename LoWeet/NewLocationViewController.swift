//
//  NewLocationViewController.swift
//  LoWeet
//
//  Created by Merritt Tidwell on 9/15/14.
//  Copyright (c) 2014 Merritt Tidwell. All rights reserved.
//

import UIKit
import CoreLocation

class NewLocationViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var tweetTextView: UITextView!
    @IBOutlet weak var locationLabel: UILabel!
    
    let locationManager = CLLocationManager()
    var currentCoordinate:CLLocationCoordinate2D!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        if CLLocationManager.authorizationStatus() == CLAuthorizationStatus.NotDetermined {
            
           locationManager.requestWhenInUseAuthorization()
            
            //CLLocationManager.requestWhenInUseAuthorization(locationManager)
        }
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.distanceFilter = 50
        locationManager.startUpdatingLocation()
    }
    
    @IBAction func saveNewLocation(sender: AnyObject) {
    
        LocationData.mainData().addLocation([
        "latitude" : self.currentCoordinate.latitude,
        "longitude": self.currentCoordinate.longitude,
        "tweet"    : self.tweetTextView.text
        ])
    }

    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        
        for location in locations {
            
            currentCoordinate = (location as CLLocation).coordinate
            
            println(currentCoordinate)
            
        }
        
        
    }
}

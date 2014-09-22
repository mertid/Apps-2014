//
//  MapLocViewController.swift
//  LoWeet
//
//  Created by Merritt Tidwell on 9/15/14.
//  Copyright (c) 2014 Merritt Tidwell. All rights reserved.
//


import UIKit
import MapKit



class MapLocViewController: UIViewController {

    @IBOutlet weak var locationMapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()

        let nc = NSNotificationCenter.defaultCenter()
        nc.addObserverForName("tweetLocationsUpdated", object: nil, queue: NSOperationQueue.mainQueue()) { (notification: NSNotification!) -> Void in
            self.markUpTheMap()
        }
    
    
    }


    func markUpTheMap() {
        
        for location in LocationData.mainData().tweetLocations {
           
           var marker = Marker()
            
            var coordinate = CLLocationCoordinate2D(latitude:location["latitude"]! as CLLocationDegrees, longitude: location["longitude"]! as CLLocationDegrees)
            
            marker.setCoordinate(coordinate)
            
            self.locationMapView.addAnnotation(marker)
         
            
            
        }
        
    }


}

//
//  Event.swift
//  tix4u
//
//  Created by Heidi Proske on 10/8/14.
//  Copyright (c) 2014 Merritt Tidwell. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class Event: NSObject {
   
    var title: String? //title = "Check Out Music Program";
    var startTime: NSDate? //"start_time" = "2014-10-02 20:00:00";
    var venueName: String? //"venue_name" = "Smith's Olde Bar";
    
    var latitude: NSString? //latitude = "33.7975402";
    var longitude: NSString? //longitude = "-84.3686369";
    
    func getCoordinate() -> CLLocationCoordinate2D {
        if let lat = latitude {
            if let lon = longitude {
                return CLLocationCoordinate2DMake(lat.doubleValue, lon.doubleValue)
            }
        }
        return CLLocationCoordinate2DMake(0,0)
    }
    
    
    func getLocation() -> CLLocation {
        let coord = getCoordinate()
        return CLLocation(latitude: coord.latitude, longitude: coord.longitude)
    }
}

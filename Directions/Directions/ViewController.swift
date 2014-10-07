//
//  ViewController.swift
//  Directions
//
//  Created by Merritt Tidwell on 10/7/14.
//  Copyright (c) 2014 Merritt Tidwell. All rights reserved.
//

import UIKit

import MapKit

import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate {
    
    
    var locationManager = CLLocationManager()
    
    @IBAction func route(sender: AnyObject) {
        
    
        let address = addressField.text
        
        var geoCoder = CLGeocoder()
        
        geoCoder.geocodeAddressString(address, completionHandler: { (placemarks, error) -> Void in
            
            if (placemarks.count > 0)
            {
                self.findRoute(placemarks[0] as CLPlacemark)
            }
            
        })
        
    
    }
    
    func findRoute(placemark:CLPlacemark)
    {
    
     let mkPlacemark = MKPlacemark(placemark: placemark)
     let start = MKMapItem.mapItemForCurrentLocation()
     let end = MKMapItem(placemark: mkPlacemark)
    
        var directionsRequest = MKDirectionsRequest()
        
        directionsRequest.setSource(start)
        directionsRequest.setDestination(end)
        
        var directions = MKDirections(request: directionsRequest)
        directions.calculateDirectionsWithCompletionHandler { (directionsResponse, error) -> Void in
           
            if directionsResponse.routes.count > 0 {
               
                var route = directionsResponse.routes[0] as MKRoute
                
                self.routingMap.addOverlay(route.polyline)
            }
        }
        
        
    }
    func mapView(mapView: MKMapView!, rendererForOverlay overlay: MKOverlay!) -> MKOverlayRenderer! {
        
        var routeRenderer = MKPolylineRenderer(overlay: overlay)
        routeRenderer.strokeColor = UIColor.purpleColor()
        routeRenderer.lineWidth = 2
        
        return routeRenderer
    
    }
    
    @IBOutlet weak var addressField: UITextField!
    @IBOutlet weak var routingMap: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        locationManager.requestWhenInUseAuthorization()
        routingMap.showsUserLocation = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

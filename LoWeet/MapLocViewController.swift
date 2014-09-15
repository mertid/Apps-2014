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

        // Do any additional setup after loading the view.
   
    
    
    
    }


    func markUpTheMap() {
        
        for location in LocationData.mainData().locations {
           
            var annotation: MKAnnotation!
            
        
        
        }
        
    }


}

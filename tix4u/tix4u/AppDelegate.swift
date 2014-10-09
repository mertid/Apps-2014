//
//  AppDelegate.swift
//  tix4u
//
//  Created by Heidi Proske on 10/9/14.
//  Copyright (c) 2014 Merritt Tidwell. All rights reserved.
//

import Foundation


import UIKit

let PARSE_APP_ID = "gXOiGkvm5G4pFLT5xfbNr6h6BLfM2IkvOaRw1wGe"
let PARSE_CLIENT_ID = "2Y89k0epT75rHpJZknoiF0lrtb4HfvEoBEfUFVPZ"

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        
        Parse.setApplicationId(PARSE_APP_ID, clientKey:PARSE_CLIENT_ID)
        PFUser.enableAutomaticUser() // TODO temp take this out ... we just want to create temp login while FB bug is happening
        /*

        return true
    }
    
}



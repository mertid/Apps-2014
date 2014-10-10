//
//  AppDelegate.swift
//  tix4u
//
//  Created by Heidi Proske on 10/9/14.
//  Copyright (c) 2014 Merritt Tidwell. All rights reserved.
//

/* 

1) Update picker list of event names for the Seller to pull from Eventful by using something like: 
http://api.eventful.com/json/events/search?app_key=Pdv5pkc3G4tF3TCB&where=32.746682,-117.162741&within=25

                get current location for seller from the CLLocationManager
                As soon as I "press sell on BUYvs.Sell screen" I need to get userlocation than the API list will populate based on that geo point

2) Need a Parse class "Event" which contains some properties:
- eventLocation GeoPoint (of venue)
- venueName
- eventName
- eventDateTime

3) Ticket class currently has 'event' (string) property. Instead it
needs to be a pointer to the 'Event' class. 

4) Ticket class (representing sellers tickets) needs to have a new GeoPoint
'sellerLocation' column that must contain the sellers current location.

5) Buyer logs in, say event that they're interested in:
    1) Fetch all tickets in 'Ticket' table (but you also have to look up event venue location (i.e. Event class column eventLocation) and make sure that GeoPoint is within a 50m radius.

6) Get messaging working by copying our txt4u app.

*/

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

        return true
    }
    
}



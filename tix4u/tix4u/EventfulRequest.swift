//
//  EventfulRequest.swift
//  tix4u
//
//  Created by Heidi Proske on 10/8/14.
//  Copyright (c) 2014 Merritt Tidwell. All rights reserved.
//

import UIKit

let EV_API_URL = "http://api.eventful.com/json/"
let EV_APP_KEY = "Pdv5pkc3G4tF3TCB"
let eventStartTimeDateFormatter = NSDateFormatter() //TODO check this is the right way to have static class constant/var?

class EventfulRequest: NSObject {
    
    override init() {
        eventStartTimeDateFormatter.locale = NSLocale.currentLocale()
        eventStartTimeDateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    }
    /*
    func findEventsWithLocation(location: CLLocation, completion: ((venues: NSArray) -> void)
    +(NSArray *)getVenuesAroundLatitude:(float)latitude AndLongitude:(float)longitude ForRadius:(int)radius;
    */
    class func eventfulRequest(endpoint: String, parameters: String, completion: ((events: [Event]) -> Void)?) {
        
        let urlString = EV_API_URL + endpoint + "?app_key=" + EV_APP_KEY + "&" + parameters
        println("About to make Eventful request to \(urlString)")
        let request = NSURLRequest(URL: NSURL(string: urlString))
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) { (response, data, error) -> Void in
            
            if error != nil {
                println(error.userInfo)
                
                //TODO Cater for this error you saw when you had bad wifi connection!
                /*
                
                Optional([NSLocalizedDescription: The Internet connection appears to be offline.,
                NSErrorFailingURLStringKey: http://api.eventful.com/json/events/search?app_key=Pdv5pkc3G4tF3TCB&category=music&location=Atlanta&date=Today,
                NSErrorFailingURLKey: http://api.eventful.com/json/events/search?app_key=Pdv5pkc3G4tF3TCB&category=music&location=Atlanta&date=Today,
                _kCFStreamErrorDomainKey: 12,
                _kCFStreamErrorCodeKey: 8,
                NSUnderlyingError: Error Domain=kCFErrorDomainCFNetwork Code=-1009 "The Internet connection appears to be offline." UserInfo=0x7f99f48424e0 {NSErrorFailingURLStringKey=http://api.eventful.com/json/events/search?app_key=Pdv5pkc3G4tF3TCB&category=music&location=Atlanta&date=Today,
                NSErrorFailingURLKey=http://api.eventful.com/json/events/search?app_key=Pdv5pkc3G4tF3TCB&category=music&location=Atlanta&date=Today,
                _kCFStreamErrorCodeKey=8,
                _kCFStreamErrorDomainKey=12,
                NSLocalizedDescription=The Internet connection appears to be offline.}])
                fatal error: unexpectedly found nil while unwrapping an Optional value
                */
            }
            
            if data == nil {
                println("We have no data... see error above!")
                return;
            }
            
            var jsonError: NSError?
            var json = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.allZeros, error: nil) as [String:AnyObject]
            println(json)
            
            if let errorInfo = jsonError {
                println(errorInfo.userInfo)
                return;
            }
            
            var events: [Event] = []
            
            let jsonEventsArray = json["events"]!["event"]! as [[String:AnyObject]]
            for currentEventDict in jsonEventsArray {
                //let currentEventDict = event
                println(currentEventDict)
                var nextEvent = Event()
                if let venueName = currentEventDict["venue_name"]! as? String {
                    nextEvent.venueName = venueName
                }
                
                nextEvent.title = currentEventDict["title"]! as? String
                nextEvent.latitude = currentEventDict["calendar_count"]! as? String //TODO put back latitude
                nextEvent.longitude = currentEventDict["longitude"]! as? String
                nextEvent.startTime = eventStartTimeDateFormatter.dateFromString(currentEventDict["start_time"]! as String)
                
                events.append(nextEvent)
            }
            
            if let c = completion {
                c(events: events)
            }
            
        }
    }
    
}

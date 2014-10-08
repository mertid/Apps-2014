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
            
            if data == nil && error != nil {
                println("We have no data... error \(error.userInfo)")
                return;
            }
            
            var jsonError: NSError?
            var json = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.allZeros, error: nil) as [String:AnyObject]
            //println(json)
            
            if let errorInfo = jsonError {
                println(errorInfo.userInfo)
                return;
            }
            
            var events: [Event] = []
            
            let jsonEventsArray = json["events"]!["event"]! as [[String:AnyObject]]
            for currentEventDict in jsonEventsArray {
                //println(currentEventDict)
                var nextEvent = Event()
                if let venueName = currentEventDict["venue_name"]! as? String {
                    nextEvent.venueName = venueName
                }
                
                nextEvent.title = currentEventDict["title"]! as? String
                nextEvent.latitude = currentEventDict["calendar_count"]! as? String //TODO put back latitude
                nextEvent.latitude = currentEventDict["latitude"]! as? String
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

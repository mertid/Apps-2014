//
//  TweetLOCTVController.swift
//  LoWeet
//
//  Created by Merritt Tidwell on 9/15/14.
//  Copyright (c) 2014 Merritt Tidwell. All rights reserved.
//

import UIKit
import CoreLocation



class TweetLOCTVController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let nc = NSNotificationCenter.defaultCenter()
        nc.addObserverForName("tweetLocationsUpdated", object: nil, queue: NSOperationQueue.mainQueue()) { (notification: NSNotification!) -> Void in
            self.tableView.reloadData()
        }
     }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return LocationData.mainData().locations.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("tweetLocationCell", forIndexPath: indexPath) as TweetLocTVC

        var tweetLocation = LocationData.mainData().locations[indexPath.row]
        
        if let tweet: AnyObject = tweetLocation["tweet"] {
            cell.tweetTextView.text = tweetLocation["tweet"]! as String
        }
        
        return cell
    }

}

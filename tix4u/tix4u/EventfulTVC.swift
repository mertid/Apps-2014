//
//  EventfulTVC.swift
//  tix4u
//
//  Created by Heidi Proske on 10/8/14.
//  Copyright (c) 2014 Merritt Tidwell. All rights reserved.
//

import UIKit

class EventfulTVC: UITableViewController {
    
    var events: [Event] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBarHidden = false
        tableView.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: "eventCell")
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("eventCell", forIndexPath: indexPath) as UITableViewCell
        
        let eventInfo = events[indexPath.row]
        println("eventInfo \(eventInfo)")
        
        let mainText = eventInfo.title //"\(eventInfo.latitude), \(eventInfo.longitude)"
        cell.textLabel?.text = mainText
        cell.detailTextLabel?.text = eventInfo.venueName
        
        return cell
    }
    
}

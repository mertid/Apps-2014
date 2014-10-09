//
//  EventfulTVC.swift
//  tix4u
//
//  Created by Heidi Proske on 10/8/14.
//  Copyright (c) 2014 Merritt Tidwell. All rights reserved.
//

import UIKit

class SalesTVC: UITableViewController {
    
    var sellersInfo: [AnyObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBarHidden = false
        tableView.registerClass(SaleCell.classForCoder(), forCellReuseIdentifier: "saleCell")
        self.tableView.rowHeight = 55
    

    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("saleCell", forIndexPath: indexPath) as SaleCell
        
        cell.ticketLabel?.text = "Tickets"
        cell.ratingLabel?.text = "My seller is aweseome"
        cell.sectionLable?.text = "Section 200"
        cell.sellerNameLabel?.text = "Merritt Tidwell"
    
        
    //   cell.profileImage.image =
        
        
//        let seller = sellersInfo[indexPath.row]
       
        //println("eventInfo \(eventInfo)")
        
       // let mainText = sellerInfo.title //"\(eventInfo.latitude), \(eventInfo.longitude)"
       // cell.textLabel?.text = mainText
       // cell.detailTextLabel?.text = eventInfo.venueName
        
        
        
        return cell
    }
    
}

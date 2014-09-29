//
//  tableVC.swift
//  LiveIBViews
//
//  Created by Merritt Tidwell on 9/26/14.
//  Copyright (c) 2014 Merritt Tidwell. All rights reserved.
//

import UIKit

class tableVC: UITableViewController {

    let items: [String] = ["hey", "what up", "you suck"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

  }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source


    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as TableViewCell

        //Configure the cell...

        cell.mainLabel.text = items[indexPath.row]
        
        return cell
    }
    

}

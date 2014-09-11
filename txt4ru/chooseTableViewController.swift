//
//  chooseTableViewController.swift
//  txt4ru
//
//  Created by Merritt Tidwell on 9/10/14.
//  Copyright (c) 2014 Merritt Tidwell. All rights reserved.
//

import UIKit

class chooseTableViewController: FriendsTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func cancelChoice(sender: AnyObject) {
  
        self.navigationController?.dismissViewControllerAnimated(true, completion: nil)
    
    
    
    }
   
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
      
        
  //     var myFriends = ((self.navigationController?.presentingViewController as UINavigationController).viewControllers[0] as FriendsTableViewController).friends
   
       
        // the bottom three lines are the above line explained
        
        
        var presentingNavC = self.navigationController?.presentingViewController as UINavigationController
        
        var friendsTVC = presentingNavC.viewControllers[0] as FriendsTableViewController
        
//        var myFriends = friendsTVC.friends
        
    
        friendsTVC.friends += [friends[indexPath.row]]
    
        
        
        var user = PFUser.currentUser()
        user["friends"] = friendsTVC.friends
        user.saveInBackground()
        
        
        
        
        self.navigationController?.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    
    override func viewWillAppear(animated: Bool) {
        
        
        super.viewWillAppear(animated)
        
        var friendQuery = PFUser.query()
        friendQuery.findObjectsInBackgroundWithBlock { (users: [AnyObject]!, error: NSError!) -> Void in
            self.friends = users as [PFUser]
            self.tableView.reloadData()
        }
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
